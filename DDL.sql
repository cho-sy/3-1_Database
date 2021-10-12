#CREATE 
#3-34
drop table NewBook;
create table NewBook(
	bookid 	integer primary key,
    bookname 	varchar(20),
    publisher 	varchar(20),
    price	integer
);

#3-35
drop table NewCustomer;
create table NewCustomer(
	custid 	integer	 primary key,
	name 	varchar(40),
    address 	varchar(40),
    phone	varchar(30)
);

#3-36

create table NewOrders(
	orderid		integer,
    custid		integer		not null,
	bookid 		integer 	not null,
    saleprice	integer,
    orderdate	date,
	primary key(orderid),
	foreign key(custid) references NewCustomer(custid) on delete cascade
) ;

#ALTER
#3-37

alter table NewBook add isbn varchar(13);

#3-38
alter table NewBook modify isbn integer;

#3-39
alter table NewBook drop column isbn;

#3-40
alter table NewBook modify bookid int not null; 

#3-41
alter table NewBook add primary key(bookid);

#DROP
#3-42
drop table NewBook; 
