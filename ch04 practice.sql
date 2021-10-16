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