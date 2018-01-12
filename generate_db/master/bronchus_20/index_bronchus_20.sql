\connect bronchus_wellington_20;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect bronchus_hint_20
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
