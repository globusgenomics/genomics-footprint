# Generate transcription factor bidning motif

- This directory contains several versions of Motifs, both in [MotifDb](https://bioconductor.org/packages/release/bioc/html/MotifDb.html) lists (in `.RDS` format) and in [JASPAR](http://jaspar.genereg.net/downloads/)-formatted files (in `.txt` format).

# Bacground about Motif files

- `2017_07_27_all_fimo_motifs` - this motif includes Everything in the FIMO database, the motifs from JASPAR 2016, HOCOMOCOv10, UniPROBE, and SwissRegulon.

- `2017_07_27_non_jaspar_vert.txt` - This is a smaller set of motifs that excludes the 519 motifs appearing in the JASPAR Vertebrates. This file represents what must be added to the smaller dataset to achieve the full FIMO dataset

- `2017_08_21_fimo_plus_vert.txt` - Essentially, this is the union of the 2 aforementioned datasets. It has all the FIMO motifs in our 2017_07_27 database version, plus 2 extra motifs found in the JASPAR Vertebrates dataset.

# Instructions on how to create and update FIMO

1. Install the latest [MotifDb](https://github.com/PriceLab/MotifDb) version from the forked PriceLab repo

```
- Clone the repo onto your machine:

`git clone https://github.com/PriceLab/MotifDb.git`

- Open up R and install the necessary dependency packages from BioConductor using the following:

source("https://bioconductor.org/biocLite.R")
biocLite(c("BiocGenerics", "S4Vectors", "IRanges", "Biostrings", "rtracklayer"))

- Once the dependency packages are installed, exit R and navigate to the MotifDb root directory (e.g. ./MotifDb) and install the MotifDb package locally:

`R CMD INSTALL .`

This should install the MotifDb library on your machine.
```

2. Using MotifDb in R, export .meme files of your desired motifs
3. Using the fimo program, intersect the motif .meme files with all chromosomes
4. Copy and restore the existing fimo database dump from Amazon S3
5. Use loop.sh to add the `loc` column to the fimo files
6. Using the template from [`create_fimo_table.sh`](https://github.com/PriceLab/BDDS/blob/master/trenadb/fimo/create_fimo_table.sh), create a shell script that copies the fimo output into the existing fimo database
7. Create indices using the commands in [index.sql](https://github.com/PriceLab/BDDS/blob/master/trenadb/fimo/index.sql)
8. Dump the new fimo database locally, then copy it to Amazon S3

What follows is a more detailed description of how to carry out all these steps, with examples using the fimo version created on June 8, 2017.

## 1. Install the latest MotifDb version from the forked PriceLab repo

First, clone the repo onto your machine:

`git clone https://github.com/PriceLab/MotifDb.git`

Next, open up R and install the necessary dependency packages from BioConductor using the following:

```
source("https://bioconductor.org/biocLite.R")
biocLite(c("BiocGenerics", "S4Vectors", "IRanges", "Biostrings", "rtracklayer"))
```

Once the dependency packages are installed (which will take a few minutes), exit R and navigate to the MotifDb root directory (e.g. /scratch/github/MotifDb) and install the MotifDb package locally:

`R CMD INSTALL .`

This should install the MotifDb library on your machine.

## 2. Using MotifDb in R, export .meme files of your desired motifs

Open up R again and load the MotifDb package:

`library(MotifDb)`

As detailed in the [MotifDb vignette](http://bioconductor.org/packages/release/bioc/vignettes/MotifDb/inst/doc/MotifDb.pdf), you can filter out certain types of motifs using the `query` function. For example, we can select the human (*H.sapiens*) motifs from JASPAR 2016 as follows:

`jaspar_human <- query(query(MotifDb, "hsapiens"),"jaspar2016")`

In order to run these motifs through the fimo program, we want a .meme file; this can be directly done using MotifDb as follows:

`export(jaspar_human, con = "./jaspar_human.meme", format = "meme")`

We've now created the file "jaspar_human.meme" of human motifs found in the JASPAR 2016 database.

## 3. Using the fimo program, intersect the motif .meme files with all chromosomes

Assuming you've installed the fimo tools from the MEME suite (if not, find instructions [here](http://meme-suite.org/doc/install.html?man_type=web), you'll need to run fimo on your new motif .meme file and do so on all chromosomes. Your .meme file is already in your workspace, but you will need the hg38 chromosomes. We have them broken up into sensibly-sized groups in an Amazon S3 bucket, so copy all of them to your workspace with the following:

`aws s3 cp s3://marichards/GRCh38 . --recursive`

There are 17 groups of chromosomes; you can run these individually, but if you are on an AWS instance then it makes sense to run them all in parallel as these will take a while. As a guide, please see the example script created for running all HOMER motifs, [`run_all_homer.sh`](https://github.com/PriceLab/BDDS/blob/master/trenadb/fimo/run_all_homer.sh).

If you insist on doing chromosomes individually, the notation is as follows:

`fimo --text --oc . --no-qvalue ../meme/homer_all.meme ../chromosomes/1.fa > ./01_homer_all_fimo.txt`

In this example, we're using a .meme file of all HOMER motifs and chromosome 1, then dumping the output into an appropriately-labeled text file.

**Please note: this step will take a long time, so plan accordingly**

## 4. Copy the and restore the existing fimo database dump from Amazon S3

Ultimately, you'll want to add your text files created in step 3 to the fimo database. The most recent version of fimo was created on July 27, 2017 and can be copied to your machine as follows:

`aws s3 cp s3://marichards/completed_dbs/2017_06_27_fimo.dump .`

The database is around 32 GB and will take some time to download. Once it does, you'll need to restore it in PostgreSQL. First, open PostgreSQL, create an empty database, give privileges to the "trena" user account, and close PostgreSQL:

```
psql postgres
create database fimo
grant all privileges on database fimo to trena
\q
```

After creating the empty database, fill it using the following command:

`sudo pg_restore --verbose --clean --no-acl --no-owner --dbname=fimo 2017_06_27_fimo.dump`

**This command will also take quite a while to run (probably a few of hours), so plan accordingly**

Once the restore is complete, you should have about 1.3 billion rows; you can check this using the following command inside PostgreSQL:

`select count(*) from fimo_hg38;`

## 5. Use the `loop.sh` script to add the `loc` column to fimo files

The FIMO database has an extra column not found in the output of running FIMO; copy the `loop.sh` script to the directory with your fimo output, so you can run it to add the `loc` column to all of them. Open up the script and edit it so that it's renaming your files correctly, then go ahead and run it. It shouldn't take too long; it took about 30 seconds to run on output for 274 new motifs.

## 6. Using the template from [`create_fimo_table.sh`](https://github.com/PriceLab/BDDS/blob/master/trenadb/fimo/create_fimo_table.sh), create a shell script that copies the fimo output into the existing fimo database

As in the case of step 3, you could theoretically fill the database one file at a time, but that would be wildly inefficient. Instead, use the local file linked above as a template to copy your text files into the database. The basic line of code in the shell script is a copy command:

`psql fimo -c "copy fimo_hg38 from '/scratch/data/fimo/01_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"`

The example command here copies the info from the HOMER chromosome 1 file we created earlier. If you run a bunch of these, it'll take a while (the 85 line version in the example took a bit over an hour), but the time investment isn't terrible.

## 7. Create indices using the commands in [index.sql](https://github.com/PriceLab/BDDS/blob/master/trenadb/fimo/index.sql)

The database is enormous (~1.3 billion lines), so you'll definitely want to invest the time to index it and make it easier to use later. To do so, run the `index.sql` script in this directory (I'm running as nohup):

`nohup psql fimo -f index.sql`

**Once again, this commands takes a long time to finish running; go bake something and come back. Last time it took neary 4 hours**

## 8. Dump the new fimo database locally, then copy it to Amazon S3

Once you've updated the database and indexed it, you should definitely save it so you never have to repeat your work. We keep the databases in an S3 bucket, so you'll want to put your new version there. First, dump it from the command line as follows:

`pg_dump -Fc -h localhost -U trena fimo > ./2017_07_27_fimo.dump`

Now that you've got a dump file, simply copy it to the proper S3 bucket and you're finished:

`aws s3 cp ./2017_07_27_fimo.dump s3://marichards/correct_index_dbs/'`
