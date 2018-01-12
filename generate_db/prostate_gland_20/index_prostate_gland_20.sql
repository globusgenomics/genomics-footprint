\connect prostate_gland_wellington_20;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect prostate_gland_hint_20
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
