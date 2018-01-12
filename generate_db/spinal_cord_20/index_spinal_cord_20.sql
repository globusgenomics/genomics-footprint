\connect spinal_cord_wellington_20;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect spinal_cord_hint_20
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
