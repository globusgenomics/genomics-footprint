library(RPostgreSQL)
library(RUnit)
db <- dbConnect(PostgreSQL(), user= "trena", password="trena", dbname="fimo", host="whovian")
system.time(tbl <- dbGetQuery(db, "select * from hg38 where chr='10' and start < 19000"))
