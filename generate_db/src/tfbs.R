#!/usr/bin/env Rscript
# users can either step through this file, or call this file with
# r -f example.R

# THIS ASSUMES THAT THE TESTHINT DATABASE EXISTS. The recipe for building that
# database is in ../dbInitialization/createHintTest.sql

# Source the libraries
CRAN_packages <- c("RPostgreSQL", "RUnit", "data.table", "optparse")
BIOC_packages <- c("GenomicRanges", "BiocParallel")
if (length(setdiff(CRAN_packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(CRAN_packages, rownames(installed.packages())),
                   repos = "https://cloud.r-project.org/")
}
if (length(setdiff(BIOC_packages, rownames(installed.packages()))) > 0) {
  install.packages("BiocManager", repos = "https://cloud.r-project.org/")
  BiocManager::install(setdiff(BIOC_packages, rownames(installed.packages())))
}

suppressPackageStartupMessages(library(GenomicRanges))
suppressPackageStartupMessages(library(RPostgreSQL))
suppressPackageStartupMessages(library(RUnit))
suppressPackageStartupMessages(library(BiocParallel))
suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library("optparse"))

printf <- function(...) print(noquote(sprintf(...)))

## source the DB functions
#-------------------------------------------------------------------------------
getDBConnection <- function(database) {
  port = "5432"
  driver = dbDriver("PostgreSQL")

  if (database == "trenatest") {
    user= "ben"
    password="ben_PASS"
    dbname="trenatest"
    host="bddsrds.globusgenomics.org"

  } else if (database == "fimo") {
    user= "trena"
    password="trena"
    dbname="fimo"
    host="bddsrds.globusgenomics.org"
  } else if (database == "test_wellington") {
    user = "trena"
    password = "trena"
    dbname = "testwellington"
    host = "bddsrds.globusgenomics.org"
  } else if (database == "test_hint") {
    user = "trena"
    password = "trena"
    dbname = "testhint"
    host = "bddsrds.globusgenomics.org"
  } else if (database == "test_piq") {
    user = "trena"
    password = "trena"
    dbname = "test_piq"
    host = "bddsrds.globusgenomics.org"
  } else {
    user = "trena"
    password = "trena"
    dbname = database
    host = "bddsrds.globusgenomics.org"
  }

  dbConnect(drv=driver, user=user, password=password, dbname=dbname, host=host,
            port=port)
} # getDBConnection

#-------------------------------------------------------------------------------
region.schema <- function()
{
  c("loc", "chrom", "start", "endpos")
} # region.schema
#-------------------------------------------------------------------------------
hit.schema <- function()
{
  c("loc", "fp_start", "fp_end","type", "name", "length",
    "strand", "sample_id", "method", "provenance",
    "score1", "score2", "score3", "score4", "score5", "score6")
} # hit.schema
#-------------------------------------------------------------------------------
databaseSummary <- function(dbConnection = db.wellington.test)
{
  region.count <- dbGetQuery(dbConnection, "select count(*) from regions")[1,1]
  hit.count <- dbGetQuery(dbConnection, "select count(*) from hits")[1,1]
  printf("%d hits in %d regions", hit.count, region.count)
} # databaseSummary
#-------------------------------------------------------------------------------
createEmptyDatabaseTables <- function(dbUser, dbName, dbConnection= db.wellington.test)
{
  sql_command <- paste('drop table regions;
  drop table hits;

  create table regions(loc varchar primary key,
  chrom varchar,
  start int,
  endpos int);

  grant all on table "regions" to ', dbUser, ';', '

  create table hits(loc varchar,
  type varchar,
  name varchar,
  length int,
  strand char(1),
  sample_id varchar,
  method varchar,
  provenance varchar,
  score1 real,
  score2 real,
  score3 real,
  score4 real,
  score5 real,
  score6 real);

  grant all on table "hits" to ', dbUser, ';', sep="")

  dbGetQuery(dbConnection, sql_command)
} # createEmptyDatabaseTables
#-------------------------------------------------------------------------------
appendToRegionsTable <- function(tbl, dbConnection=db.wellington.test)
{
  dbWriteTable(dbConnection, "regions", tbl, row.names=FALSE, append=TRUE)
} # appendToRegionsTable
#-------------------------------------------------------------------------------
appendToHitsTable <- function(tbl, dbConnection=db.wellington.test)
{
  dbWriteTable(dbConnection, "hits", tbl, row.names=FALSE, append=TRUE)
} # appendToHitsTable
#-------------------------------------------------------------------------------
fillToDatabase <- function(tbl.regions, tbl.hits,
                           dbConnection=db.wellington.test,
                           dbUser = "ben",
                           dbName = "testwellington")
{
  #createEmptyDatabaseTables(dbUser, dbName, dbConnection)
  appendToRegionsTable(tbl.regions, dbConnection)
  appendToHitsTable(tbl.hits, dbConnection)
}

# Table parsing funtion
#-------------------------------------------------------------------------------
readDataTable <- function(directory, sampleID, nrows=NA, chromosome=NA, method = "DEFAULT")
{
  # regular expression to match filename starting with sampleID and ending with
  # .bed
  pattern = paste(sampleID, ".*bed$", sep='')
  filename <- grep(pattern, list.files(directory), ignore.case=TRUE, v=TRUE)
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

}

# readDataTable
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
            if(!is.na(fimo.chromosome)){
                query <- sprintf("select * from fimo_hg38 where chrom='%s' and start >= %d and endpos <= %d",
                                 fimo.chromosome, min.pos, max.pos)

                # This is the actual FIMO query that gets the chosen chromosome
                tbl.fimo <- dbGetQuery(dbConnection, query)
                #colnames(tbl.fimo) <- c("motif", "chrom", "motif.start", "motif.end", "motif.strand",
                #                        "fimo.score","fimo.pvalue", "empty", "motif.sequence", "loc")

                colnames(tbl.fimo) <- c("motif", "chrom", "motif.start", "motif.end", "motif.strand",
                                        "fimo.score","fimo.pvalue", "empty", "motif.sequence")


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

                tbl.fimo$method <- method
                tbl.fimo$sample_id <- sampleID

                tbl.regions <- tbl.fimo[tbl.overlaps$queryHits,]
                tbl.regions <- cbind(tbl.regions,
                                     wellington.score=tbl.fp[tbl.overlaps$subjectHits, "score"],
                                     fp.start=tbl.fp[tbl.overlaps$subjectHits, "start"],
                                     fp.end=tbl.fp[tbl.overlaps$subjectHits, "end"])
            }
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

    # Format hits appropriately and return both tables in a list
    tbl.hits <- tbl.hits[, coi]
    colnames(tbl.hits) <- hit.schema()
    invisible(list(regions=tbl.regions, hits=tbl.hits))

} # splitTableIntoRegionsAndHits
#-------------------------------------------------------------------------------


# main BIOC file
#-------------------------------------------------------------------------------
fillAllSamplesByChromosome <- function(chromosome,
                                       dbConnection = db.wellington,
                                       fimo = db.fimo,
                                       minid = "temp.filler.minid",
                                       dbUser = "ben",
                                       dbTable = "testwellington",
                                       sourcePath = wellington.path,
                                       outputPath = wellington.path,
                                       isTest = FALSE,
                                       method = "DEFAULT",
                                       Fill_DB_Enable=FALSE)
{

  all.sampleIDs <- unlist(lapply(strsplit(list.files(sourcePath,"ENCSR.*.bed$", ignore.case = TRUE),".", fixed=TRUE), "[", 1))
  for(sampleID in all.sampleIDs){
    printf("---- %s (%s) (%d/%d)", sampleID, chromosome,
           grep(sampleID, all.sampleIDs), length(all.sampleIDs))

    if (isTest) {
      # nrow set for testing
      tbl.wellington <- readDataTable(sourcePath, sampleID, nrow = 10,
                                          chromosome, method = method)
    } else {
      tbl.wellington <- readDataTable(sourcePath, sampleID, NA,
                                          chromosome, method = method)
    }
    print("Data table read. Merging with Fimo...")

    # Make a check for the table rows; if there's none, then break the loop
    if(nrow(tbl.wellington) < 1){
        printf("No rows matching %s", chromosome)
        break
    }

    fimo.con <- getDBConnection(fimo)
    tbl <- mergeFimoWithFootprints(tbl.wellington, sampleID,
                                   dbConnection = fimo.con,
                                   method=method)
    dbDisconnect(fimo.con)

    library(data.table)
    fname=paste(outputPath,"/",dbTable,".",sampleID,".",chromosome,".csv",sep="")
    fwrite(tbl,fname, sep=",")

    #-----------------------------------------------------------------------------------------------
    # Below is to fill database with the data so please uncomment if that's what you want.
    #-----------------------------------------------------------------------------------------------

    if (Fill_DB_Enable == TRUE){

        print("Merged. Now splitting table to regions and hits...")
        x <- splitTableIntoRegionsAndHits(tbl, minid, method = method)
        printf("filling %d regions, %d hits for %s", nrow(x$regions),
               nrow(x$hits), sampleID)

        dbConnection.con <- getDBConnection(dbConnection)

        # Trim the tables using a subset
        regions.locs <- dbGetQuery(dbConnection.con, "select loc from regions")
        x$regions <- subset(x$regions, (!loc %in% regions.locs$loc))

        fillToDatabase(x$regions, x$hits, dbConnection.con, dbUser, dbTable)

        databaseSummary(dbConnection.con)
        #close the connection
        dbDisconnect(dbConnection.con)
    }
  } # for sampleID
  message(sampleID, " is completed")
} # fill.all.samples.by.chromosome
#-------------------------------------------------------------------------------

# THIS EXAMPLE USES THE BRAIN HINT OUTPUT MADE BY RUNNING make hint at /scratch/data/footprints
option_list = list(
  make_option(c("-i", "--input"),  type="character", help="Input directory path to your footprint files. You can supply this option or the bag option but not both."),
  make_option(c("-b", "--bag"),  type="character", help="BDBag path of your footprint files. You can supplythis option or the input option but not both."),
  make_option(c("-o", "--output"),  type="character", help="Output directory to your TFBS files"),
  make_option(c("-t", "--tissue"),  type="character", help="Tissue type of the footprints"),
  make_option(c("-m", "--method"),  type="character", help="Method used to generate footprints - Options include wellington or hint."),
  make_option(c("-s", "--seed"),  type="character", help="Footprints seed - Options include 16, or 20"),
  make_option(c("-w", "--workers"), type="integer", help="Number of worker threads to use", default=4 ),
  make_option(c("-e", "--eval"), action="store_true", default=FALSE, help="Run evaluation for only the first 10 lines in your footprints files." )
)
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(OptionParser(option_list=option_list))

tmp_dir = NA
if ( is.null(opt$o) ) {
    print_help(opt_parser)
    stop("Missing output path!\n")
} else {
    tmp_dir = paste(opt$o, "/tmp", sep="")
    if (!dir.exists(opt$o)) {
        dir.create(opt$o)
        dir.create(tmp_dir)
    } else {
        dir.create(tmp_dir)
    }
}

tissue <- NA
if ( is.null(opt$t) ) {
    print_help(opt_parser)
    stop("Missing tissue type!\n")
} else {
    tissue <- tolower(opt$t)
    tissue <- chartr(" ", "_", tissue)
}

method <- NA
if ( is.null(opt$m) ) {
    print_help(opt_parser)
    stop("Missing method!\n")
} else {
    method <- tolower(opt$m)
    if ( method != "wellington" & method != "hint") {
        print_help(opt_parser)
        stop("Missing method. Must be Wellington or Hint!\n")
    }
}

seed <- NA
if ( is.null(opt$s) ) {
    print_help(opt_parser)
    stop("Missing seed!\n")
} else {
    seed <- opt$s
    if (seed != "16" & seed != "20" ){
        print_help(opt_parser)
        stop("Missing seed. Must be 16 or 20!\n")
    }
}

if ( is.null(opt$i) & is.null(opt$b)) {
    print_help(opt_parser)
    stop("Missing input or BDBag path!\n")
} else {
    if (! is.null(opt$i)) {  ## input directory path
        print(list.files(opt$i))
        file.copy(paste(opt$i,"/",list.files(opt$i),sep=""), tmp_dir)
    } else {   ## BDBag path
        databag_path = paste(opt$b,"data", sep="/")
        file.copy(paste(databag_path,"/",list.files(databag_path, pattern=method),sep=""), tmp_dir)
    }
}

print(date())
#-------------------------------------------------------------------------------
# set path to hint output
data.path <- tmp_dir
output_path=paste(opt$o,"/TFBS_OUTPUT",sep="")
dir.create(output_path, showWarnings = FALSE)

#bdbag.path<-"/scratch/galaxy/test/alex_test"
#dir.create(bdbag.path, showWarnings = FALSE)
#-------------------------------------------------------------------------------
# establish database connections:
db <- paste("db.", method, sep="")
if(!exists(db))
    db <- paste(tissue, method, seed, sep="_")

if(!exists("db.fimo"))
    db.fimo <- "fimo"
#-------------------------------------------------------------------------------

if(!interactive()){
    #chromosomes <- paste0("chr",c(1:22,"X","Y","MT"))
    chromosomes <- paste0("chr",c(1:3))

    # Create parallel structure here
    register(MulticoreParam(workers = opt$w, stop.on.error = FALSE, log = TRUE), default = TRUE)

    minid <- paste(tissue, method, seed, ".minid", sep="_")
    # Run on all 24 possible chromosomes at once
    result <- bptry(bplapply(chromosomes,fillAllSamplesByChromosome,
             dbConnection = db,
             fimo = db.fimo,
             minid = minid,
             dbUser = "trena",
             dbTable = db,
             sourcePath = data.path,
             outputPath = output_path,
             isTest = opt$e,
             method = toupper(method),
             Fill_DB_Enable=FALSE))
}

#cmd=paste("tar -zcvf ", output_path, "/", db,".tar.gz ", sep="")
#system(cmd, intern = TRUE)
#unlink(output_path,recursive=TRUE)
#unlink(tmp_dir, recursive=TRUE)
#print(bpok(result))
#print("Database fill complete")
#print(date())
