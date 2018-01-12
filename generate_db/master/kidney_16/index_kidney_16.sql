\connect kidney_wellington_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect kidney_hint_16
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
