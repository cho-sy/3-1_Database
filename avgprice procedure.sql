use madang;
delimiter //
create procedure AvgPrice( out AvgVal int)
begin
	select avg(price) into AvgVal from book where price is not null; 
end;

//
delimiter ;

call AvgPrice(@myValue);
select @myValue; 