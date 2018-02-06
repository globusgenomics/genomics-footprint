# Generate the transcription factor binding motif catalog

**Final catalog as a psql dump is available at to download :**   

  `s3cmd get s3://bdds-public/index_dbs/2017_07_27_fimo . `

Generating the fimo output files and uploading to a database can be done by running the R script [create_fimo_db.R](https://github.com/globusgenomics/genomics-footprint/blob/master/generate_motif/script/create_fimo_db.R):

   - Make sure that: (1) hg38 sequences in [./fimo_input/hg38](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_motif/fimo_input/hg38) are uncompressed; (2) PostgreSQL is installed; and (3) [FIMO](http://meme-suite.org/doc/install.html?man_type=web) is installed.

   - We use the pre-generated non-redundant motifs - [non-redundant-fimo_motifs.meme](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_motif/fimo_input/motif/non-redundant_fimo_motifs.meme).

    `Rscript ./script/create_fimo_db.R`


**Please note: this process will take a long time, so plan accordingly**

***

Specifically, generation of the FIMO database can be broken down into three primary steps:

      1. Identifying and collecting motif catalogs from various sources
      2. Running Tomtom to identify a core set of non-redundant motifs across the input sources
      3. Running FIMO to identify the genomic location of all motifs

- Identifying and collecting motif catalogs from various resources:

    - [MotifDb](https://bioconductor.org/packages/release/bioc/html/MotifDb.html) is an R package that is a clearing house for multiple motif databases.
     - Motifs (in .meme format) from JASPAR2016, HOCOMOCOv10, UniPROBE and SwissRegulon were exported from MotifDb

- Running [Tomtom](http://meme-suite.org/tools/tomtom) to identify a core set of non-redundant motifs across the input sources
     - Code for running Tomtom can be found here:

       (https://github.com/globusgenomics/genomics-footprint/tree/master/generate_motif/TOMTOM)

     - The file for non-redundant motifs is available for downloading at:

       `./fimo_input/motif/non-redundant_fimo_motifs.meme`

 - Running FIMO to identify the genomic location of all motifs. Below is an exmaple with chromosome 1.

       `fimo --text --oc . --no-qvalue ./fimo_input/motif/non-redundant_fimo_motifs.meme ./fimo_input_hg38/1.fa > ./chr1_fimo_output.txt`
