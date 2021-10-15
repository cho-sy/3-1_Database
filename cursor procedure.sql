use madang;
delimiter //
create procedure Interest()
begin 
	declare myInterest int default 0.0;
    declare price int;
    declare endOfRow Boolean default false;
    declare InterestCursor cursor for select saleprice from orders;
    declare continue handler for not found set endOfRow=True;
    open InterestCursor;
    cursor_loop: loop
		fetch InterestCursor into Price;
        if endOfRow then leave cursor_loop;
        end if;
        if price >= 30000 then set myInterest=myInterest+Price*0.1;
        else set myInterest=myInterest+Price*0.05;
        end if;
	end Loop cursor_loop;
    Close InterestCursor;
    Select concat('전체 이익 금액 =', myInterest) as '전체 이익 금액';
end;
//
delimiter ;

call Interest();