The *generate_db* directory includes the processing code to intersect hint or wellington footprints ouptut with the FIMO database and put the results in a database.

We build the footprints database in [Amazon RDS](https://aws.amazon.com/rds/).

The workflow is as follows using [skin_20](https://github.com/PriceLab/BDDS/blob/master/footprints/testdb/skin_20) example:
- Add a new databases to [src/dbFunctions.R](https://github.com/PriceLab/BDDS/blob/master/footprints/testdb/src/dbFunctions.R)
- Prepare your footprint files
- Run the database creation shell script
```
./create_dbs_test.sh
```
- Run the master scripts
```
nohup R -f hint_1.R &
nohup R -f wellington_1.R &
nohup R -f hint_2.R &
nohup R -f wellington_2.R &
```
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
