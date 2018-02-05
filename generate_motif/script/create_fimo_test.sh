#/bin/bash
# MT chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/MT.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
