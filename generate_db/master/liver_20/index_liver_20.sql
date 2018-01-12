\connect liver_wellington_20;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect liver_hint_20
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
