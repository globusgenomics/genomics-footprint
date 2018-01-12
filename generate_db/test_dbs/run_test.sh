#/bin/bash

cd /scratch/db
sudo -u postgres psql postgres << EOF

create database test_wellington;
grant all privileges on database test_wellington to trena;
create database test_hint;
grant all privileges on database test_hint to trena;

\connect test_wellington

create table regions(loc varchar primary key,
		     chrom varchar,
		     start int,
		     endpos int);

grant all on table "regions" to trena;

create table hits(loc varchar,
		  type varchar,
		  name varchar,
		  length int,
		  strand char(1),
		  sample_id varchar,
		  method varchar,
		  provenance varchar,
		  score1 real,
		  score2 real,
		  score3 real,
		  score4 real,
		  score5 real,
		  score6 real);

grant all on table "hits" to trena;

\connect test_hint

create table regions(loc varchar primary key,
		     chrom varchar,
		     start int,
		     endpos int);

grant all on table "regions" to trena;

create table hits(loc varchar,
		  type varchar,
		  name varchar,
		  length int,
		  strand char(1),
		  sample_id varchar,
		  method varchar,
		  provenance varchar,
		  score1 real,
		  score2 real,
		  score3 real,
		  score4 real,
		  score5 real,
		  score6 real);

grant all on table "hits" to trena;

EOF

cd /scratch/github/BDDS/footprints/testdb/test_dbs

R -f hint.R &
R -f wellington.R &
