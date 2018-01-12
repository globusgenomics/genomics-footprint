#-------------------------------------------------------------------------------
readDataTable <- function(directory, sampleID, nrows=NA, chromosome=NA, method = "DEFAULT")
{
  # regular expression to match filename starting with sampleID and ending with 
  # .bed
  pattern = paste(sampleID, ".*bed$", sep='')
  filename <- grep(pattern, list.files(directory), v=TRUE)
  full.path <- file.path(directory, filename)
  
  if(!file.exists(full.path))
    return(data.frame)


  tbl <- read.table(full.path, sep="\t", as.is=TRUE)

    # Read it differently if it's PIQ
    if(method == "PIQ"){
        colnames(tbl) <- c("chrom", "motif.start", "motif.end", "motif", "motif.strand",
                           "score1", "score2", "score3", "score4");
        } else{
            colnames(tbl) <- c("chrom", "start", "end", "name", "score", "strand")
            # Make sure to select only these 6 columns
            tbl <- tbl[,c("chrom", "start", "end", "name", "score", "strand")]
        }
    
  #tbl$chrom <- paste("chr", tbl$chrom, sep="")
  if(!is.na(chromosome))
    tbl <- subset(tbl, chrom==chromosome)
  
  if(!is.na(nrows))
    tbl <- tbl[1:nrows,]
  
  invisible(tbl)
  
} # readDataTable
#-------------------------------------------------------------------------------
mergeFimoWithFootprints <- function(tbl.fp, sampleID, dbConnection = db.fimo, method = "DEFAULT")
{
  # reads in the name of the chromosome number from tbl.fp, which was previously broken up b chromosome
  chromosome <- unique(tbl.fp$chrom)
  # enforce treatment of just one chromosome at a time
  # A rationale Ben used was that by splitting this up by chromosome, you only need to have the FIMO data loaded into memory for 1 chromosome at a time (because FIMO DB is huge)
  # As such, in doing this merge, the function pulls the data from every sample for the same chromosome and, in series, performs the merge function
  # That it's in series is where I think an immediate speed-up can happen
  stopifnot(length(chromosome) == 1)

    if(method == "PIQ"){

        # PIQ is already merged; simply re-format it by adding loc
        tbl.fp$loc <- with(tbl.fp, sprintf("%s:%d-%d", chrom, motif.start, motif.end))
        tbl.fp$method <- "PIQ"
        tbl.fp$sample_id <- sampleID
        tbl.fp$fp.start <- NA
        tbl.fp$fp.end <- NA

        tbl.regions <- tbl.fp

        } else{
            # this may be unneccessary, but it also may slightly reduce the size of
            #each run by taking the min and max location of each footprint on the chromosome,
            #effectively cutting off the ends
            min.pos <- min(tbl.fp$start)
            max.pos <- max(tbl.fp$end)
            
            fimo.chromosome <- sub("chr", "", chromosome)
            query <- sprintf("select * from fimo_hg38 where chrom='%s' and start >= %d and endpos <= %d",
                             fimo.chromosome, min.pos, max.pos)
            
            # This is the actual FIMO query that gets the chosen chromosome
            tbl.fimo <- dbGetQuery(dbConnection, query)
            colnames(tbl.fimo) <- c("motif", "chrom", "motif.start", "motif.end", "motif.strand",
                                    "fimo.score","fimo.pvalue", "empty", "motif.sequence", "loc")
            
            tbl.fimo <- tbl.fimo[, -grep("empty", colnames(tbl.fimo))]
            tbl.fimo$chrom <- paste("chr", tbl.fimo$chrom, sep="")
    
            # Converts the FIMO data into a GenomicRanges object, making the intersection with footprints fast
            gr.fimo <- with(tbl.fimo, GRanges(seqnames=chrom, IRanges(start=motif.start, end=motif.end)))
      
            # --- get some footprints
            # Converts the footprints into GenomicRanges objects
            gr.wellington <- with(tbl.fp,   GRanges(seqnames=chrom, IRanges(start=start, end=end)))
            
            # the "within" is conservative. I will run this with "any" to increase
            #the number of motif interesects
            tbl.overlaps <- as.data.frame(findOverlaps(gr.fimo, gr.wellington, type="any"))

            # Comment out this line, which is no longer necessary and took a long time
#            tbl.fimo$loc <- with(tbl.fimo, sprintf("%s:%d-%d", chrom, motif.start, motif.end))
            tbl.fimo$method <- method
            tbl.fimo$sample_id <- sampleID
            
            tbl.regions <- tbl.fimo[tbl.overlaps$queryHits,]
            tbl.regions <- cbind(tbl.regions,
                                 wellington.score=tbl.fp[tbl.overlaps$subjectHits, "score"],
                                 fp.start=tbl.fp[tbl.overlaps$subjectHits, "start"],
                                 fp.end=tbl.fp[tbl.overlaps$subjectHits, "end"])
        }    
    
  invisible(tbl.regions)
  
} # mergeFimoWithFootprints
#-------------------------------------------------------------------------------
# I cant' explain this very well, but the output is actually two tables. One table is a running list of unique positions.
# The other table is more comprehensive, and includes all the info for the footprints and FIMO
splitTableIntoRegionsAndHits <- function(tbl, minid = "temp.filler.minid", method = "DEFAULT")
{
    # Split of the regions table; this is the same for all methods
    tbl.regions <- unique(tbl[, c("loc", "chrom", "motif.start", "motif.end")])
    colnames(tbl.regions) <- region.schema() # 29    
    # c("loc", "chrom", "motif_start", "motif_end")

    # Pull hits slightly differently
    if(method == "PIQ"){

        tbl.hits <- tbl
        coi <- c("loc", "fp.start", "fp.end", "type", "motif", "length",
                 "motif.strand", "sample_id", "method", "provenance",
                 "score1", "score2", "score3", "score4",
                 "score5", "score6")
    } else{
        tbl.hits <- tbl[, c("loc", "fp.start", "fp.end", "motif", "motif.strand", "sample_id", "method",         
                            "wellington.score", "fimo.score", "fimo.pvalue")]        
        tbl.hits$score4 <- NA
        coi <- c("loc", "fp.start", "fp.end", "type", "motif", "length",
                 "motif.strand", "sample_id", "method", "provenance",
                 "wellington.score", "fimo.score", "fimo.pvalue", "score4",
                 "score5", "score6")
    }
    
    # Add method-agnostic things
    tbl.hits$length <- with(tbl, 1 + motif.end - motif.start)
    tbl.hits$provenance <- minid   
    tbl.hits$score5 <- NA    
    tbl.hits$score6 <- NA    
    tbl.hits$type <- "motif.in.footprint"

    # Format hits appropriately and return both tables in a list
    tbl.hits <- tbl.hits[, coi]    
    colnames(tbl.hits) <- hit.schema()    
    invisible(list(regions=tbl.regions, hits=tbl.hits))
    
} # splitTableIntoRegionsAndHits    
#-------------------------------------------------------------------------------
