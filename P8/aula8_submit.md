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
... Write here your answer ...
```

### *f)* 

```
... Write here your answer ...
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
