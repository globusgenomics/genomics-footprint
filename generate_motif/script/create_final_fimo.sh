#/bin/bash

# For all 85 chromosome/database combos, copy the data to the fimo table

# 1 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/01_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/01_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 2 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/02_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/02_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 3 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/03_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/03_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 4 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/04_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/04_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 5 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/05_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/05_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 6 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/06_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/06_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 7 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/07_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/07_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 8 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/08_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/08_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 9 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/09_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/09_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 10 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/10_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/10_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 11 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/11_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/11_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 12 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/12_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/12_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 13-14 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/13_14_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/13_14_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 15-16 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/15_16_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/15_16_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 17, 18, 20 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/17_18_20_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/17_18_20_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# 19, 21, 22, Y, MT chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/19_21_22_Y_MT_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/19_21_22_Y_MT_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&

# X chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/X_final_hocomoco_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/completed/X_final_jaspar_motifs.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
