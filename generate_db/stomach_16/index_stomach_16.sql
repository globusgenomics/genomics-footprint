\connect stomach_wellington_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect stomach_hint_16
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
