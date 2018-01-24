\connect trena;
\copy fimo_hg38 from '/local/Cory/for_Paul/fimo_out/newGRCh38.fimo.txt' delimiter E'\t' CSV header NULL as 'NULL';
