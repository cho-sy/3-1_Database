use madang;
drop table if exists summer;

create table summer(
sid integer, class varchar(20), price integer);

insert into summer values(100, 'FORTRAN', 20000);
insert into summer values(150, 'PASCAL', 15000);
insert into summer values(200, 'C', 10000);
insert into summer values(250, 'FORTRAN', 20000);

select sid,class from summer;
select price from summer where class like 'C';
select distinct class from summer where price = (select max(price) from summer);
select count(*) , sum(price) from summer;

#삭제이상
#7-1
select price as 'C 수강료' from summer where class like 'C';
delete from summer where sid=200;
insert into summer values(200, 'C', 10000);

#삽입이상
insert into summer values(null, 'Java', 25000);
select * from summer;
select count(*) '수강인원' from summer; # 5
select count(sid) '수강인원' from summer; #위 값과 다름 4
select count(*) '수강인원' from summer where sid is not null; # 4

#수정이상
update summer set price = 15000 where class = 'FORTRAN';
select * from summer;
select distinct price 'Fortran 수강료' from summer where class like 'FORTRAN';
update summer set price = 20000 where class =  'FORTRAN';
update summer set price = 15000 where class = 'FORTRAN' and sid =100;



