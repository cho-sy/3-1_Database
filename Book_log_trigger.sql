drop trigger AfterInsertBook;
delimiter //
create trigger AfterInsertBook
	after insert on Book for each row 
begin 
	declare aveg int;
    insert into Book_log 
		values (new.bookid, new.bookname, new.publisher, new.price);
end;
//
delimiter ;

insert into book values (16, 'sports', 'yeesang', 25000);
select * from book where bookid=16;
select * from Book_log;