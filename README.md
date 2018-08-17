# Transcription factor binding site atlas: A case study in reproducible big data science

**Following are the supplementary information that these directories contain workflows and scripts used to generate DNase footprints, TF binding motifs, and databases. Step numbers and dataset numbers follow the conventions used in the paper.**

   - Please follow these instructions to reproduce Steps 1-3 that generates datasets D1-3
     - [generate_footprints](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_footprints) - This generate_footprints provides instructions on running the DNAse footprinting workflow and includes a sample analysis.

   - Please follow this link to regenerate D5 (transcription factor motif file that is used for annotating the footprints)
     - [generate_motif](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_motif) 

   - Step 5 generating D6. These instructions show a step-by-step procedure, along with the code to intersect hint or wellington footprints output with the FIMO database and save the output in a local directory. 
     - [generate_db](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db)
     
- [getting_started](https://github.com/globusgenomics/genomics-footprint/tree/master/getting_started) - This is a R notebook that  shows how to access and query the footprint database.
