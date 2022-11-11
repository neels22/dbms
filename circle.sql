
create table circlea(radius number,area number);

DECLARE

	area NUMBER ;
	radius NUMBER;
	
	
BEGIN

		for radius IN 5..9 loop
		area := 3.14 * radius * radius;
	        dbms_output.Put_line('Area = ' || area);
                insert into circlea values(radius,area);
                END loop;



END;
/
 select *from circlea;
		









    RADIUS       AREA
---------- ----------
         5       78.5
         6     113.04
         7     153.86
         8     200.96
         9     254.34
         
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
modified version of the code	 
	 
	 
	 
	 create table circlearea(radius number , ar number);


declare 
  area number;
  rad number;
  
  n number;
 
  count number;
begin 
rad :=&rad;
 n :=&n;
count := 0;
  while(count <= n) loop
  area := 3.14 * rad * rad;
  dbms_output.Put_line('Area = ' || area);
  insert into circlearea values(rad , area);
  count := count + 1;
  end loop;
end;
/ 

select *from circlearea;



         
         
         
         
