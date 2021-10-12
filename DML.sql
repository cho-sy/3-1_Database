#Insert
#3-44
insert into Book(bookid, bookname, publisher, price) value(11, '스포츠 의학', '한솔의학서적', 90000);

#3-45
delete from Book where bookid = 11; 
insert into Book(bookid, bookname, publisher) value(11, '스포츠 의학', '한솔의학서적'); 

#3-46
insert into Book select * from imported_book; #얘도 되겠지만...
insert into Book(bookid, bookname, publisher, price) select bookid, bookname, publisher, price from imported_book; #이게 더 정확하긴 함 

#Update
#3-47
update customer
set address='대한민국 부산'
where custid=5; 

#3-48
update book
set publisher=(select publisher from imported_book where bookid=21)
where bookid=14;

#Delete
#3-48
delete from book where bookid=11;

#3-49
delete from customer; #안됨 당연함