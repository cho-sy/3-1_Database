use madang;
Drop Table if exists summer;

create table summer ( sid Integer, class varchar(20), price integer);

insert into summer values (100, 'Fortran', 20000);
insert into summer values (150, 'pascal', 15000);
insert into summer values (200, 'C', 10000);
insert into summer values (250, 'Fortran', 20000);

select * from summer; 

select price 'C 수강료' from summer where class like 'C';
delete from summer where sid = 200;

insert into summer values(null, 'Java', 25000);
select count(sid) from summer;
select count(*) from summer;
select count(*) from summer where sid is not null;
