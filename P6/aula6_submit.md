# BD: Guião 6

## Problema 6.1

### *a)* Todos os tuplos da tabela autores (authors);

```
select * from authors;
```

### *b)* O primeiro nome, o último nome e o telefone dos autores;

```
select au_fname, au_lname, phone from authors;
```

### *c)* Consulta definida em b) mas ordenada pelo primeiro nome (ascendente) e depois o último nome (ascendente); 

```
select au_fname, au_lname, phone from authors order by au_fname, au_lname;
```

### *d)* Consulta definida em c) mas renomeando os atributos para (first_name, last_name, telephone); 

```
select au_fname as first_name, au_lname as last_name, phone as telephone from authors order by au_fname, au_lname;
```

### *e)* Consulta definida em d) mas só os autores da Califórnia (CA) cujo último nome é diferente de ‘Ringer’; 

```
select au_fname as first_name, au_lname as last_name, phone as telephone from authors where au_lname!='Ringer' and state='CA' order by au_fname, au_lname;
```

### *f)* Todas as editoras (publishers) que tenham ‘Bo’ em qualquer parte do nome; 

```
SELECT pub_name
FROM publishers
WHERE pub_name LIKE '%Bo%';
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
select distinct pub_name from publishers inner join  titles on publishers.pub_id = titles.pub_id where type='Business';
```

### *h)* Número total de vendas de cada editora; 

```
select t.pub_id,SUM(s.qty) as sales from sales as s join titles as t on s.title_id=t.title_id group by pub_id
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
select t.pub_id,t.title,SUM(s.qty) as sales from sales as s join titles as t on s.title_id=t.title_id group by pub_id,title
```

### *j)* Nome dos títulos vendidos pela loja ‘Bookbeat’; 

```
select title from stores join sales on stores.stor_id=sales.stor_id join titles on sales.title_id=titles.title_id where stor_name='Bookbeat'
```

### *k)* Nome de autores que tenham publicações de tipos diferentes; 

```
select au_fname, au_lname from authors as a join titleauthor as ta on a.au_id = ta.au_id join titles as t on ta.title_id = t.title_id 
group by au_fname, au_lname having count(distinct type)>1
```

### *l)* Para os títulos, obter o preço médio e o número total de vendas agrupado por tipo (type) e editora (pub_id);

```
select t.pub_id,t.type,AVG(t.price) as avg_price,SUM(s.qty) as sales from sales as s join titles as t on s.title_id=t.title_id group by pub_id, type
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
SELECT DISTINCT t.type
FROM titles t
WHERE t.advance > 1.5 * (SELECT AVG(t2.advance) FROM titles t2 WHERE t2.type = t.type);
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
select au_fname, au_lname, title, price*royalty*royaltyper/100/100 as gainPerSale from titles as t inner join titleauthor as ta on t.title_id = ta.title_id inner join authors as a on a.au_id = ta.au_id order by title;

```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
SELECT t.ytd_sales, t.title, 
       SUM(s.qty * t.price) AS faturacao_total, 
       SUM(s.qty * t.price * ta.royaltyper / 100) AS faturacao_autores, 
       SUM(s.qty * t.price * (1 - ta.royaltyper / 100)) AS faturacao_editora
FROM titles t
JOIN sales s ON t.title_id = s.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
GROUP BY t.ytd_sales, t.title;
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
SELECT t.ytd_sales, t.title, a.au_fname, a.au_lname, 
       SUM(s.qty * t.price * ta.royaltyper / 100) AS faturacao_autor, 
       SUM(s.qty * t.price * (1 - ta.royaltyper / 100)) AS faturacao_editora
FROM titles t
JOIN sales s ON t.title_id = s.title_id
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
GROUP BY t.ytd_sales, t.title, a.au_fname, a.au_lname;
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
SELECT s.stor_name
FROM stores s
JOIN sales sa ON s.stor_id = sa.stor_id
GROUP BY s.stor_name
HAVING COUNT(DISTINCT sa.title_id) = (SELECT COUNT(*) FROM titles);
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
SELECT s.stor_name
FROM stores s
JOIN sales sa ON s.stor_id = sa.stor_id
GROUP BY s.stor_name
HAVING SUM(sa.qty) > (SELECT AVG(total_vendas) FROM 
                      (SELECT SUM(sa2.qty) AS total_vendas 
                       FROM sales sa2 
                       GROUP BY sa2.stor_id) subquery);
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
SELECT t.title
FROM titles t
WHERE t.title_id NOT IN 
      (SELECT s.title_id 
       FROM sales s 
       JOIN stores st ON s.stor_id = st.stor_id 
       WHERE st.stor_name = 'Bookbeat');
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
SELECT p.pub_name, s.stor_name
FROM publishers p
CROSS JOIN stores s
WHERE NOT EXISTS (
    SELECT 1 
    FROM titles t
    JOIN sales sa ON t.title_id = sa.title_id
    WHERE t.pub_id = p.pub_id AND sa.stor_id = s.stor_id);
```

## Problema 6.2

### ​5.1

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_1_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_1_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT (Fname + ' ' + Minit + '.' + ' ' + Lname) AS full_name, ssn, Pname
FROM EMPRESA.Employee
JOIN EMPRESA.Works_On
ON Ssn=Essn
JOIN EMPRESA.Project
ON Pno=Pnumber;
```

##### *b)* 

```
SELECT (Fname + ' ' + Minit + '.' + ' ' + Lname) AS full_name FROM EMPRESA.Employee WHERE Super_ssn =(
SELECT Ssn
FROM EMPRESA.Employee
WHERE Fname='Carlos' AND Minit='D' AND Lname='Gomes');
```

##### *c)* 

```
SELECT Pname, SUM(Hours) AS total_hours
FROM EMPRESA.Employee
JOIN EMPRESA.Works_ON
ON Ssn=Essn
JOIN EMPRESA.Project
ON Pno=Pnumber
GROUP BY Pname;
```

##### *d)* 

```
SELECT (Fname + ' ' + Minit + '.' + ' ' + Lname) AS full_name
FROM EMPRESA.Employee
JOIN EMPRESA.Works_On
ON Ssn=Essn
JOIN EMPRESA.Project
ON Pno=Pnumber
WHERE Dno=3 AND Pname='Aveiro Digital' AND Hours > 20;
```

##### *e)* 

```
SELECT (Fname + ' ' + Minit + '.' + ' ' + Lname) AS full_name
FROM EMPRESA.Employee
FULL OUTER JOIN EMPRESA.Works_On
ON Ssn=Essn
WHERE Hours IS NULL;
```

##### *f)* 

```
SELECT Dname, AVG(Salary)
FROM
(SELECT *
FROM EMPRESA.Department
JOIN EMPRESA.Employee
ON Dnumber=DNo
WHERE Sex='F') AS A
GROUP BY Dname;
```

##### *g)* 

```
SELECT Essn
FROM EMPRESA.Dependents
JOIN EMPRESA.Employee
ON Essn=Ssn
GROUP BY Essn
HAVING COUNT(Essn) > 2;
```

##### *h)* 

```
SELECT Mgr_ssn FROM 
(SELECT *
FROM EMPRESA.Dependents
FULL OUTER JOIN EMPRESA.Department
ON Essn=Mgr_ssn) AS E
WHERE E.Essn IS NULL;
```

##### *i)* 

```
SELECT DISTINCT (Fname + ' ' + Minit + '.' + ' ' + Lname) AS full_name, Address
FROM EMPRESA.Employee
JOIN EMPRESA.Works_On
ON Ssn=Essn
JOIN EMPRESA.Project
ON Pno=Pnumber
JOIN EMPRESA.Dept_Locations
ON Dno=Dnumber
WHERE Plocation='Aveiro' AND Dlocation!='Aveiro';
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
SELECT f.nif, f.nome
FROM fornecedor f
LEFT JOIN encomenda e ON f.nif = e.fornecedor
WHERE e.numero IS NULL;
```

##### *b)* 

```
use GestaoStock
SELECT p.nome, pa.avg_unidades
FROM produto p
JOIN (
    SELECT codProd, AVG(unidades) AS avg_unidades
    FROM item
    GROUP BY codProd
) pa ON p.codigo = pa.codProd;

```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

### 5.3

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_3_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_3_data.sql "SQLFileQuestion")

#### c) Queries

##### *a)*

```
... Write here your answer ...
```

##### *b)* 

```
... Write here your answer ...
```


##### *c)* 

```
... Write here your answer ...
```


##### *d)* 

```
... Write here your answer ...
```

##### *e)* 

```
... Write here your answer ...
```

##### *f)* 

```
... Write here your answer ...
```
