# Generate the transcription factor binding motif catalog

**Final catalog as a psql dump is available at:**   

       `./fimo_psql_dump/2017_07_27_fimo`

Generation of the FIMO database can be broken down into three primary steps:

      1. Identifying and collecting motif catalogs from varous sources
      2. Running Tomtom to identify a core set of non-redundant motifs across the input sources
      3. Running FIMO to identify the genomic location of all motifs

- Identifying and collecting motif catalogs from various resources:

    - [MotifDb] is an R package that is a clearing house for multiple motif databases (https://bioconductor.org/packages/release/bioc/html/MotifDb.html) lists (in `.RDS` format) and in [JASPAR](http://jaspar.genereg.net/downloads/)-formatted files (in `.txt` format).
     - Motifs from JASPAR2016, HOCOMOCOv10, UniPROBE and SwissRegulon were taken from MotifDb

- Running [Tomtom](http://meme-suite.org/tools/tomtom) to identify a core set of non-redundant motifs across the input sources
     - Code for running Tomtom can be found here:
       (https://github.com/PriceLab/BDDS/tree/master/trenadb/fimo/TOMTOM)
     - Output for Tomtom, containing all non-redundant motifs can be found here:
       `./output/2017_07_27_all_fimo_motifs`

 - Running FIMO to identify the genomic location of all motifs
     - `fimo --text --oc . --no-qvalue ./meme/your_file.meme ../chromosomes/1.fa > ./01_your_file_fimo.txt`



## Instructions on how to create and update FIMO

1. Install the latest [MotifDb](https://github.com/PriceLab/MotifDb) version from the forked PriceLab repo

   - Clone the repo onto your machine:

     `git clone https://github.com/PriceLab/MotifDb.git`

   - Open up R and install the necessary dependency packages from BioConductor using the following:
   ```
      source("https://bioconductor.org/biocLite.R")
      biocLite(c("BiocGenerics", "S4Vectors", "IRanges", "Biostrings", "rtracklayer"))

   ```

   - Once the dependency packages are installed, exit R and navigate to the MotifDb root directory (e.g. ./MotifDb) and install the MotifDb package locally:
   `R CMD INSTALL .`

2. Using MotifDb in R, export .meme files of your desired motifs

   - Open up R again and load the MotifDb package:

      `library(MotifDb)`

   - As detailed in the [MotifDb vignette](http://bioconductor.org/packages/release/bioc/vignettes/MotifDb/inst/doc/MotifDb.pdf), you can filter out certain types of motifs using the `query` function. For example, we can select the human (*H.sapiens*) motifs from JASPAR 2016 as follows:

      `jaspar_human <- query(query(MotifDb, "hsapiens"),"jaspar2016")`

   - In order to run these motifs through the FIMO program, we want a .meme file; this can be directly done using MotifDb as follows:

      `export(jaspar_human, con = "./output/jaspar_human.meme", format = "meme")`

   - We've now created the file "jaspar_human.meme" of human motifs found in the JASPAR 2016 database.


3. Using the FIMO program, intersect the motif .meme files with all chromosomes

   - Install the FIMO tools from the MEME suite (the  instruction is available  [here](http://meme-suite.org/doc/install.html?man_type=web) and run FIMO on your  .meme motif file and do so on all chromosomes. Your .meme file is already in your workspace, but you will need the hg38 chromosomes. We have them broken up into sensibly-sized groups in an Amazon S3 bucket, so copy them to your workspace with the following:

      `aws s3 cp s3://bdds-public/GRCh38 . --recursive`

   - Run chromosomes individually or all in parallel. Below is for chr1 as an example:

      `fimo --text --oc . --no-qvalue ./meme/your_file.meme ../chromosomes/1.fa > ./01_your_file_fimo.txt`

**Please note: this step will take a long time, so plan accordingly**
