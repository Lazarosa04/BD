CREATE database Farmacia
use Farmacia
GO

--medico
create table Medico(
	SNS				char(9)		PRIMARY KEY,
	Nome			varchar(30)	not null,
	Especialidade	varchar(30),
)

--paciente
create table Paciente(
	N_utente	int			PRIMARY KEY,	
	Nome		varchar(30),
	Data_nascimento date,
)

--farmaceutica
create table Farmaceutica(
	N_R_Nacional	int	PRIMARY KEY,
	Nome			varchar(30),
	Endereço		varchar(30),
	Telefone		char(9),
)

--farmaco
create table Farmaco(
	Formula		varchar(30)		PRIMARY KEY,
	Nome_comercial	varchar(30),
	N_R_Nacional	int	references Farmaceutica(N_R_Nacional)
)

--prescrição
create table Prescrição(
	N_prescricao	int		PRIMARY KEY,
	Data_prescricao	date,
	SNS				char(9)	references Medico(SNS),
	N_utente		int		references Paciente(N_utente),
	Formula			varchar(30)	references Farmaco(Formula),
)


--farmácia
create table Farmacia(
	NIF			char(9)		PRIMARY KEY,
	Nome			varchar(30),
	Endereço		varchar(30),
	Telefone		char(9),
	N_prescricao	int references Prescrição(N_prescricao),
	DataProc		date
)
