\connect trenatest;
drop table testTable;
create table testTable(
    testfield char(50)
);

grant all on table testTable to trenatest;
