create table studmarks(name varchar(20),marks number);

create table result1(name varchar2(20),marks number,clas varchar2(20));

CREATE TABLE result(roll_number NUMBER , name VARCHAR2(25), class VARCHAR2(30));


create or replace procedure pro1(name in varchar2,marks in number)as
begin
if (marks >=990 and marks<=1500)then
    insert into result1 values(name,marks,'distinction');
elsif(marks>=900 and marks<=990)then
    insert into result1 values(name,marks,'first class');
elsif(marks>=825 and marks<=899)then
    insert into result1 values(name,marks,'second class') ;
else
    insert into result1 values(name,marks,'pass');
end if;

insert into studmarks values(name,marks);

end pro1;
/


begin 

    pro1('maddy',950);

end;
/    

select *from result1;
