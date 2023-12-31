-- Experiment No 10 Indexing 
-- TY B 10

create table test(
	first_name varchar(50),
	last_name varchar(50),
	company_name varchar(50),
	address varchar(50),
	city varchar(50)
);

create index index1 on test(first_name);

explain analyze select * from test where first_name = 'Bok'; 
create index emp_index on test(first_name); 

explain analyze select * from test where first_name = 'Bok';

create index emp_hash_index on test using hash(first_name);
explain analyze select * from test where first_name = 'Bok';

select * from information_schema.tables where table_name like '%index%';

select * from pg_catalog.pg_statio_user_indexes;

select * from pg_catalog.pg_stat_user_indexes;

select ctid, * from test;