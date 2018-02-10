# users can either step through this file, or call this file with
# r -f example.R

# THIS ASSUMES THAT THE TESTHINT DATABASE EXISTS. The recipe for building that
# database is in ../dbInitialization/createHintTest.sql

# THIS EXAMPLE USES THE BRAIN HINT OUTPUT MADE BY RUNNING make hint at /scratch/data/footprints

print(date())
#-------------------------------------------------------------------------------
# set path to hint output
data.path <- "/scratch/shared/footprints/urinary_bladder_hint_16"
output_path=paste(data.path,"/TFBS_OUTPUT",sep="")
dir.create(output_path, showWarnings = FALSE)
#-------------------------------------------------------------------------------
# establish database connections:

if(!exists("db.wellington"))
    db.wellington <- "urinary_bladder_hint_16"

if(!exists("db.fimo"))
    db.fimo <- "fimo"
#-------------------------------------------------------------------------------
# Source the libraries
source("/scratch/galaxy/test/generate_db/src/dependencies.R")
source("/scratch/galaxy/test/generate_db/src/dbFunctions.R")
source("/scratch/galaxy/test/generate_db/src/tableParsing.R")
source("/scratch/galaxy/test/generate_db/src/main_Bioc.R")

if(!interactive()){
    chromosomes <- paste0("chr",c(1:22,"X","Y","MT"))

    # Create parallel structure here
    library(BiocParallel)
    register(MulticoreParam(workers = 25, stop.on.error = FALSE, log = TRUE), default = TRUE)

    # Run on all 24 possible chromosomes at once
    result <- bptry(bplapply(chromosomes,fillAllSamplesByChromosome,
             dbConnection = db.wellington,
             fimo = db.fimo,
             minid = "urinary_bladder_hint_16.minid",
             dbUser = "trena",
             dbTable = "urinary_bladder_hint_16",
             sourcePath = data.path,
             isTest = FALSE,
             method = "HINT"))
}

cmd=paste("tar -zcvf ", output_path, ".tar.gz ", output_path, sep="")
system(cmd, intern = TRUE)
unlink(output_path,recursive=TRUE)
#print(bpok(result))
#print("Database fill complete")
#print(date())
