#/bin/bash

# For all 51 chromosome/database combos, copy the data to the fimo table

# 1 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/1.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 2 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/2.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 3 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/3.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 4 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/4.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 5 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/5.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 6 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/6.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 7 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/7.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 8 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/8.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 9 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/9.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 10 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/10.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 11 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/11.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 12 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/12.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 13 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/13.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 14 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/14.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 15 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/15.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 16 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/16.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 17 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/17.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 18 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/18.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 19 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/19.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 20 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/20.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 21 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/21.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 22 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/22.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# X chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/X.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# Y chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/Y.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# MT chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/MT.fa.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
