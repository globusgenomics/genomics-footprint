# Generate Database

This directory includes the processing code to intersect [hint](http://www.regulatory-genomics.org/hint/introduction/) or [wellington](https://github.com/jpiper/pyDNase) footprints output with the FIMO database and save the results in
your local directory or optionally put in a database.

- To intersect footprints with TFBS motifs, you need to update: (1) the footprint data path; (2) bdbag path; (3) library paths in the the master scripts. For example, update accordingly the lines 12 and 14 and 28-31 to your own directory paths in the wellington.R or hint.R scripts in [master/skin_20](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master/skin_20):  

  ```
  line 12:  data.path <- "/scratch/shared/footprints/skin_wellington_20"

  line 14:  bdbag.path<-"/scratch/shared/footprints/skin_20"

  line 28:  source("/scratch/galaxy/test/generate_db/src/dependencies.R")
  line 29:  source("/scratch/galaxy/test/generate_db/src/dbFunctions.R")
  line 30:  source("/scratch/galaxy/test/generate_db/src/tableParsing.R")
  line 31:  source("/scratch/galaxy/test/generate_db/src/main_Bioc.R")
  ```

- Once the paths are correctly updated, then you are ready to run the master script.

  ```
  Rscript -f hint.R
  Rscript -f wellington.R
  ```

  Note that the master scripts are set to use 25 workers (cpus).  You might want to adjust if this will be too much for your computing resources. To do that, please update the the following lines accordingly.

  ```
  line 34:  chromosomes <- paste0("chr",c(1:22,"X","Y","MT")) to chromosomes <- paste0("chr",c(1:10))
  line 38:  register(MulticoreParam(workers = 25, stop.on.error = FALSE, log = TRUE), default = TRUE) to register(MulticoreParam(workers = 10, stop.on.error = FALSE, log = TRUE)

  ```

- For our use case, jobs were submitted for execution to [Condor](https://en.wikipedia.org/wiki/HTCondor).  We make our submit scripts available
  in the [condor_submit_script](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/condor_submit_script) directory.  

- The output is a BDBag that contains two compressed TFBS files for hint and wellington.

  For example, the [urinary_bladder_16 bdbag](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/bdbag_output/urinary_bladder_16) contains the urinary_bladder_hint_16.tar.gz and urinary_bladder_wellington_16.tar.gz files.

  Note that, by default, a BDBag of TFBSs are generated whereas filling up a database table is optional. To enable it,
  please change the parameter in the [master R script](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master) as follows:

  `Fill_DB_Enable=FALSE --> Fill_DB_Enable=TRUE`  in this function below.

  ```
  if(!interactive()){
      chromosomes <- paste0("chr",c(1:22,"X","Y","MT"))
      # Create parallel structure here
      library(BiocParallel)
      register(MulticoreParam(workers = 10, stop.on.error = FALSE, log = TRUE), default = TRUE)

      # Run on all 24 possible chromosomes at once
      result <- bptry(bplapply(chromosomes, fillAllSamplesByChromosome,
               dbConnection = db.wellington,
               fimo = db.fimo,
               minid = "urinary_bladder_wellington_20.minid",
               dbUser = "trena",
               dbTable = "urinary_bladder_wellington_20",
               sourcePath = data.path,
               isTest = FALSE,
               method = "WELLINGTON",
               Fill_DB_Enable=TRUE)))
  }
  ```
--------------

To build your own database, please follow the instruction below.

Using the example  [skin_20](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master/skin_20), the steps are as follows :

    1. Add a new database info to the R script [src/dbFunctions.R](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/src/dbFunctions.R) as shown in the example below.

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
   2. Prepare your footprint files in your local directory.

   3. Run the database creation shell script in [master/skin_20](https://github.com/globusgenomics/genomics-footprint/tree/master/generate_db/master/skin_20)
   ```
   ./create_dbs_test.sh
   ```

-------------------

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
