-- create table cirarea(radius number,area number);



declare

    radius number;
    area number;
    pi number := 3.14;

begin

    for radius in 5..9 loop
        area := pi*radius*radius;
        insert into cirarea values(radius,area);

    end loop;

    end;
    /        

select *from cirarea;
