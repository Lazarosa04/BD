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
γ Dname; avg(Salary) -> Salary (σ Sex='F' (department ⨝ Dnumber = Dno (employee)))
```


### *g)* 

```
 σ dependent_number>2 (γFname; count(Dependent_name) -> dependent_number (π Fname, Lname, Ssn (employee) ⨝ Ssn = Essn (dependent)))
```


### *h)* 

```
π Ssn, Fname, Minit, Lname (σ Essn=null (dependent ⟖ Essn=Ssn ((employee) ⨝ Ssn=Mgr_ssn (department))))
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
π nif, nome (σ encomenda.numero=null (fornecedor ⟕ nif=fornecedor encomenda))
```

### *b)* 

```
π nome, avg_unidades (produto⨝codigo=codProd (ρprod_avg γ codProd;avg(unidades)->avg_unidades item))
```


### *c)* 

```
n_produtos=(γ numEnc;count(codProd) -> n_p item) γ avg(n_p) -> avg_enc (n_produtos)
```


### *d)* 

```
γ fornecedor.nome, produto.nome; sum(item.unidades)->quantidade (π fornecedor.nome, produto.nome,item.unidades (produto ⨝(codigo=codProd) (item ⨝(numEnc=numero) (fornecedor ⨝(nif=fornecedor) encomenda))))
```


## ​Problema 5.3

### *a)*

```
Pacientes_e_prescricao = π nome, numUtente (paciente ) ⟕ paciente.numUtente = prescricao.numUtente (prescricao)

σ prescricao.numPresc = null (Pacientes_e_prescricao)
```

### *b)* 

```
γ medico.especialidade; count(medico.especialidade) -> numEspecialidade (π numMedico, numPresc (prescricao) ⨝ numMedico = numSNS (medico))
```


### *c)* 

```
γ prescricao.farmacia; count(prescricao.farmacia) -> num (σ farmacia ≠ null (π farmacia, numPresc (prescricao)))
```


### *d)* 

```
farmaco_f906 = σ farmaco.numRegFarm = 906 (π nome, numRegFarm (farmaco))
farmaco_presc_f906 = σ presc_farmaco.numRegFarm = 906 (π nomeFarmaco, numRegFarm (presc_farmaco))

farmaco_f906 - farmaco_presc_f906
```

### *e)* 

```
γ farmacia, farmaceutica.nome ; count(numPresc) -> sells (farmaceutica ⨝ numReg=numRegFarm (presc_farmaco ⨝ (σ farmacia≠null prescricao)))
```

### *f)* 

```
pacientes_e_prescricao = π nome, numUtente (paciente ) ⟕ paciente.numUtente = prescricao.numUtente (prescricao)

σ medicos > 1 (γ paciente.nome; count(prescricao.numMedico) -> medicos (pacientes_e_prescricao))

```
