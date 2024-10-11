# BD: Guião 9


## ​9.1

### *a)*

```
CREATE PROCEDURE pr_RemoveEmployee (@EmpSSN INT)
AS
BEGIN
    BEGIN TRANSACTION;  -- Starting the transaction

    BEGIN TRY
        DELETE FROM dependent
        WHERE Essn = @EmpSSN;

        DELETE FROM works_on
        WHERE Essn = @EmpSSN;

        DELETE FROM employee
        WHERE Ssn = @EmpSSN;

        -- Update subordinates' Super_ssn to NULL if their supervisor is the employee being removed
        UPDATE employee
        SET Super_ssn = NULL
        WHERE Super_ssn = @EmpSSN;

        COMMIT TRANSACTION;  -- Commit the transaction if no errors
	END TRY
    BEGIN CATCH
		ROLLBACK TRANSACTION;  -- Rollback if there is an error
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState)
	END CATCH
END;


Preocupações adicionais:
1. Garantur que todos os deletes são tratados como uma única transação de forma a manter a consistência dos dados.
2. Implementar alguma forma tipo de tratamento de erros durante a execução, que seja capaz de capturar exceções e reverter as alterações se alguma parte da execução falhar.
3. Certificar-nos de que o procedimento apenas posssa ser executado por utilizadores com autorização para isso.
4. Lidar com as referências de chaves estrangeiras que possam fazer referência aos dados de outras tabelas e lidar corretamente com essas referências de forma a garantir a integridade dos dados.
```

### *b)*

```
CREATE PROCEDURE pr_GetDepManagAndLongestService
AS
BEGIN
    DECLARE @currentDate DATE = GETDATE();

    -- Get all managers with their tenure
    SELECT D.Dname, E.Ssn, E.Fname, E.Lname, DATEDIFF(year, D.Mgr_start_date, @currentDate) AS Tenure
    FROM Department D
    JOIN Employee E ON D.Mgr_ssn = E.Ssn
    ORDER BY Tenure DESC;

    -- Get the longest-serving manager separately
    SELECT TOP 1 E.Ssn, D.Dname, DATEDIFF(year, D.Mgr_start_date, @currentDate) AS LongestTenure
    FROM Department D
    JOIN Employee E ON D.Mgr_ssn = E.Ssn
    ORDER BY LongestTenure DESC;
END;

```

### *c)*

```
CREATE TRIGGER tr_CheckManagerDuplicate
ON dbo.Company_Department
AFTER INSERT, UPDATE
AS
BEGIN
    -- Check if the newly assigned manager is already managing another department
    IF EXISTS (
        SELECT 1
        FROM dbo.Company_Department d
        INNER JOIN inserted i ON d.Mgr_ssn = i.Mgr_ssn
        WHERE d.Dnumber <> i.Dnumber
    )
    BEGIN
        RAISERROR ('A manager cannot manage more than one department.', 16, 1);
        ROLLBACK TRANSACTION;
    END;
END;
```

### *d)*

```
CREATE TRIGGER tr_AdjustEmployeeSalary
ON dbo.Company_Employee
AFTER INSERT, UPDATE
AS
BEGIN
    -- Update employee salaries to manager's salary minus one if they exceed it
    UPDATE e
    SET e.Salary = m.Salary - 1
    FROM dbo.Company_Employee e
    INNER JOIN inserted i ON e.Ssn = i.Ssn
    INNER JOIN dbo.Company_Department d ON e.Dno = d.Dnumber
    INNER JOIN dbo.Company_Employee m ON d.Mgr_ssn = m.Ssn
    WHERE e.Salary > m.Salary - 1;
END;
```

### *e)*

```
CREATE FUNCTION employeeProjects
(
    @ssn VARCHAR(9)
)
RETURNS TABLE
AS
RETURN
(
    SELECT p.Pname AS ProjectName, p.Plocation AS ProjectLocation
    FROM dbo.Company_Project p
    INNER JOIN dbo.Company_Works_on w ON p.Pnumber = w.Pno
    WHERE w.Essn = @ssn
);
```

### *f)*

```
CREATE FUNCTION getEmployeesHigherSalary (@dno INT)
RETURNS TABLE AS RETURN
(
    SELECT *
    FROM employee AS E
    WHERE E.Dno = @dno
      AND E.Salary > (SELECT AVG(Salary) FROM employee WHERE Dno = @dno)
);

```

### *g)*

```
CREATE FUNCTION getRecordProjects(@d_id INT)
RETURNS @table TABLE (
	pname  VARCHAR(15),
	pnumber INT,
	plocation VARCHAR(15),
	dnum INT,
	budget FLOAT,
	totalbudget FLOAT
) AS
BEGIN
	DECLARE curs CURSOR FOR
        SELECT Pname, Pnumber, Plocation, Dnum, SUM((Salary/40)*Hours) AS Budget
		FROM (project JOIN works_on ON Pnumber=Pno) JOIN employee ON Essn=Ssn WHERE Dnum=@d_id
		GROUP BY Pnumber, Pname, Plocation, Dnum;

	DECLARE @pname AS VARCHAR(15), @pnumber AS INT, @plocation as VARCHAR(15), @dnum AS INT, @budget AS FLOAT, @totalbudget AS FLOAT;
	SET @totalbudget = 0;
    OPEN curs;
	FETCH curs INTO @pname, @pnumber, @plocation, @dnum, @budget;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @totalbudget += @budget;
		INSERT INTO @table VALUES (@pname, @pnumber, @plocation, @dnum, @budget, @totalbudget);
		FETCH curs INTO @pname, @pnumber, @plocation, @dnum, @budget;
	END

	CLOSE curs;
	DEALLOCATE curs;
	RETURN;
END
```

### *h)*

```
CREATE TRIGGER setDepartmentDeletedIO ON department
INSTEAD OF DELETE
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

-- Create the AFTER DELETE Trigger
CREATE TRIGGER setDepartmentDeletedA ON department
AFTER DELETE
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

-- Vantagens de Triggers AFTER and INSTEAD OF:
-- Pode-se ter vários triggers AFTER por tabela, no entanto só pode haver um trigger INSTEAD OF.
-- O INSTEAD OF não executa da ação associada, enquanto que o AFTER sim já que ocorre depois da ação.
-- O INSTEAD OF pode ser usado para substituir lógicas, o AFTER não substitui.

```

### *i)*

```
As storage procedures e as UDFs têm benefícios semelhantes, pois apenas são precisos ser compilados
uma vez e podem ser reutilizados sem necessidade de recompilação, para além de serem mais rápidos e
fáceis de usar.

No entanto existem diferenças entre as duas:
- As UDFs podem ser usadas em SELECT, WHERE e HAVING, enquanto que as SPs não podem.
- As SPs podem ser usadas para chamar outras SPs, enquanto que as UDFs não podem.
- As SPs podem ser usadas para exceções, enquanto que as UDFs não podem.
- As SPs têm parametros de entrada e saída, enquanto que as UDFs só têm parametros de entrada.
- As SPs podem ser usadas para transações, enquanto que as UDFs não podem.
- As UDF só devolvem valores escalares ou tabelas, enquanto que as SPs devolvem valores escalares, tabelas ou não devolvem nada.
```
