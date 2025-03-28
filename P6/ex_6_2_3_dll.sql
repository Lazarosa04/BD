CREATE database Prescricao
use Prescricao
GO

--medico
create table medico(
	numSNS				char(3)		PRIMARY KEY,
	nome			varchar(30)	not null,
	Especialidade	varchar(30),
)

--paciente
create table paciente(
	numUtente	int			PRIMARY KEY,	
	nome		varchar(30),
	dataNasc	date,
	endereco	varchar(30)
)

--farmacia
create table farmacia(
	nome			varchar(30) primary key,
	endereço		varchar(30),
	telefone		char(9),
)



--farmaceutica
create table farmaceutica(
	numReg			char(3)		primary key,
	nome			varchar(30),
	endereço		varchar(50),
)

--farmaco
create table farmaco(
	numRegFarm	char(3) references farmaceutica(numReg),
	nome		varchar(30)		primary key,
	formula		varchar(30),
)

--prescrição
create table prescricao(
	numPresc		int		PRIMARY KEY,
	numUtente		int		references paciente(numUtente),
	numMedico		char(9)	references medico(numSNS),
	farmacia		varchar(30) references farmacia(nome),
	dataProc		date,
)

create table presc_farmaco(
	numPresc int references prescricao(numPresc),
	numRegFarm	char(3)	references farmaceutica(numReg),
	nomeFarmaco	varchar(30) references farmaco(nome),

)
