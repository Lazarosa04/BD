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
... Write here your answer ...
```

### *g)* Nome das editoras que têm pelo menos uma publicação do tipo ‘Business’; 

```
select distinct pub_name from publishers inner join  titles on publishers.pub_id = titles.pub_id where type='Business';
```

### *h)* Número total de vendas de cada editora; 

```
... Write here your answer ...
```

### *i)* Número total de vendas de cada editora agrupado por título; 

```
... Write here your answer ...
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
... Write here your answer ...
```

### *m)* Obter o(s) tipo(s) de título(s) para o(s) qual(is) o máximo de dinheiro “à cabeça” (advance) é uma vez e meia superior à média do grupo (tipo);

```
... Write here your answer ...
```

### *n)* Obter, para cada título, nome dos autores e valor arrecadado por estes com a sua venda;

```
select au_fname, au_lname, title, price*royalty*royaltyper/100/100 as gainPerSale from titles as t inner join titleauthor as ta on t.title_id = ta.title_id inner join authors as a on a.au_id = ta.au_id order by title;

```

### *o)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, a faturação total, o valor da faturação relativa aos autores e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *p)* Obter uma lista que incluía o número de vendas de um título (ytd_sales), o seu nome, o nome de cada autor, o valor da faturação de cada autor e o valor da faturação relativa à editora;

```
... Write here your answer ...
```

### *q)* Lista de lojas que venderam pelo menos um exemplar de todos os livros;

```
... Write here your answer ...
```

### *r)* Lista de lojas que venderam mais livros do que a média de todas as lojas;

```
... Write here your answer ...
```

### *s)* Nome dos títulos que nunca foram vendidos na loja “Bookbeat”;

```
... Write here your answer ...
```

### *t)* Para cada editora, a lista de todas as lojas que nunca venderam títulos dessa editora; 

```
... Write here your answer ...
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

##### *g)* 

```
... Write here your answer ...
```

##### *h)* 

```
... Write here your answer ...
```

##### *i)* 

```
... Write here your answer ...
```

### 5.2

#### a) SQL DDL Script
 
[a) SQL DDL File](ex_6_2_2_ddl.sql "SQLFileQuestion")

#### b) Data Insertion Script

[b) SQL Data Insertion File](ex_6_2_2_data.sql "SQLFileQuestion")

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
