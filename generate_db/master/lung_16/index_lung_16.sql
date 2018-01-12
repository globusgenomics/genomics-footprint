\connect lung_wellington_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect lung_hint_16
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
