\connect blood_vessel_wellington_16;
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);

\connect blood_vessel_hint_16
create index regions_index on regions (chrom, start, endpos);
create index hits_index on hits (loc);
