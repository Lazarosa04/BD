# BD: Guião 9


## ​9.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :--------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 1171      | WorkOrderID (PK)          | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  |   1  |    0.003   |   20         |   64        |       WorkOrderID (PK)      |      Clustered Index Seek                |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               |  11     |    0.003   |         20   |   81        |        WorkOrderID (PK)    |   Clustered Index Seek                   |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   |  72591     |    0.473   |        558    |       541    |     WorkOrderID (PK)       |                  Clustered Index Seek    |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2012-05-14'                                         |    55   |    0.522   |      556      |    127       |    WorkOrderID (PK)         |   Clustered Index Scan                   |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   |      9 |    0.003   |        46    |         65  |       ProductID     |              Non Clustered Index Seek        |            |
| 6.1  | SELECT WorkOrderID StartDate FROM Production.WorkOrder WHERE ProductID = 757                              |   9    |    0.003   |      40      |   41        |       ProductID Covered (StartDate)     |                 Non Clustered Index Seek     |            |
| 6.2  | SELECT WorkOrderID StartDate FROM Production.WorkOrder WHERE ProductID = 945                              |   1105    |    0.473   |      556      |    87       |       ProductID Covered (StartDate)     |          Clustered Index Scan            |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04'            |  1     |    0.003   |         35   |          34 |        ProductID Covered (StartDate)    |       Non Clustered Index Seek             |            |
| 7    | SELECT WorkOrderID StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' |     1  |     0.016  |      35      |   30        |       ProductID and StartDate     |          Non Clustered Index Seek           |            |
| 8    | SELECT WorkOrderID StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' |   1    |      0.003 |        28    |       30    |        Composite (ProductID, StartDate)     |                Non Clustered Index Seek      |            |




## ​9.2.

### a)

```
CREATE CLUSTERED INDEX idxRid on mytemp(rid);
```

### b)

```
use AdventureWorks2012;
go

CREATE TABLE mytemp (
	rid BIGINT /*IDENTITY (1, 1)*/ NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL);

CREATE CLUSTERED INDEX idxRid on mytemp(rid);

-- Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;
SET nocount ON
WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS; -- need to be sysadmin
	INSERT mytemp (rid, at1, at2, at3, lixo)

	SELECT cast((RAND()*@nelem*40000) as int), cast((RAND()*@nelem) as int), 
			cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
			'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process

SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
@start_time, @end_time));

SELECT * FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED') as S

--Fragmentação : 99.05%
--Ocupação : 69.1%
--61623ms
```

### c)

```
use AdventureWorks2012;
go

DELETE FROM mytemp;

ALTER INDEX ALL on mytemp REBUILD WITH (FILLFACTOR=65)

-- Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;
SET nocount ON
WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS; -- need to be sysadmin
	INSERT mytemp (rid, at1, at2, at3, lixo)

	SELECT cast((RAND()*@nelem*40000) as int), cast((RAND()*@nelem) as int), 
			cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
			'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process

SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
@start_time, @end_time));

SELECT * FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED') as S

--65
--62246 ms

--80
--61350 ms

--90
--63726 ms

```

### d)

```
DROP TABLE mytemp;
CREATE TABLE mytemp (
	rid BIGINT IDENTITY (1, 1) NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL
);

CREATE CLUSTERED INDEX ixRid on mytemp(rid) WITH (FILLFACTOR=65)

DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN

	DBCC DROPCLEANBUFFERS; -- need to be sysadmin

	INSERT mytemp (at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem) as int),
			cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
			'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'


-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
		@start_time, @end_time));



SELECT * FROM sys.dm_db_index_physical_stats (DB_ID(), OBJECT_ID('mytemp'), NULL, NULL, 'DETAILED') as S

--65
--62303 ms

--80
--61466 ms

--90
--62623 ms
```

### e)

```
--Sem índices
use AdventureWorks2012;
go

DROP INDEX ixRid on mytemp

DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN

	DBCC DROPCLEANBUFFERS; -- need to be sysadmin

	INSERT mytemp (at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem) as int),
			cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
			'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'


-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
		@start_time, @end_time));

--63793 ms

-- Com índices

use AdventureWorks2012;
go


CREATE INDEX ix1 on mytemp(rid)
CREATE INDEX ix2 on mytemp(at1)
CREATE INDEX ix3 on mytemp(at2)
CREATE INDEX ix4 on mytemp(at3)
CREATE INDEX ix5 on mytemp(lixo)

DELETE FROM mytemp;

DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time

-- Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN

	DBCC DROPCLEANBUFFERS; -- need to be sysadmin

	INSERT mytemp (at1, at2, at3, lixo)
	SELECT cast((RAND()*@nelem) as int),
			cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int),
			'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'


-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND,
		@start_time, @end_time));

--68930 ms

--Adicionar índices em todos os atributos cria um overhead, pelo que a inserção com os índices todos é substancialmente mais lenta que a inserção sem os índices.
```


## ​9.3.

```
i. Create Unique Clustered Index SsnIndex On Company.Employee(Ssn);

ii. Create NonClusteed Index FnameLnameIndex On Company.Employee(Fname,Lname);

iii. Create NonClustered Index EmployeeDnoIndex On Company.Employee(Dno);
     Create Unique Clustered Index DnumberIndex On Company.Department(Dnumber);

iv. Create NonClustered Index PnumIndex On Empresa.Project(Pnumber);
    Create Unique Clustered Index PnoEssnIndex On Empresa.Works_on(Pno, Essn);

v. Create Unique Clustered Index DepNameEssnIndex On Empresa.Dependents(Dependent_name, Essn);

vi. Create Clustered Index DnoPnumIndex On Empresa.Project(Pnumber,Dnum);
```
