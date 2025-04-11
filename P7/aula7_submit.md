# BD: Guião 7


## ​7.2 
 
### *a)*

```
A relação está na forma 1FN porque tem Dependências Parciais e Dependências Transitivas.
Dependencias Parciais:
Nome_Autor -> Afiliação_Autor

Dependências Transistivas:
Editor -> Endereço_Editor
Tipo_Livro, NoPaginas -> Preço
```

### *b)* 

```
1º Parte: Colocar na forma 2FN (eliminar dependencias parciais)
-> Autor(<u>Nome_Autor</u>, Afiliação_Autor)
-> Livro(<u>Titulo_Livro</u>, <u>Nome_Autor</u>, Tipo_Livro, Preco, NoPaginas,Editor, Endereco_Editor, Ano_Publicacao)

2º Parte: Colocar na forma 3FN (eliminar dependencias transitivas)
-> Editor(<u>Editor</u>, Endereço_Editor)
-> TipoLivro(<u>Tipo_Livro, <u>NoPAginas</u>, Preco)
-> Livro(<u>Titulo_Livro</u>, <u>Nome_Autor</u> ,Editor, Tipo_Livro, NoPaginas, Ano_Publicaçao)
```




## ​7.3
 
### *a)*

```
Chave de R: {A,B}
```


### *b)* 

``` 
-R1(<u>A</u>, <u>B</u>, C)
-R2(<u>A</u> , D, E, I, J)
-R3(<u>B</u> , F, G, H)
```

### *c)* 

```
-R1(<u>A</u>, <u>B</u>,C)
-R2(<u>A</u>, D, E)
-R3(<u>B</u>, F)
-R4(<u>F</u>, G, H)
-R5(<u>D</u>, I, J)
```


## ​7.4
 
### *a)*

```
Chave de R: {B, C}
```


### *b)* 

```
3FN:
    -R1 = (<u>A</u>, <u>B</u>, C, D, E) 
    -R2 = (<u>D</u>, E)
```


### *c)* 

```
BCNF:
    -R1 = (<u>C</u>, <u>B</u>, D)
    -R2 = (<u>C</u>, A)
    -R3 = (<u>D</u>, E)
```



## ​7.5
 
### *a)*

```
Chave de R: {A,B}
```

### *b)* 

```
-R1(<u>A</u>, <u>B</u>, D, E)
-R2(<u>A</u>, C)
```


### *c)* 

```
-R1(<u>A</u>, B, E)
-R2(<u>A</u>, C)
-R3(<u>C</u>, D)
```

### *d)* 

```
-R1(<u>A</u>, B, E)
-R2(<u>A</u>, C)
-R3(<u>C</u>, D)
```
