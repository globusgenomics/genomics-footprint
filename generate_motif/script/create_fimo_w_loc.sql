\connect fimo;
drop table fimo_hg38;
create table fimo_hg38(motifname varchar,
                       chrom varchar,		       
		       start int,
                       endpos int,
	               strand varchar,
		       motifscore float,
		       pval float,
		       empty char(1),
		       sequence varchar,
		       loc varchar);
grant all on table fimo_hg38 to trena;

