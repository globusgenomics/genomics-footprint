#---------------------------------------------------------------------------------------------------
#  Command: Rscript overlap_check.R file1 file2
#  This will print two lines for how many footprints and motifs are matched beween the input files.
#---------------------------------------------------------------------------------------------------

# Source the libraries
CRAN_packages <- "data.table"
BIOC_packages <- "GenomicRanges"

if (length(setdiff(CRAN_packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(CRAN_packages, rownames(installed.packages())),
                   repos = "https://cloud.r-project.org/")
}

if (as.numeric(R.version$minor) >= 5){
        if (length(setdiff(BIOC_packages, rownames(installed.packages()))) > 0) {
          install.packages("BiocManager", repos = "https://cloud.r-project.org/")
          BiocManager::install(setdiff(BIOC_packages, rownames(installed.packages())))
        }
}else{
        if (length(setdiff(BIOC_packages, rownames(installed.packages()))) > 0) {
                source("https://bioconductor.org/biocLite.R")
                biocLite(setdiff(BIOC_packages, rownames(installed.packages())))
        }
}

suppressPackageStartupMessages(library(data.table))
suppressPackageStartupMessages(library(GenomicRanges))

args = commandArgs(trailingOnly=TRUE)

file1<-args[1]; file2<-args[2]

bed1<-fread(file1); bed2<-fread(file2)


# footprints
fp0 <- with(bed1, GRanges(seqnames=chrom, IRanges(start=fp.start, end=fp.end)))
fp1 <- with(bed2, GRanges(seqnames=chrom, IRanges(start=fp.start, end=fp.end)))

fp.hits = findOverlaps(fp0, fp1,type="equal")

print(paste("file1:", nrow(bed1), "lines and file2:",nrow(bed2), "lines that have", summary(fp.hits)[1], "exact matches in footprints" , sep=" "))

# motifs
motif0 <- with(bed1, GRanges(seqnames=chrom, IRanges(start=motif.start, end=motif.end)))
motif1 <- with(bed2, GRanges(seqnames=chrom, IRanges(start=motif.start, end=motif.end)))

motif.hits = findOverlaps(motif0, motif1,type="equal")

print(paste("file1:", nrow(bed1), "lines and file2:",nrow(bed2), "lines that have", summary(motif.hits)[1], "exact matches in motifs" , sep=" "))
