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
