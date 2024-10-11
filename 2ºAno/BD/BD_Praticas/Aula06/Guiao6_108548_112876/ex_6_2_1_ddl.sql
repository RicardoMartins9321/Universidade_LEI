CREATE TABLE company.department (
    Dname VARCHAR(30) NOT NULL,
    Dnumber INT PRIMARY KEY,
    Mgr_ssn CHAR(9),
    Mgr_start_date DATE,
    UNIQUE (Dname),

    FOREIGN KEY (Mgr_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE company.employee (
    Fname VARCHAR(20),
    Minit CHAR(1),
    Lname VARCHAR(30),
    Ssn CHAR(9) PRIMARY KEY,
    Bdate DATE,
    [Address] VARCHAR(50),
    Sex CHAR(1),
    Salary DECIMAL(10, 2),
    Super_ssn CHAR(9),
    Dno INT,

	FOREIGN KEY (Dno) REFERENCES Department (Dnumber),
    FOREIGN KEY (Super_ssn) REFERENCES employee(Ssn)
);

CREATE TABLE company.dependent (
    Essn CHAR(9) NOT NULL,
    Dependent_name VARCHAR(50) NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(40)

    PRIMARY KEY (Essn,Dependent_name),
	FOREIGN KEY (Essn) REFERENCES Employee (Ssn)
);

CREATE TABLE company.dept_location (
    Dnumber INT,
    Dlocation VARCHAR(30),

    PRIMARY KEY (Dnumber,Dlocation),
	FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE company.project (
    Pname VARCHAR(30),
    Pnumber INT PRIMARY KEY,
    Plocation VARCHAR(30),
    Dnum INT,

	FOREIGN KEY (Dnum) REFERENCES Department (Dnumber)
);

CREATE TABLE company.works_on (
    Essn CHAR(9),
    Pno INT,
    Hours DECIMAL(6, 2),

    PRIMARY KEY (Essn, Pno),
	FOREIGN KEY (Pno) REFERENCES Project (Pnumber),
	FOREIGN KEY (Essn) REFERENCES Employee (Ssn)
);

