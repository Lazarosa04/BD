# BD: Guião 8


## ​8.1
 
### *a)*

```
Create Procedure RemoveEmployee @Ssn Int
As
Delete From Works_On where Essn = @Ssn
Delete From Dependents where Essn = @Ssn
Delete From Employee where Ssn = @Ssn		--Tem de ser a última instrução pois as outras dependem da existência deste
Go
```

### *b)* 

```
CREATE PROCEDURE get_managers_and_oldest_manager (@oldestEmployee INT OUTPUT)
AS
	SELECT TOP 1 @oldestEmployee = Ssn
	FROM (department JOIN employee ON Mgr_ssn = Ssn) 
	ORDER BY Mgr_start_date DESC
	SELECT * FROM (department JOIN employee ON Mgr_ssn = Ssn)

```

### *c)* 

```
Create Trigger LimitManager On Department
Instead Of Insert, Update As
	DECLARE @Mgr_ssn INT;
	SELECT @Mgr_ssn=Mgr_ssn FROM inserted;

	IF @Mgr_ssn IN (SELECT Mgr_ssn FROM department)
        RaisError('Employee cannot manage more than one department', 16, 1);
		Rollback transaction;
	

```

### *d)* 

```
... Write here your answer ...
```

### *e)* 

```
CREATE FUNCTION udfe (@ssn CHAR(9)) RETURNS TABLE
AS
	RETURN (SELECT DISTINCT Pname, Plocation FROM employee JOIN works_on ON Essn=@ssn JOIN project ON Pno=Pnumber);
```

### *f)* 

```
CREATE FUNCTION udff (@dno INT) RETURNS TABLE
AS
	RETURN (
		SELECT * FROM employee AS E WHERE @dno=Dno AND E.salary > (
			SELECT AVG(Salary) FROM employee WHERE Dno=@dno
		)
	);
```

### *g)* 

```
CREATE FUNCTION employeeDeptHighAverage(@departId  INT)
RETURNS @table TABLE (
	pname  VARCHAR(15), 
	pnumber INT, 
	plocation VARCHAR(15), 
	dnum INT, 
	budget FLOAT, 
	totalbudget FLOAT )
AS

BEGIN
	DECLARE C CURSOR
        FOR
            SELECT Pname, Pnumber, Plocation, Dnum, SUM((Salary/40)*Hours) AS Budget  
			 FROM (project JOIN works_on ON Pnumber=Pno) JOIN employee ON Essn=Ssn WHERE Dnum=@departId
			  GROUP BY Pnumber, Pname, Plocation, Dnum;
 
	DECLARE @pname AS VARCHAR(15), @pnumber AS INT, @plocation as VARCHAR(15), @dnum AS INT, @budget AS FLOAT, @totalbudget AS FLOAT;
	SET @totalbudget = 0;
    OPEN C;
	FETCH C INTO @pname, @pnumber, @plocation, @dnum, @budget;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @table VALUES (@pname, @pnumber, @plocation, @dnum, @budget, @totalbudget);
		FETCH C INTO @pname, @pnumber, @plocation, @dnum, @budget;
	END
	CLOSE C;
	DEALLOCATE C;
	RETURN;
END
```

### *h)* 

```
CREATE TRIGGER dep_deletion_instead_of ON department INSTEAD OF DELETE
AS
	IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted'))
		CREATE TABLE department_deleted (
		Dname VARCHAR(15) NOT NULL,
		Dnumber INT NOT NULL,
		Mgr_ssn CHAR(9),
		Mgr_start_date DATE,
		PRIMARY KEY (Dnumber),
		UNIQUE (Dname),
		FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn) 
	);
	INSERT INTO department_deleted SELECT * FROM deleted;
	DELETE FROM department WHERE Dnumber IN (SELECT A.Dnumber FROM deleted AS A);


CREATE TRIGGER dep_deletion ON department AFTER DELETE
AS
	IF NOT (EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'department_deleted'))
		CREATE TABLE department_deleted (
		Dname VARCHAR(15) NOT NULL,
		Dnumber INT NOT NULL,
		Mgr_ssn CHAR(9),
		Mgr_start_date DATE,
		PRIMARY KEY (Dnumber),
		UNIQUE (Dname),
		FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn) 
	);
	INSERT INTO department_deleted SELECT * FROM deleted;


```

### *i)* 

```
... Write here your answer ...
```
