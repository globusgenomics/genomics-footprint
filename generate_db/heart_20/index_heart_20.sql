\connect heart_wellington_20;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect heart_hint_20
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
