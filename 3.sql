CREATE OR REPLACE FUNCTION calfine (Roll integer) RETURNS void as $$
DECLARE
retdate date;
issuedate date;
nod integer;
current_date1 date;
fine5 integer := 5;
fine50 integer := 50;
fine integer;
BEGIN
     execute'select dateofissue from Borrower where Roll_id=$1' into issuedate using Roll;
     raise notice 'issue date%',issuedate;
     current_date1 := now(); 
     nod := current_date1 - issuedate;
     raise notice 'nod%',nod;
     IF nod > 30 THEN
     	fine := fine50*nod;
     	insert into Fine values (Roll,current_date1,fine);
  	UPDATE Borrower set status = 'R' WHERE Roll_id = Roll;
     ELSIF nod < 30 THEN
     	fine :=fine5*nod;
     	insert into Fine values (Roll,current_date1,fine);
     	UPDATE Borrower set status = 'R' WHERE Roll_id = Roll;
     END IF;
     	
     
END; 

$$ LANGUAGE plpgsql;

----------------------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION insertborrower (Roll_id integer , Name varchar(20),DateofIssue date,NameofBook varchar(20),Status varchar(5)) RETURNS void as $$
BEGIN
     insert into Borrower values (Roll_id,Name,DateofIssue,NameofBook,Status);
END; 

$$ LANGUAGE plpgsql;
