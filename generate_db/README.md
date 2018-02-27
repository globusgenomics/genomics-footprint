# Generate Database

This directory includes the processing code to intersect [hint](http://www.regulatory-genomics.org/hint/introduction/) or [wellington](https://github.com/jpiper/pyDNase) footprints output with the FIMO database and save the results in
your local directory or optionally put in a database.

- R library dependencies - The script which generates the TFBS will attempt to download the R libraries listed. However, depending on your resource, you may encounter issues in installing the library. Within the list are possible issues you may run into and how to fix them:
  - GenomicRanges (https://bioconductor.org/packages/release/bioc/html/GenomicRanges.html)
  - BiocParallel (https://bioconductor.org/packages/release/bioc/html/BiocParallel.html)
  - RUnit (https://cran.r-project.org/web/packages/RUnit/README.html)
    - To install run in R shell: install.packages("RUnit")
  - RPostgreSQL (https://cran.r-project.org/web/packages/RPostgreSQL/index.html)
    - To install run in R shell: install.packages("RPostgreSQL")
    - If you run into issues installing this library you might be missing libpq-dev C library and will need to install it.


- To intersect footprints with TFBS motifs, you will first need to download, unpackand resolve the data. For the Urinary bladder, seed 16 BDbag (i.e. minid ark:/57799/b9wd55):

  ```
  wget https://s3.amazonaws.com/bdds-public/bags/footprints_bags/urinary_bladder.seed16.tissue.bag.zip
  unzip ./urinary_bladder.seed16.tissue.bag.zip
  bdbag --bag-path ./urinary_bladder.seed16.tissue.bag --resolve-fetch all
  ```

- Now you are ready to run the [tfbs.R](https://github.com/globusgenomics/genomics-footprint/blob/master/generate_db/src/tfbs.R) script. You can get the help menu for the script by:

  ```
  $ Rscript ./tfbs.R
  Usage: ./tfbs.R [options]

  Options:
	-i INPUT, --input=INPUT
		Input directory path to your footprint files. You can supply this option or the bag option but not both.

	-b BAG, --bag=BAG
		BDBag path of your footprint files. You can supplythis option or the input option but not both.

	-o OUTPUT, --output=OUTPUT
		Output directory to your TFBS files

	-t TISSUE, --tissue=TISSUE
		Tissue type of the footprints

	-m METHOD, --method=METHOD
		Method used to generate footprints - Options include wellington or hint.

	-s SEED, --seed=SEED
		Footprints seed - Options include 16, or 20

	-w WORKERS, --workers=WORKERS
		Number of worker threads to use

	-e, --eval
		Run evaluation for only the first 10 lines in your footprints files.

	-h, --help
		Show this help message and exit


  ```

- You can use the BDBag as input to generate the TFBS for the urinary bladder (seed16) BDBag by running:

  ```
  $ Rscript ./tfbs.R -b ./urinary_bladder.seed16.tissue.bag -o ./output -s 16 -t "urinary bladder" -m Hint

  ```

- If you have placed your footprints BED files in a separate directory (not in the BDBag), then you can use this instead:

  ```
  $ Rscript ./tfbs.R -i ./footprint_bed_files -o ./output -s 16 -t "urinary bladder" -m Hint

  ```

  - The BDBag method will assume that you have downloaded the BDBag directly from its location and have not modified the contents of the bag. If you have modified the contents, then it's best to use the "-i" parameter to indicate location of the input footprint files.

  Note: The script is set to use 4 workers (cpus).  You can adjust this by modifying the "-w" parameter.
  
  You can also try to test quickly by setting setting the "-e" flag. 
  This will capture the first 10 lines in the footprint input file and then intersect with FIMO.

- The output is a BDBag that contains compressed TFBS files for hint and wellington.

  For example, the [urinary_bladder_16 bdbag](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/bdbag_output/urinary_bladder_16) contains the urinary_bladder_hint_16.tar.gz and urinary_bladder_wellington_16.tar.gz files.


  You are done!
--------------
**Below is additional notes that you may find useful, but can skip as well.**

- [Output validation](#output-validation)
- [Submit to Condor](#submit-to-condor)
- [Build your own database](#build-your-own-database)
- [Check database](#check-database)


### Output validation

To compare the output, we have a simple [R script](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/validation/overlap_check.R) in [validation](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/validation) that compares two input files based on the genomic loation (chr, start, stop).

  ```
  Rscript overlap_check.R urinary_bladder_hint_16_ENCSR813CKU_chr1.csv urinary_bladder_wellington_16_chr1.csv

  [1] "file1: 739525 lines and file2: 249732 lines that have 3271 exact matches in footprints"
  [1] "file1: 739525 lines and file2: 249732 lines that have 349340 exact matches in motifs"
  ```

### Submit to Condor

For our use case, jobs were submitted for execution to [Condor](https://en.wikipedia.org/wiki/HTCondor).  We make our submit scripts available
  in the [condor_submit_script](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/condor_submit_script) directory.  


### Build your own database

If you want to build your own database, please follow the instruction below.

  Using the example  [skin_20](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master/skin_20), the steps are as follows :

   1. Run a database creation shell script in [master/skin_20](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master/skin_20)

   ```
   ./create_dbs_test.sh
   ```

   2. Add the new database info to the R script [src/dbFunctions.R](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/src/dbFunctions.R) as shown in the example below.

   ```
    else if (database == "skin_wellington_20") {
       user = "trena"
       password = "trena"
       dbname = "skin_wellington_20"
       host = "bdds-rds.globusgenomics.org"}
    else if (database == "skin_hint_20") {
       user = "trena"
       password = "trena"
       dbname = "skin_hint_20"
       host = "bdds-rds.globusgenomics.org"}
   ```

   3. Prepare your skin footprints output files in your local directory.

   4. Run the [master](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master) R scripts.
      Make sure your directory paths are all correct.  

### Check database

This is a sanity check for database connection, table creation, etc.

  - Index the databases
  ```
  nohup psql skin_wellington_20 -f index_skin_wellington_20.sql &
  nohup psql skin_hint_20 -f index_skin_hint_20.sql &
  ```
  - Check database contents
  ```
  psql skin_wellington_20 -U trena -h bddsrds.globusgenomics.org
  select * from hits limit 10;
  select * from regions limit 10;

  \connect skin_hint_20
  select * from hits limit 10;
  select * from regions limit 10;
  \q
  ```
- Make database read only
  ```
  psql skin_wellington_20 -U trena -h bddsrds.globusgenomics.org
  revoke insert, update, delete, truncate on hits from public;
  revoke insert, update, delete, truncate on hits from trena;

  \connect skin_hint_20
  revoke insert, update, delete, truncate on hits from public;
  revoke insert, update, delete, truncate on hits from trena;

  \q
  ```

- Dump the databases to AWS S3 to store and share
  ```
  pg_dump -Fc -h bddsrds.globusgenomics.org -U trena skin_wellington_20 > ./skin_wellington_20
  pg_dump -Fc -h bddsrds.globusgenomics.org -U trena skin_hint_20 > ./skin_hint_20


  aws s3 cp ./skin_wellington_20.dump s3://bdds-public/index_dbs/
  aws s3 cp ./skin_hint_20.dump s3://bdds-public/index_dbs/
  ```
------

- Here is the snapshot of some of the database we created in bddsrds.globusgenomics.org:

```
List of databases
Name                  |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
----------------------------------------+----------+----------+-------------+-------------+-----------------------
2017_07_27_fimo                        | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
adrenal_gland_hint_16                  | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
adrenal_gland_hint_20                  | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
adrenal_gland_wellington_16            | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
adrenal_gland_wellington_20            | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
blood_vessel_hint_16                   | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
blood_vessel_hint_20                   | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
blood_vessel_wellington_16             | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
blood_vessel_wellington_20             | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bone_element_hint_16                   | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bone_element_hint_20                   | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bone_element_wellington_16             | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bone_element_wellington_20             | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
brain_hint                             | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
brain_hint_16                          | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
brain_hint_20                          | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
brain_wellington_16                    | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
brain_wellington_20                    | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bronchus_hint_16                       | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bronchus_hint_20                       | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bronchus_wellington_16                 | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy
bronchus_wellington_20                 | galaxy   | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =Tc/galaxy           +
|          |          |             |             | galaxy=CTc/galaxy    +
|          |          |             |             | trena=c/galaxy                   
```
