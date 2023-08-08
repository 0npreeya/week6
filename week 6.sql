drop trigger if exists update_total_credit;
delimiter //
create trigger update_total_credit
after insert on register_detail for each row
begin
declare total float;
select sum(credit) into total from register_detail 
join section using(idsection) 
join course using(idcourse)
where idregister = new.idregister;
update register set credit_total = total where idregister = new.idregister;
end//
delimiter ;

show triggers;

insert into register_detail value (NULL, 1, 2);