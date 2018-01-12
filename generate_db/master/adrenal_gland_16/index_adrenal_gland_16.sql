\connect adrenal_gland_wellington_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect adrenal_gland_hint_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
