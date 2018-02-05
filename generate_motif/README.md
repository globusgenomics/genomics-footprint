# Generate the transcription factor binding motif catalog

**Final catalog as a psql dump is available at to download :**   

       `s3cmd get s3://bdds-public/index_dbs/2017_07_27_fimo . `

Generation of the FIMO database can be broken down into three primary steps:

      1. Identifying and collecting motif catalogs from various sources
      2. Running Tomtom to identify a core set of non-redundant motifs across the input sources
      3. Running FIMO to identify the genomic location of all motifs

- Identifying and collecting motif catalogs from various resources:

    - [MotifDb] is an R package that is a clearing house for multiple motif databases (https://bioconductor.org/packages/release/bioc/html/MotifDb.html) lists (in `.RDS` format) and in [JASPAR](http://jaspar.genereg.net/downloads/)-formatted files (in `.txt` format).
     - Motifs from JASPAR2016, HOCOMOCOv10, UniPROBE and SwissRegulon were taken from MotifDb

- Running [Tomtom](http://meme-suite.org/tools/tomtom) to identify a core set of non-redundant motifs across the input sources
     - Code for running Tomtom can be found here:

       (https://github.com/globusgenomics/genomics-footprint/tree/master/generate_motif/TOMTOM)

     - The file for non-redundant motifs is available for downloading at:

       `./fimo_input/motif/non-redundant_fimo_motifs.meme`

 - Running FIMO to identify the genomic location of all motifs. Below is an exmaple with chromosome 1.

       `fimo --text --oc . --no-qvalue ./fimo_input/motif/non-redundant_fimo_motifs.meme ./fimo_input_hg38/1.fa > ./chr1_fimo_output.txt`

Generating the fimo output files and uploading to a database can be done by running the R script:
   - Make sure that: (1) hg38 sequences in `./fimo_input/hg38/` are uncompressed; (2) PostgreSQL is installed; and (3) [FIMO](http://meme-suite.org/doc/install.html?man_type=web) is installed.

       `Rscript ./script/create_fimo_db.R`


**Please note: this process will take a long time, so plan accordingly**
