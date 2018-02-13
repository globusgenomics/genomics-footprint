#!/bin/sh

PACKAGE_BASE=/mnt/galaxyTools/tools/R/3.3.3; export PACKAGE_BASE; . /mnt/galaxyTools/tools/R/3.3.3/env.sh;

Rscript /scratch/galaxy/test/generate_db/master/large_intestine_20/wellington.R
