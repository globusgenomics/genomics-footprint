# We're going to take away the "motifsgenes" table from hg38 and revise it using our saved .RDS file
library(RPostgreSQL)

# Load the new file
new.table <- readRDS("./2017_08_23_Motif_TF_Map.RDS")

# Change the column names to be lower case
names(new.table) <- tolower(names(new.table))

# Connect to the database
db <- dbConnect(PostgreSQL(),
                host = "localhost",
                user = "trena",
                password = "trena",
                dbname = "hg38")

# Overwrite the old table with the new one (coerce to regular DF, not tbl)
dbWriteTable(db, "motifsgenes",
             as.data.frame(new.table),
             overwrite = TRUE,
             row.names = FALSE)

# Get rid of the connection
dbDisconnect(db)
