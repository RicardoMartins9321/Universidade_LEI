DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;

--- Apaga as tabelas se já existirem
IF OBJECT_ID('mytemp', 'U') IS NOT NULL
	DROP TABLE mytemp;

CREATE TABLE mytemp (
 rid BIGINT /*IDENTITY (1, 1)*/ NOT NULL,
 at1 INT NULL,
at2 INT NULL,
at3 INT NULL,
lixo varchar(100) NULL
);

ALTER TABLE mytemp
ADD CONSTRAINT PK_mytemp_rid PRIMARY KEY CLUSTERED (rid);


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
@start_time, @end_time))

USE AdventureWorks2012;
SELECT * FROM sys.dm_db_index_physical_stats( db_id('AdventureWorks2012'), OBJECT_ID('mytemp'), Null, Null, 'DETAILED' );


CREATE INDEX Index_mytemp_at1 ON mytemp (at1);
CREATE INDEX Index_mytemp_at2 ON mytemp (at2);
CREATE INDEX Index_mytemp_at3 ON mytemp (at3);
CREATE INDEX Index_mytemp_lixo ON mytemp (lixo);