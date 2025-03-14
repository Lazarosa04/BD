CREATE database Stock
use Stock
GO

--Tipo Fornecedor
create table Tipo_Fornecedor(
	Codigo			char(9)		PRIMARY KEY,
	Designacao		varchar(30)	not null,
)

--Fornecedor
create table Fornecedor(
	NIF			char(9)		PRIMARY KEY,
	Nome		varchar(30),
	Endereço	varchar(30),
	Fax			char(9)	not null,
	Codigo		char(9)	references Tipo_Fornecedor(Codigo),
)

--Produto
create table Produto(
	Codigo_produto	char(9)	PRIMARY KEY,
	Nome			varchar(30),
	Preço			int not null,
	Iva				int not null,
	Unidades		int,
)

--Encomenda
create table Encomenda(
	N_encomenda		int		PRIMARY KEY,
	Data_encomenda	date,
	Codigo_produto	char(9)	references Produto(Codigo_produto),
	NIF_Fornecedor	char(9)	references Fornecedor(NIF)
)

--Armazem
create table Armazem(
	Nome			varchar(30)	PRIMARY KEY,
	Codigo_produto	char(9)	references Produto(Codigo_produto),
)
