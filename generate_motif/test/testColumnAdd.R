library(RPostgreSQL)

#----------------------------------------------------------------------------------------------------
# create a new database
createTestDb <- function(){

    # Make some fake data
    fake.chrom <- paste0("chr",1:22)
    fake.start <- 101:122
    fake.endpos <- 201:222

    df <- data.frame(chrom = fake.chrom,
                     start = fake.start,
                     endpos = fake.endpos)

    # Write it to a database
    db <- dbConnect(PostgreSQL(),
                    user = "trena",
                    password = "trena",
                    host = "localhost",
                    dbname = "testdb")

    dbWriteTable(db, "test_table",df)
    
    
