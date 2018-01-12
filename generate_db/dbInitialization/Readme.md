These scripts set up the database and give recipes for the following databases for work with the DNase data processing workflow.

First, initialize the database and create the trena and trenatest users:
script: initDB.sql

Then, some test/default databases that are fairly disposable:

**trenatest**
script: createTrenaTest.sql
user = trenatest
dbname = trenatest

**testwellington**
script: createTestWellington.sql
user = trenatest
dbname = testwellington

Then, some real databases for populating with data:

**Fimo**
script: createFimo.sql
user = trena
dbname = trena

**wellington**
script: createWellington.sql
user = trena
dbname = $TISSUE-wellington
