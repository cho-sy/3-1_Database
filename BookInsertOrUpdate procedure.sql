use madang;
delimiter // 
create procedure BookInsertOrUpdate(
	myBookID integer, myBookName varchar(40), myPublisher varchar(40), myPrice integer)
begin
	declare mycount int;
    select count(*) into mycount from book where bookname like myBookName;
    if mycount!=0 then
		#set SQL_SAFE_UPDSTES = 0; # 삭제 수정 연산위해 필요함
        update book set price=myprice where bookname like myBookName;
	else 
		insert into Book(bookid, bookname, publisher, price) value (myBookID, myBookName, myPublisher, myPrice);
	end if;

end;

//
delimiter ;

-- BookInsertOrUpdate 프로시저 실행-- 
call BookInsertOrUpdate(15, 'sports fun', 'madangscience', 25000); # 1. 15번 없음, insert 함수 진행
select * from book;
call BookInsertOrUpdate(15, 'sports fun', 'madangscience', 22000); # 2. 15번 있음, update 함수 진행
select * from book;

