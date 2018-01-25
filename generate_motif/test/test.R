library(RPostgreSQL)
#------------------------------------------------------------------------------------------------------------------------
db <- dbConnect(PostgreSQL(), user="trena", password="trena", dbname="trena", host="whovian")
dbGetQuery(db, "select * from fimo_hg38 limit 3")
dbGetQuery(db, "select * from fimo_hg38 where chrom='chr13' limit 3")

