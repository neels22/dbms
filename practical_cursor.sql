-- create table orollcall(rollno number,name varchar(20));

-- create table nrollcall(rollno number,name varchar(20));

-- insert into orollcall values(1,'neel');
-- insert into orollcall values(2,'aditya');
-- insert into orollcall values(4,'max');
-- insert into orollcall values(5,'sam');
-- insert into orollcall values(1,'neel');

-- select *from orollcall;

-- insert into nrollcall select *from orollcall;

DECLARE
  CURSOR c1 IS
    SELECT rollno, name
    FROM nrollcall
    GROUP BY rollno, name
    HAVING COUNT(*) > 1;

  temp c1%ROWTYPE;
BEGIN
  OPEN c1;
  LOOP
    FETCH c1 INTO temp;
    EXIT WHEN c1%NOTFOUND;
    
    DELETE FROM nrollcall
    WHERE rollno = temp.rollno 
    AND ROWID NOT IN (
      SELECT MIN(ROWID)
      FROM nrollcall
      WHERE rollno = temp.rollno 
    );
  END LOOP;

  CLOSE c1;

  COMMIT;
END;
/



select *from nrollcall;
