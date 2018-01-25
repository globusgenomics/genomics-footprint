#/bin/bash

# For all 85 chromosome/database combos, copy the data to the fimo table

# 1 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/01_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/01_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/01_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/01_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/01_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 2 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/02_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/02_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/02_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/02_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/02_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 3 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/03_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/03_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/03_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/03_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/03_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 4 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/04_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/04_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/04_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/04_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/04_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 5 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/05_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/05_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/05_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/05_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/05_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 6 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/06_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/06_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/06_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/06_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/06_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 7 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/07_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/07_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/07_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/07_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/07_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 8 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/08_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/08_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/08_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/08_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/08_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 9 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/09_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/09_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/09_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/09_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/09_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 10 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/10_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/10_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/10_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/10_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/10_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 11 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/11_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/11_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/11_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/11_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/11_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 12 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/12_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/12_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/12_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/12_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/12_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 13-14 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/13_14_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/13_14_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/13_14_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/13_14_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/13_14_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 15-16 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/15_16_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/15_16_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/15_16_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/15_16_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/15_16_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 17, 18, 20 chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/17_18_20_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/17_18_20_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/17_18_20_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/17_18_20_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/17_18_20_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# 19, 21, 22, Y, MT chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/19_21_22_Y_MT_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/19_21_22_Y_MT_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/19_21_22_Y_MT_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/19_21_22_Y_MT_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/19_21_22_Y_MT_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &

# X chromosome
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/X_hocomoco_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/X_jaspar_mouse_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';"&
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/X_hocomoco_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/X_jaspar_human_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
psql trena -c "copy fimo_hg38 from '/scratch/data/fimo/X_homer_all_fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';" &
