#/bin/bash

# For all 51 chromosome/database combos, copy the data to the fimo table

# 1 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/01_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/01_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/01_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 2 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/02_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/02_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/02_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 3 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/03_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/03_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/03_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 4 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/04_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/04_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/04_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 5 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/05_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/05_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/05_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 6 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/06_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/06_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/06_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 7 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/07_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/07_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/07_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 8 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/08_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/08_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/08_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 9 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/09_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/09_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/09_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 10 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/10_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/10_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/10_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 11 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/11_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/11_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/11_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 12 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/12_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/12_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/12_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 13-14 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/13_14_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/13_14_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/13_14_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 15-16 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/15_16_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/15_16_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/15_16_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 17, 18, 20 chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/17_18_20_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/17_18_20_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/17_18_20_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 19, 21, 22, Y, MT chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/19_21_22_Y_MT_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/19_21_22_Y_MT_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/19_21_22_Y_MT_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# X chromosome
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/X_final_hocomoco_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/X_final_jaspar_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql fimo -c "copy fimo_hg38 from '/scratch/data/2017_07_27_fimo_motifs/X_2017_07_26_new_motifs_edit.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
