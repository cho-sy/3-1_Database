use madang;
delimiter //
create procedure InsertBook(
	in myBookID integer,
    in myBookName varchar(40),
    in myPublisher varchar(40),
    in myPrice integer)
begin
	insert into Book(bookid, bookname, publisher, price)
    values(myBookID, myBookName, myPublisher, myPrice);
END;
//
delimiter ;  
call InsertBook(13, 'q', 'w', 25000);
select * from book; 

