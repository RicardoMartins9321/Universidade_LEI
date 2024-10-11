# BD: Guião 8


## ​8.1. Complete a seguinte tabela.
Complete the following table.

| #    | Query                                                                                                      | Rows  | Cost  | Pag. Reads | Time (ms) | Index used               | Index Op.          | Discussion |
| :--- | :--------------------------------------------------------------------------------------------------------- | :---- | :---- | :--------- | :-------- | :----------------------- |--------------------| :--------- |
| 1    | SELECT * from Production.WorkOrder                                                                         | 72591 | 0.484 | 531        | 1171      | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 2    | SELECT * from Production.WorkOrder where WorkOrderID=1234                                                  | 1     | 0.00  | 26         | 5         | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 3.1  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 10000 and 10010                               | 11    | 0.00  | 26         | 42        | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 3.2  | SELECT * FROM Production.WorkOrder WHERE WorkOrderID between 1 and 72591                                   | 72591 | 0.474 | 554        | 444       | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 4    | SELECT * FROM Production.WorkOrder WHERE StartDate = '2012-05-14'                                          | 55    | 0.474 | 554        | 91        | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 5    | SELECT * FROM Production.WorkOrder WHERE ProductID = 757                                                   | 9     | 0.00  | 44         | 41        | IX_WorkOrder_ProductID   |  Index Scan         |
| 6.1  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 757                              | 9     | 0.00  | 44         | 22        | IX_WorkOrder_ProductID   |  Index Scan         |
| 6.2  | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945                              | 1105  | 0.474 | 554        | 30        | IX_WorkOrder_ProductID   | Clustered Index Scan|
| 6.3  | SELECT WorkOrderID FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04'            | 1     | 0.474 | 556        | 9         | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 7    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' | 1     | 0.474 | 556        | 9         | PK_WorkOrder_WorkOrderID | Clustered Index Scan|
| 8    | SELECT WorkOrderID, StartDate FROM Production.WorkOrder WHERE ProductID = 945 AND StartDate = '2011-12-04' | 1     | 0.474 | 556        | 9         | PK_WorkOrder_WorkOrderID | Clustered Index Scan|


## ​8.2.

### a)

```
ALTER TABLE mytemp
ADD CONSTRAINT PK_mytemp_rid PRIMARY KEY CLUSTERED (rid);
```

### b)

```
Tempo para introdução de 50000 novos registos: 80313 milisegundos

Percentagem de fragmentação dos índices: 99,2797118847539 %
Percentagem de ocupação das páginas dos índices: 68,9428341981715 %
```

### c)

```
CREATE UNIQUE CLUSTERED INDEX  Index_rid_1 ON mytemp(rid) WITH (FILLFACTOR = 65, PAD_INDEX = ON)
 - Tempo: 1:22
CREATE UNIQUE CLUSTERED INDEX  Index_rid_1 ON mytemp(rid) WITH (FILLFACTOR = 80, PAD_INDEX = ON)
 - Tempo: 1:21
CREATE UNIQUE CLUSTERED INDEX  Index_rid_1 ON mytemp(rid) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
 - Tempo: 1:20
```

### d)

```
ALTER TABLE mytemp
ALTER COLUMN rid BIGINT IDENTITY (1, 1) NOT NULL;

CREATE UNIQUE CLUSTERED INDEX  Index_rid_1 ON mytemp(rid) WITH (FILLFACTOR = 65, PAD_INDEX = ON)
 - Tempo: 1:22
CREATE UNIQUE CLUSTERED INDEX  Index_rid_2 ON mytemp(rid) WITH (FILLFACTOR = 80, PAD_INDEX = ON)
 - Tempo: 1:21
CREATE UNIQUE CLUSTERED INDEX  Index_rid_3 ON mytemp(rid) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
 - Tempo: 1:20
```

### e)

```
CREATE INDEX Index_mytemp_at1 ON mytemp (at1);
CREATE INDEX Index_mytemp_at2 ON mytemp (at2);
CREATE INDEX Index_mytemp_at3 ON mytemp (at3);
CREATE INDEX Index_mytemp_lixo ON mytemp (lixo);

Tempo inserção sem os índices: 80313 milisegundos
Tempo inserção com todos os índices: 141637 milisegundos

Podemos assim concluir que o tempo para a operação de inserção aumenta uma vez que vamos ter de estar a fazer a operação para cada um dos índices criados.
```

## ​8.3.

```
###### i.
CREATE UNIQUE CLUSTERED INDEX Ix_EmployeeSsn ON employee(Ssn);

###### ii.
CREATE INDEX Ix_EmployeeNames ON employee(Lname, Fname);

###### iii.
CREATE INDEX Ix_EmployeeDno ON employe(Dno);

###### iv.
CREATE CLUSTERED INDEX Ix_EmployeeWorks ON works_on(Essn, Pno);

###### v.
CREATE CLUSTERED INDEX Ix_Dependent ON dependent(Essn);

###### vi.
CREATE INDEX Ix_ProjectDNum ON project(Dnum);
```
