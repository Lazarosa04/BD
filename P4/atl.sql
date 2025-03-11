CREATE database ATL
use ATL
GO
--professor
create table Professor (
	N_Func				char(10)	PRIMARY KEY,
	CC					char(9)		UNIQUE,	
	Nome				varchar(30)	not null,
	Email				varchar(30),
	Telefone			varchar(30),
	Morada				varchar(30),
	Data_Nascimento		date,
);

--turma, tem um professor 
create table Turma (
	ID				int			PRIMARY KEY,
	Designação		varchar(15)	not null	UNIQUE,
	Professor		varchar(30)	not null,	
	N_MAX_alunos	int,
	Classes			int,
	Nfunc_Prof		char(10)	references Professor(N_Func)
);

--Encarregado de educação
create table Encarregado_Ed(
	CC_Enc_ED		char(9)		PRIMARY KEY,
	Nome			varchar(30)	not null,
	Morada			varchar(30),
	Data_Nascimento	date,
	Telefone		varchar(30),
	Relação_aluno	varchar(15),
	Email			varchar(30),
);

--aluno, tem encarregado de educação, pertence a uma turma
create table Aluno(
	CC_aluno		char(9)		PRIMARY KEY,
	Nome			varchar(30)	not null,
	Morada			varchar(30),
	Data_Nascimento	date,
	lista_autorizados	varchar(100)	not null,
	cc_enc_ed		char(9) references Encarregado_Ed(CC_Enc_Ed)
);

--não existem turmas sem alunos nem alunos sem turmas
--um aluno pode mudar de turma(?)
create table Turma_Aluno(
	FK_id		int		references Turma(ID),
	FK_cc		char(9)	references Aluno(CC_aluno)
);
--atividade
create table Atividade(
	Identificador	varchar(30)		PRIMARY KEY,
	Custo			int,
	Designação		varchar(30),
);

--ativdade está disponível para x turmas
--alunos podem não participar da atividade
--associar as atividades a todos os alunos parece excessivo mas ok
create table Atividade_Turma_Aluno(
	FK_id			int		references Turma(ID),
	FK_cc			char(9)	references Aluno(CC_aluno),
	FK_atividade	varchar(30) references Atividade(Identificador)
);