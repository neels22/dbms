insert into libra values('dbms','i');
insert into libra values('webtech','i');
insert into libra values('cns','i');
insert into libra values('cloud','i');
insert into libra values('bigdata','i');

select *from libra;

desc libra_edit;


create or replace trigger lib_edit
after insert or update or delete on libra
for each row
enable
begin
    if updating then
        insert into libra_edit values(:old.bname,:old.status,SYSDATE);
    elsif inserting then
        insert into libra_edit values(:new.bname,:new.status,SYSDATE);
    else 
        insert into libra_edit values(:old.bname,:old.status,SYSDATE);
    end if;
end;                


delete from libra where bname='dbms';

insert into libra values('aii','R');

update libra set status='R' where bname = 'cns';

select *from libra_edit;

