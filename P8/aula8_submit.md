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
... Write here your answer ...
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
... Write here your answer ...
```

### *h)* 

```
... Write here your answer ...
```

### *i)* 

```
... Write here your answer ...
```
