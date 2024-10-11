# BD: Guião 5


## ​Problema 5.1

### *a)*

```
π Pname, Pnumber (project ⨝ Pnumber = Pno (works_on ⨝ Essn = Ssn employee))

SQL:
SELECT DISTINCT Pname, Pnumber
FROM project
JOIN works_on ON Pnumber = Pno
JOIN employee ON Essn = Ssn;

```


### *b)*

```
π employee.Ssn,Fname,Minit,Lname (employee ⨝ (Super_ssn=Carlos.Ssn) (ρ Carlos (π Ssn (σ Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes' (employee)))))

SQL:
SELECT DISTINCT employee.Ssn, Fname, Minit, Lname
FROM employee
JOIN (
	SELECT Ssn
	FROM employee
	WHERE Fname = 'Carlos' AND Minit = 'D' AND Lname = 'Gomes'
) AS Carlos ON Super_ssn = Carlos.Ssn;
```


### *c)*

```
π Pname, Pnumber, project_hours γ Pname, Pnumber; SUM(Hours)→project_hours (project ⨝ Pnumber = Pno works_on)

SQL:
SELECT DISTINCT Pname, Pnumber, SUM(Hours) AS project_hours
FROM project
JOIN works_on ON Pnumber = Pno
GROUP BY Pname, Pnumber;
```


### *d)*

```
π Ssn, Fname, Minit, Lname σ Dno = 3 ∧ Hours > 20 ∧ Pname = 'Aveiro Digital' (employee ⨝ Ssn = Essn (works_on ⨝ Pno = Pnumber project))

SQL:
SELECT DISTINCT Ssn, Fname, Minit, Lname
FROM employee
JOIN works_on ON Ssn = Essn
JOIN project ON Pno = Pnumber
WHERE Dno = 3 AND Hours > 20 AND Pname = 'Aveiro Digital';
```


### *e)*

```
π Fname,Minit,Lname (σ Pno = NULL (employee ⟕ Ssn = Essn works_on))

SELECT DISTINCT Fname, Minit, Lname
FROM employee
LEFT JOIN works_on ON Ssn = Essn
WHERE Pno IS NULL;
```


### *f)*

```
funcionario_departamento = employee ⨝Dno=Dnumber department
γ Dname;avg(Salary)->salario_medio (σ Sex='F' (funcionario_departamento))

SQL:
SELECT Dname, AVG(Salary) AS salario_medio
FROM (
    SELECT *
    FROM employee
    INNER JOIN department ON Dno = Dnumber
    WHERE Sex = 'F'
) AS funcionario_departamento
GROUP BY Dname;
```


### *g)*

```
funcionarios_dependentes = employee ⨝Ssn=Essn dependent

numero_dependentes = γ Ssn,Fname,Minit,Lname;count(Dependent_name)->dependentes (funcionarios_dependentes)

π Ssn,Fname,Minit,Lname (σ dependentes>2 (numero_dependentes))


SQL:
SELECT Ssn, Fname, Minit, Lname
FROM (
    SELECT Ssn, Fname, Minit, Lname, COUNT(Dependent_name) AS num_dependents
    FROM (
        SELECT Ssn, Fname, Minit, Lname, Dependent_name
        FROM employee
        JOIN dependent ON Ssn = Essn
    ) AS funcionarios_dependentes
    GROUP BY Ssn, Fname, Minit, Lname
) AS numero_dependentes
WHERE num_dependents > 2;

```


### *h)*

```
gestores = (employee ⨝ Ssn = Mgr_ssn department)

π Ssn,Fname,Minit,Lname (σ Essn=null (gestores ⟕ Ssn=Essn dependent))

SQL:
SELECT DISTINCT Ssn, Fname, Minit, Lname
FROM employee
JOIN department ON Ssn = Mgr_ssn
LEFT JOIN dependent ON Ssn = Essn
WHERE Essn IS NULL;
```


### *i)*

```
projeto_funcionario = project ⨝Pno=Pnumber (employee ⨝Ssn=Essn works_on)

local_departamento = π department.Dnumber,Dname,Dlocation (department ⨝department.Dnumber=dept_location.Dnumber dept_location)

π Fname,Minit,Lname,Address (σ dept_location.Dlocation≠'Aveiro' ∧ project.Plocation='Aveiro' (projeto_funcionario ⨝Dno=Dnumber local_departamento))


solução diferente SQL code:
SELECT DISTINCT e.Fname, e.Minit, e.Lname, e.Address
FROM employee AS e
JOIN works_on AS w ON e.Ssn = w.Essn
JOIN project AS p ON w.Pno = p.Pnumber
JOIN department AS d ON e.Dno = d.Dnumber
JOIN dept_location AS dl ON d.Dnumber = dl.Dnumber
WHERE dl.Dlocation != 'Aveiro' AND p.Plocation = 'Aveiro';
```


## ​Problema 5.2

### *a)*

```
π nome σ numero=null (encomenda ⟗ fornecedor=nif fornecedor)
```

### *b)*

```
prod_avg = ρ prod_avg γ codProd; avg(unidades) -> avg_units (item)
π nome,avg_units (produto ⨝ codigo=codProd prod_avg)
```


### *c)*

```
γ; avg(units) -> avg_p (γ numero; COUNT(codProd) -> units (encomenda ⨝ numero=numEnc item))
```


### *d)*

```
γ fornecedor.nome, produto.nome;
SUM(item.unidades) -> unidades (produto ⨝ codigo=codProd (fornecedor ⨝ nif=fornecedor (encomenda ⨝ numero=numEnc item)))
```


## ​Problema 5.3

### *a)*

```
π numUtente,nome (σ numPresc = null (paciente ⟕ prescricao))

SQL:
SELECT DISTINCT p.numUtente, p.nome
FROM paciente p
LEFT JOIN prescricao pr ON p.numUtente = pr.numUtente
WHERE pr.numPresc IS NULL;

```

### *b)*

```
prescricao_medico = medico ⨝ numSNS=numMedico prescricao

γ especialidade;count(especialidade)->numero_prescricoes (prescricao_medico)

SQL:
SELECT especialidade, COUNT(especialidade) AS numero_prescricoes
FROM medico m
JOIN prescricao p ON m.numSNS = p.numMedico
GROUP BY especialidade;
```


### *c)*

```
prescricao_farmacia = farmacia ⨝ nome=farmacia prescricao

γ nome; count(numPresc)->prescricoes_processadas (prescricao_farmacia)

SQL:
SELECT nome, SUM(numPresc) AS prescricoes_processadas
FROM farmacia f
JOIN prescricao p ON f.nome = p.farmacia
GROUP BY nome;
```


### *d)*

```
lista_farmacos_farmacia906 = π nome (σ numRegFarm=906 (farmaco))

farmacos_precritos_farmacia906 = π presc_farmaco.nomeFarmaco (σ numRegFarm=906 (presc_farmaco))

farmacos_nunca_prescritos = lista_farmacos_farmacia906-farmacos_precritos_farmacia906

farmacos_nunca_prescritos

SQL:
SELECT DISTINCT f.nome
FROM farmaco AS f
LEFT JOIN presc_farmaco AS p_f ON f.nome = p_f.nomeFarmaco AND p_f.numRegFarm = 906
WHERE p_f.nomeFarmaco IS NULL AND f.numRegFarm = 906;
```

### *e)*

```
-- Joining farmacia with prescricao on the farmacia name
prescricao_farmacia = farmacia ⨝ nome=farmacia prescricao

-- Joining presc_farmaco with prescricao_farmacia on the numPresc
farmaceutica_farmaco_farmacia = π presc_farmaco.numPresc, numRegFarm, nomeFarmaco, nome (presc_farmaco ⨝ prescricao.numPresc=presc_farmaco.numPresc (prescricao_farmacia))

-- Joining farmaceutica with farmaceutica_farmaco_farmacia on numReg
nomeFarmaceutica_farmaco_farmacia = π presc_farmaco.numPresc, farmaceutica.nome, nomeFarmaco, farmacia.nome (farmaceutica ⨝ numReg=numRegFarm farmaceutica_farmaco_farmacia)

-- Grouping by farmacia and farmaceutica and counting the occurrences of farmaceutica.nome
γ farmacia.nome,farmaceutica.nome; count(farmaceutica.nome)->vendas(nomeFarmaceutica_farmaco_farmacia)

SQL:
-- Joining farmacia with prescricao on the farmacia name
SELECT *
FROM farmacia
JOIN prescricao ON farmacia.nome = prescricao.farmacia;

-- Joining presc_farmaco with prescricao_farmacia on the numPresc
SELECT presc_farmaco.numPresc, numRegFarm, nomeFarmaco, farmacia.nome AS nome_farmacia
FROM presc_farmaco
JOIN prescricao ON prescricao.numPresc = presc_farmaco.numPresc
JOIN farmacia ON numRegFarm = farmacia.numReg;

-- Joining farmaceutica with farmaceutica_farmaco_farmacia on numReg
SELECT presc_farmaco.numPresc, farmaceutica.nome AS nome_farmaceutica, nomeFarmaco, farmacia.nome AS nome_farmacia
FROM farmaceutica
JOIN farmaceutica_farmaco_farmacia ON numReg = numRegFarm;

-- Grouping by farmacia and farmaceutica and counting the occurrences of farmaceutica.nome
SELECT farmacia.nome, farmaceutica.nome, COUNT(farmaceutica.nome) AS vendas
FROM nomeFarmaceutica_farmaco_farmacia
GROUP BY farmacia.nome, farmaceutica.nome;
```

### *f)*

```
pac = γ numUtente;
COUNT(numMedico) -> docs (π numUtente,numMedico prescricao) π paciente.nome (paciente ⨝ (σ docs > 1 pac))
```
