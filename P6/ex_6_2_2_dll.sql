create database GestaoStock
use GestaoStock
go

create table tipo_fornecedor(
	codigo		int			primary key,
	designacao	varchar(30) not null
)

create table fornecedor(
	nif			char(9)		primary key,
	nome		varchar(30)	not null,
	fax			char(9),
	endereco	varchar(30),
	condpag		int,
	tipo		int		references tipo_fornecedor(codigo)
)

create table produto(
	codigo			int	primary key,
	nome			varchar(50),
	preço			float not null,
	iva				int not null,
	unidades		int,
)

create table encomenda(
	numero		int	primary key,
	data		varchar(30),
	fornecedor	char(9) references fornecedor(nif)
)

create table item(
	numEnc		int	references encomenda(numero),
	codProd		int references produto(codigo),
	unidades	int
)
