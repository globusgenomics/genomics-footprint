#/bin/bash

# For all 51 chromosome/database combos, copy the data to the fimo table

# 1 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr1_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 2 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr2_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 3 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr3_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 4 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr4_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 5 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr5_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 6 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr6_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 7 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr7_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 8 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr8_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 9 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr9_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 10 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr10_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 11 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr11_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 12 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr12_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 13 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr13_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 14 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr14_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 15 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr15_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 16 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr16_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 17 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr17_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 18 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr18_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 19 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr19_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 20 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr20_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 21 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr21_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 22 chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chr22_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# X chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chrX_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# Y chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chrY_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# MT chromosome
psql fimo -c "copy fimo_hg38 from './fimo_output/chrMT_fimo_output.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
