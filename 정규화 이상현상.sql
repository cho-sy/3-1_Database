use madang;
drop table if exists summer;

create table summer(
sid integer, class varchar(20), price integer);

insert into summer values(100, 'FORTRAN', 20000);
insert into summer values(150, 'PASCAL', 15000);
insert into summer values(200, 'C', 10000);
insert into summer values(250, 'FORTRAN', 20000);

select * from summer;