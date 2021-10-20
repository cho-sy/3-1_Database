use madang;
#01
#1
select bookname from book where bookid=1;
#2
select bookname from book where price>20000;
#3
select name, sum(saleprice) from customer c, orders o where c.custid=o.custid and c.name='박지성';
#4
select name, count(bookid) from customer c, orders o where c.custid=o.custid and c.name='박지성';
#5
select name, count(publisher) from customer c, orders o, book b where c.custid=o.custid and b.bookid = o.bookid and c.name='박지성';
#6
select bookname, price, abs(price-saleprice) from book b, orders o, customer c 
where c.custid=o.custid and b.bookid=o.bookid and c.name='박지성'; 
#7
select bookname from book b, orders o, customer c where c.custid=o.custid and b.bookid=o.bookid and c.name != '박지성';

#02
#1
use madang;
select count(*) from book;
#2
select count(distinct publisher) from book;
#3
select name, address from customer;
#4
select orderid from orders where orderdate between '2014-07-04' and '2014-07-07';
#5
select orderid from orders where orderdate not between '2014-07-04' and '2014-07-07';
#6
select name, address from customer where name like "김%";
#7
select name, address from customer where name like "김%아";
#8
select name from customer where custid not in (select custid from orders);
#9
select sum(saleprice), avg(saleprice) from orders;
#10
select name, sum(saleprice) from orders o, customer c where c.custid=o.custid group by c.custid;
#11
select name, bookname from customer c, orders o, book b where c.custid = o.custid and o.bookid=b.bookid;
#12
select * from book b join orders o on b.bookid=o.bookid where abs(b.price-o.saleprice) like (select max(abs(b.price-o.saleprice)) from book b, orders o where b.bookid = o.bookid);
#13
select name from customer c, orders o where c.custid=o.custid group by c.custid having avg(o.saleprice)>(select avg(saleprice) from orders); 

#03
#1
select distinct name, publisher from customer c, orders o, book b where name not like "박지성" and publisher in (select publisher from customer c, orders o, book b where c.custid=o.custid and o.bookid=b.bookid and name="박지성");
#2
select name from customer c, orders o, book b where c.custid=o.custid and o.bookid=b.bookid group by name having count(distinct publisher)>1;
#3
select bookname from book b where (select count(b.bookid) from book, orders o where book.bookid=o.bookid and b.bookid = book.bookid) >= 0.3 * (select count(*) from customer);

#04
#1
use madang;
insert into Book(bookid, bookname, publisher, price) values (11, 'what', 'fuckyou', '10000');
#2
delete from book where publisher like "삼성당";
delete from book where publisher like "fuckyou";
#3
#4
update book set publisher = "대한출판사" where publisher="대한미디어";
#5
create table Bookcompany(
name varchar(20) primary key,
 address varchar(20), begin date);
 #6 
 alter table Bookcompany add webaddress varchar(30);
 #7
 insert into Bookcompany values ('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://co.kr');