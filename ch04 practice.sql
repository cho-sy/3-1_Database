use madang;
#4-1
select abs(-78), abs(78) from dual;

#4-2
select round(4.875, 1) from dual;

#4-3 
select custid, round(avg(saleprice), -2) as '평균 주문 금액'
from orders
group by custid;

#4-4
-- select *
-- from book
-- where bookname like '%야구%'; 
#지가 알아서 찾아주나보다... 
select bookid, replace(bookname, '야구', '농구') as bookname, publisher, price from book;

#4-5 
select bookname, char_length(bookname) as '문자 수', length(bookname) as '바이트 수'
from book
where publisher = '굿스포츠';

#4-6
select substr(name, 1,1), count(*)
from customer
group by substr(name, 1,1);

#4-7
select orderid, orderdate, adddate(orderdate, interval 10 day) as '확정' 
from orders;

#4-8
select orderid, str_to_date(orderdate, '%Y-%m-%d') as '주문일', custid, bookid
from orders
where orderdate = date_format('20140707', '%Y%m%d');

#4-9
select sysdate(), date_format(sysdate(), '%Y/%m/%d %M %h:%s');

#4-10
select name, ifnull(phone, '연락처 없음') 
from customer;

#4-11
set @seq:=0;
select (@seq:=@seq+1) '순번', custid, name, phone from customer where @seq<2;

#4-12 
select (select name from customer c where c.custid=o.custid) as 'name' , sum(saleprice) as 'total'
from orders o
group by custid;

#4-13
alter table orders add bname varchar(40);
update orders set bname = (select bookname from book where book.bookid = orders.bookid); 
alter table orders drop column bname;

#4-14
select c.name, sum(saleprice)
from orders o, (select custid, name from customer where custid<=2) c
where c.custid=o.custid
group by c.name;

#4-15
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice) from orders);

#4-16
select orderid, custid, saleprice
from orders o
where saleprice > (select avg(saleprice) from orders o2 where o.custid=o2.custid)
group by custid;

#4-17
select sum(saleprice)
from orders
where custid in (select custid from customer where address like '%대한민국%');

#4-18 
select orderid, saleprice
from orders
where saleprice > all (select saleprice from orders where custid='3'); 

#4-19
select sum(saleprice)
from orders
where exists (select * from customer where address like '%대한민국%' and customer.custid=orders.custid);

#4-20
create view vw_Customer as select * from customer where address like '%대한민국%';

#4-21
drop view vw_O;
create view vw_O(name, bookname, orderid, saleprice) as select c.name, b.bookname, orderid, saleprice from customer c, book b, orders o where c.custid = o.custid and o.bookid = b.bookid; 
select orderid, bookname, saleprice from vw_O where name = '김연아';

#4-22
create or replace view vw_Customer(custid, name, address) as select custid, name, address from customer where address like '%영국%'; 

#4-23
drop view vw_Customer; 

#4-24
create index ix_Book on book(bookname); 

#4-25
create index ix_Book2 on book(publisher, price);

#4-26
analyze table book;

#4-27
drop index ix_Book on book;
drop index ix_Book2 on book;

#연습문제

select str_to_date('12 05 2014', '%d %m %Y');
select cast('12.3' as decimal(3,1));
create table mybook(bookid int, price int);
insert into mybook(bookid, price) values (1, 10000);
insert into mybook(bookid, price) values (2, 20000);
insert into mybook(bookid, price) values (3, null);
select * from mybook;
select bookid, ifnull(price, 0)
from mybook;
select *
from mybook 
where price is null;
select *
from mybook 
where price = ' ';
select bookid, price+100
from mybook;
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;
select count(*), count(price)
from mybook;
select sum(price), avg(price)
from mybook;
set @RNUM = 0;

-- (1)
select *
from book;

select *, @RNUM := @RNUM + 1 as ROWNUM
from book, (select @RNUM := 1) R
where @RNUM <= 5;

select *, @RNUM := @RNUM + 1 as rownum
from book, (select @RNUM := 1) R
where @RNUM <= 5
order by price;

create view highorders as select bookid, bookname, name, publisher, price from customer, book where price>=20000;
select bookname, name from highorders;
create or replace view highorders as select bookid, bookname, name from customer, book where price>=20000;