---
title: "How to use the footprint databases"
output:
  html_document:
    df_print: paged
---


Establish a connection specifying the footprint database of your interest to query.

```{r}
library(RPostgreSQL)

database.host <- "bddsrds.globusgenomics.org"
dbname <- "brain_hint_20"

db <- dbConnect(PostgreSQL(), user="trena", password="trena", port=5432, 
                host=database.host, dbname=dbname)
summary(db)
dbListTables(db)
```
We have successfully connected to the footprint database that returned two tables - regions and hits

In general, "regions" is used to query for a genomic region of interest; then, execute a second query for the possibly many overlapping footprint/motif calls in each region. We use a very conservative proximal promoter for MEF2C, for example, which is encoded on the minus strand.

```{r}
chromosome <- "chr5"
tss <- 88904257         # hg38 coordinates
query.regions <- sprintf("select * from regions where chrom='%s' and start > %d and endpos < %d",
                      chromosome, tss - 500, tss + 2000)
tbl.regions <- dbGetQuery(db, query.regions)
dim(tbl.regions)
head(tbl.regions, n=5)
```

The "loc" column in this data.frame corresponds to the primary key of the hits table, making for fast retrieval of the footprints annotated to motif.

```{r}
loc.set <- sprintf("('%s')", paste(tbl.regions$loc, collapse="','"))
query.hits <- sprintf("select * from hits where loc IN %s", loc.set)
tbl.hits <- dbGetQuery(db, query.hits)
dim(tbl.hits)
head(tbl.hits, n=5)
```