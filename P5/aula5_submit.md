# BD: Guião 5


## ​Problema 5.1
 
### *a)*

```
π Pname, Pnumber (project) ⨝ Pno=Pnumber (works_on) ⨝ Ssn=Essn π Fname, Lname, Ssn (employee) 
```


### *b)* 

```
π Fname, Minit, Lname, employee.Ssn (employee ⨝ employee.Super_ssn = supSSn.Ssn (ρ supSSn (π Ssn ( σ (Fname='Carlos' ∧ Minit='D' ∧ Lname='Gomes') (employee)))))
```


### *c)* 

```
γ Pname; sum(Hours) -> THours (π Pname, Pnumber (project) ⨝ Pno = Pnumber (works_on))
```


### *d)* 

```
π Fname, Minit, Lname, Ssn (π Fname, Minit, Lname, Ssn (σ Dno=3 (employee)) ⨝ Ssn=works_on.Essn (πPno, Essn (σ Hours>20 (works_on)) ⨝ Pno=Pnumber π Pnumber (σ Pname='Aveiro Digital' (project))))
```


### *e)* 

```
 π Fname, Minit, Lname (σ Essn = null (π Fname, Minit, Lname, Ssn (employee) ⟕ Ssn = Essn (works_on) ))
```


### *f)* 

```
... Write here your answer ...
```


### *g)* 

```
 σ dependent_number>2 (γFname; count(Dependent_name) -> dependent_number (π Fname, Lname, Ssn (employee) ⨝ Ssn = Essn (dependent)))
```


### *h)* 

```
... Write here your answer ...
```


### *i)* 

```
Empregados_com_projeto_em_aveiro =π Fname, Minit, Lname, Address, Ssn (σ project.Plocation = 'Aveiro' (π Fname, Minit, Lname, Address, Ssn (employee) ⨝ Ssn = Essn (works_on) ⨝ Pno = Pnumber (project)))
 
Empregados_e_departamentos = π Fname, Minit, Lname, Address, Ssn, Dno (employee) ⨝ Dno = Dnumber (department)

Departamentos_fora_de_aveiro = σ dept_location.Dlocation != 'Aveiro' (π Dname, Dnumber (department) ⨝ department.Dnumber = dept_location.Dnumber (dept_location))

Empregados_em_departamentos_fora_de_aveiro = π Fname, Minit, Lname, Address, Ssn (π Fname, Minit, Lname, Address, Ssn (Empregados_e_departamentos) ⨝ department.Dnumber = dept_location.Dnumber (Departamentos_fora_de_aveiro))

π Fname, Minit, Lname, Address (Empregados_com_projeto_em_aveiro∩Empregados_em_departamentos_fora_de_aveiro)
```


## ​Problema 5.2

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
```


### *d)* 

```
... Write here your answer ...
```


## ​Problema 5.3

### *a)*

```
... Write here your answer ...
```

### *b)* 

```
... Write here your answer ...
```


### *c)* 

```
... Write here your answer ...
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
