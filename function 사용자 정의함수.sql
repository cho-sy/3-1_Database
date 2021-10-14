delimiter //
create function fnc_interest(Price Integer) returns int
begin
	declare myInterest integer;
    if Price >= 30000 then
		set myInterest = Price *0.1;
	else 
		set myInterest := Price *0.05;
	end if;
    return myInterest;
end; //
delimiter ;
select custid, orderid, saleprice, fnc_Interest(saleprice) as interest
From Orders