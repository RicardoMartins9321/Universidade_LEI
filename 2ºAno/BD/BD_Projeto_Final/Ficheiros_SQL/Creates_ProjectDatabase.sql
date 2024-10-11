/* Depois de criado a base de dados e o schema pela primeira vez comentar as linhas de código correspondentes,
    caso queira voltar a recriar e colocar as tabelas, valores bases e objetos SQL.*/

USE master
GO
if exists (select * from sysdatabases where name='Project')
		drop database Project
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE Project
  ON PRIMARY (NAME = N''Project'', FILENAME = N''' + @device_directory + N'Project.mdf'')
  LOG ON (NAME = N''Project_log'',  FILENAME = N''' + @device_directory + N'Project.ldf'')')
go

USE Project
GO

-- Apagar o AMS schema se já existir
IF EXISTS (SELECT * FROM sys.schemas WHERE name = 'AMS')
BEGIN
    DROP SCHEMA AMS;
END;
GO

-- Criar o schema AMS
CREATE SCHEMA AMS;
GO
