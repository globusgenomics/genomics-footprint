# users can either step through this file, or call this file with 
# r -f example.R

# THIS ASSUMES THAT THE TESTHINT DATABASE EXISTS. The recipe for building that
# database is in ../dbInitialization/createHintTest.sql

# THIS EXAMPLE USES THE BRAIN HINT OUTPUT MADE BY RUNNING make hint at /scratch/data/footprints

print(date())
#-------------------------------------------------------------------------------
# set path to hint output 
data.path <- "/scratch/github/BDDS/footprints/functionalTests/output/wellington"
#-------------------------------------------------------------------------------
# establish database connections:

if(!exists("db.wellington"))
    db.wellington <- "test_wellington_localhost"

if(!exists("db.fimo"))
    db.fimo <- "fimo_localhost"
#-------------------------------------------------------------------------------
if(!interactive()){    
    chromosomes <- paste("chr", c(1:22,"X","Y"), sep="")
    
    # Create parallel structure here    
    library(foreach); library(doParallel)    
    cores <- detectCores()    
    cl <- makeCluster(cores[1] - 1)    
    registerDoParallel(cl)      

    # Pass path variables and source files
    clusterExport(cl, varlist = c("data.path","db.fimo", "db.wellington"),
                  envir = environment())
    
    junk <- clusterEvalQ(cl, source("../src/dependencies.R"))
    junk <- clusterEvalQ(cl, source("../src/dbFunctions.R"))
    junk <- clusterEvalQ(cl, source("../src/tableParsing.R"))
    junk <- clusterEvalQ(cl, source("../src/tests.R"))
    junk <- clusterEvalQ(cl, source("../src/main.R"))

    # Run on all 24 possible chromosomes at once
    foreach(i=1:length(chromosomes)) %dopar% {
        fillAllSamplesByChromosome(chromosome = chromosomes[[i]],
                                   dbConnection = db.wellington,
                                   fimo = db.fimo,
                                   minid = "testexample.filler.minid",
                                   dbUser = "trena",
                                   dbTable = "test_wellington",
                                   sourcePath = data.path,
                                   isTest = FALSE,
                                   method = "WELLINGTON")
				   }				  
}

print("Database fill complete; creating indices")

# Index the database
source("../src/dbFunctions.R")
source("../src/dependencies.R")
dbConnection <- getDBConnection(db.wellington)
dbSendQuery(dbConnection, "create index regions_index on regions (chrom, start, endpos);")
dbSendQuery(dbConnection, "create index hits_index on hits (loc);")
dbDisconnect(dbConnection)

print(date())
