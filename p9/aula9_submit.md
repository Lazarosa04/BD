# BD: Guião 9


## ​9.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used | Index Op.            | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :--------- | :------------------- | :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 1171      | WorkOrderID (PK)          | Clustered Index Scan |            |
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  |   1  |    0.0032831   |   278         |   46        |       WorkOrderID (PK)      |      Clustered Index Seek                |            |
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               |  11     |    0.0032952   |         278   |   64        |        WorkOrderID (PK)    |   Clustered Index Seek                   |            |
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   |  72591     |    0.473   |        808    |       531    |     WorkOrderID (PK)       |                  Clustered Index Seek    |            |
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2007-06-25'                                          |    72591   |    0.473   |      812      |    39       |    WorkOrderID (PK)         |   Clustered Index Scan                   |            |
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   |      11.4 |    0.037   |        302    |         76  |       ProductID     |              Non Clustered Index Seek        |            |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              |   11.4    |    0.037   |      302      |   55        |       ProductID Covered (StartDate)     |                 Non Clustered Index Seek     |            |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              |   1105    |    0.473   |      812      |    67       |       ProductID Covered (StartDate)     |          Clustered Index Scan            |            |
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04'            |  1     |    0.473   |         814   |          40 |        ProductID Covered (StartDate)    |       Clustered Index Scan               |            |
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |     1  |     0.473  |      814      |   35        |       ProductID and StartDate     |          Clustered Index Scan            |            |
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2006-01-04' |       |       |            |           |        Composite (ProductID, StartDate)     |          Non Clustered Index Seek            |            |

## ​9.2.

### a)

```
... Write here your answer ...
```

### b)

```
... Write here your answer ...
```

### c)

```
... Write here your answer ...
```

### d)

```
... Write here your answer ...
```

### e)

```
... Write here your answer ...
```

## ​9.3.

```
... Write here your answer ...
```
