#-------------------------------------------------------------------------------
getDBConnection <- function(database) {
  port = "5432"
  driver = dbDriver("PostgreSQL")

  if (database == "trenatest") {
    user= "ben"
    password="ben_PASS"
    dbname="trenatest"
    host="bdds-rds.globusgenomics.org"

  } else if (database == "fimo") {
    user= "trena"
    password="trena"
    dbname="fimo"
    host="bdds-rds.globusgenomics.org"

  } else if (database == "adrenal_gland_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "adrenal_gland_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "adrenal_gland_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "adrenal_gland_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "adrenal_gland_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "adrenal_gland_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "adrenal_gland_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "adrenal_gland_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "blood_vessel_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "blood_vessel_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "blood_vessel_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "blood_vessel_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "blood_vessel_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "blood_vessel_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "blood_vessel_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "blood_vessel_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "bone_element_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "bone_element_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "bone_element_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "bone_element_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "bone_element_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "bone_element_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "bone_element_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "bone_element_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "brain_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "brain_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "brain_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "brain_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "brain_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "brain_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "brain_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "brain_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "bronchus_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "bronchus_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "bronchus_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "bronchus_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "bronchus_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "bronchus_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "bronchus_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "bronchus_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "esophagus_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "esophagus_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "esophagus_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "esophagus_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "esophagus_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "esophagus_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "esophagus_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "esophagus_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "extraembryonic_structure_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "extraembryonic_structure_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "extraembryonic_structure_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "extraembryonic_structure_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "extraembryonic_structure_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "extraembryonic_structure_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "extraembryonic_structure_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "extraembryonic_structure_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "eye_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "eye_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "eye_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "eye_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "eye_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "eye_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "eye_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "eye_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "gonad_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "gonad_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "gonad_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "gonad_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "gonad_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "gonad_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "gonad_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "gonad_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "heart_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "heart_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "heart_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "heart_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "heart_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "heart_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "heart_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "heart_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "kidney_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "kidney_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "kidney_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "kidney_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "kidney_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "kidney_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "kidney_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "kidney_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "large_intestine_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "large_intestine_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "large_intestine_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "large_intestine_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "large_intestine_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "large_intestine_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "large_intestine_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "large_intestine_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "liver_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "liver_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "liver_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "liver_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "liver_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "liver_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "liver_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "liver_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lung_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "lung_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lung_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "lung_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lung_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "lung_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lung_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "lung_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lymphatic_vessel_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "lymphatic_vessel_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lymphatic_vessel_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "lymphatic_vessel_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lymphatic_vessel_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "lymphatic_vessel_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lymphatic_vessel_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "lymphatic_vessel_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lymphoblast_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "lymphoblast_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lymphoblast_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "lymphoblast_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "lymphoblast_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "lymphoblast_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "lymphoblast_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "lymphoblast_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "mammary_gland_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "mammary_gland_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "mammary_gland_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "mammary_gland_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "mammary_gland_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "mammary_gland_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "mammary_gland_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "mammary_gland_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "mouth_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "mouth_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "mouth_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "mouth_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "mouth_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "mouth_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "mouth_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "mouth_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "muscle_organ_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "muscle_organ_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "muscle_organ_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "muscle_organ_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "muscle_organ_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "muscle_organ_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "muscle_organ_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "muscle_organ_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "pancreas_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "pancreas_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "pancreas_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "pancreas_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "pancreas_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "pancreas_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "pancreas_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "pancreas_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "prostate_gland_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "prostate_gland_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "prostate_gland_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "prostate_gland_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "prostate_gland_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "prostate_gland_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "prostate_gland_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "prostate_gland_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "skin_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "skin_wellington_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "skin_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "skin_hint_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "skin_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "skin_wellington_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "skin_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "skin_hint_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "spinal_cord_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "spinal_cord_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "spinal_cord_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "spinal_cord_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "spinal_cord_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "spinal_cord_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "spinal_cord_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "spinal_cord_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "stomach_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "stomach_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "stomach_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "stomach_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "stomach_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "stomach_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "stomach_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "stomach_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "thyroid_gland_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "thyroid_gland_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "thyroid_gland_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "thyroid_gland_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "thyroid_gland_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "thyroid_gland_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "thyroid_gland_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "thyroid_gland_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "tongue_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "tongue_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "tongue_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "tongue_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "tongue_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "tongue_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "tongue_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "tongue_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "urinary_bladder_hint_20") {
    user = "trena"
    password = "trena"
    dbname = "urinary_bladder_hint_20"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "urinary_bladder_wellington_20") {
    user = "trena"
    password = "trena"
    dbname = "urinary_bladder_wellington_20"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "urinary_bladder_hint_16") {
    user = "trena"
    password = "trena"
    dbname = "urinary_bladder_hint_16"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "urinary_bladder_wellington_16") {
    user = "trena"
    password = "trena"
    dbname = "urinary_bladder_wellington_16"
    host = "bdds-rds.globusgenomics.org"

  } else if (database == "test_wellington") {
    user = "trena"
    password = "trena"
    dbname = "testwellington"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "test_hint") {
    user = "trena"
    password = "trena"
    dbname = "testhint"
    host = "bdds-rds.globusgenomics.org"
  } else if (database == "test_piq") {
    user = "trena"
    password = "trena"
    dbname = "test_piq"
    host = "bdds-rds.globusgenomics.org"

  }

  dbConnect(drv=driver, user=user, password=password, dbname=dbname, host=host,
            port=port)
} # getDBConnection

#-------------------------------------------------------------------------------
region.schema <- function()
{
  c("loc", "chrom", "start", "endpos")
} # region.schema
#-------------------------------------------------------------------------------
hit.schema <- function()
{
  c("loc", "fp_start", "fp_end","type", "name", "length",
    "strand", "sample_id", "method", "provenance",
    "score1", "score2", "score3", "score4", "score5", "score6")
} # hit.schema
#-------------------------------------------------------------------------------
databaseSummary <- function(dbConnection = db.wellington.test)
{
  region.count <- dbGetQuery(dbConnection, "select count(*) from regions")[1,1]
  hit.count <- dbGetQuery(dbConnection, "select count(*) from hits")[1,1]
  printf("%d hits in %d regions", hit.count, region.count)
} # databaseSummary
#-------------------------------------------------------------------------------
createEmptyDatabaseTables <- function(dbUser, dbName, dbConnection= db.wellington.test)
{
  sql_command <- paste('drop table regions;
  drop table hits;

  create table regions(loc varchar primary key,
  chrom varchar,
  start int,
  endpos int);

  grant all on table "regions" to ', dbUser, ';', '

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

  grant all on table "hits" to ', dbUser, ';', sep="")

  dbGetQuery(dbConnection, sql_command)
} # createEmptyDatabaseTables
#-------------------------------------------------------------------------------
appendToRegionsTable <- function(tbl, dbConnection=db.wellington.test)
{
  dbWriteTable(dbConnection, "regions", tbl, row.names=FALSE, append=TRUE)
} # appendToRegionsTable
#-------------------------------------------------------------------------------
appendToHitsTable <- function(tbl, dbConnection=db.wellington.test)
{
  dbWriteTable(dbConnection, "hits", tbl, row.names=FALSE, append=TRUE)
} # appendToHitsTable
#-------------------------------------------------------------------------------
fillToDatabase <- function(tbl.regions, tbl.hits,
                           dbConnection=db.wellington.test,
                           dbUser = "ben",
                           dbName = "testwellington")
{
  # I bet I don't want to empty the tables every time I attempt to append to them...
  #createEmptyDatabaseTables(dbUser, dbName, dbConnection)
  appendToRegionsTable(tbl.regions, dbConnection)
  appendToHitsTable(tbl.hits, dbConnection)
}
