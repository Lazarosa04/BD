CREATE DATABASE rentacar

GO

USE rentacar
GO

CREATE SCHEMA RENTACAR

GO

CREATE TABLE RENTACAR.CLIENTE (
	NIF			CHAR(9),
	num_carta	CHAR(9),
	endereco	VARCHAR(30) NOT NULL,
	nome		VARCHAR(30) NOT NULL,
	PRIMARY KEY(NIF),
	UNIQUE (num_carta)
);

CREATE TABLE RENTACAR.BALCAO (
	numero_balcao	INT NOT NULL,
	nome			VARCHAR(30) NOT NULL,
	endereco		VARCHAR(30) NOT NULL,
	PRIMARY KEY(numero_balcao),
	
);

CREATE TABLE RENTACAR.TIPO_VEICULO (
	codigo			INT NOT NULL,
	ar_condicionado	VARCHAR(9),
	designacao		VARCHAR(30) NOT NULL,
	PRIMARY KEY(codigo),
	
);

CREATE TABLE RENTACAR.SIMILARIDADE (
	codigo_v1		INT,
	codigo_v2		INT,
	PRIMARY KEY(codigo_v1, codigo_v2),
	FOREIGN KEY(codigo_v1) REFERENCES RENTACAR.TIPO_VEICULO(codigo),
	FOREIGN KEY(codigo_v2) REFERENCES RENTACAR.TIPO_VEICULO(codigo)
);


CREATE TABLE RENTACAR.LIGEIRO (
	codigo			INT NOT NULL,
	num_lugares		INT NOT NULL,
	portas			INT NOT NULL,
	combustivel		VARCHAR(9),
	PRIMARY KEY(codigo),
	FOREIGN KEY(codigo) REFERENCES RENTACAR.TIPO_VEICULO(codigo),
	
);

CREATE TABLE RENTACAR.PESADO (
	codigo			INT NOT NULL,
	peso			INT NOT NULL,
	passageiros		INT NOT NULL,
	PRIMARY KEY(codigo),
	FOREIGN KEY(codigo) REFERENCES RENTACAR.TIPO_VEICULO(codigo),
	
);


CREATE TABLE RENTACAR.VEICULO (
	matricula		VARCHAR(6),
	marca			VARCHAR(30) NOT NULL,
	ano				INT NOT NULL,
	codigo_veiculo	INT NOT NULL,
	PRIMARY KEY(matricula),
	FOREIGN KEY (codigo_veiculo) REFERENCES RENTACAR.TIPO_VEICULO(codigo)
);


CREATE TABLE RENTACAR.ALUGUER (
	numero_aluguer		INT,
	data				DATE NOT NULL,
	duracao				INT NOT NULL,
	cliente_nif			CHAR(9) NOT NULL,
	numero_balcao		INT NOT NULL,
	matricula_veiculo	VARCHAR(6) NOT NULL,
	PRIMARY KEY(numero_aluguer),
	FOREIGN KEY(cliente_nif) REFERENCES RENTACAR.CLIENTE(NIF),
	FOREIGN KEY(numero_balcao) REFERENCES RENTACAR.BALCAO(numero_balcao),
	FOREIGN KEY(matricula_veiculo) REFERENCES RENTACAR.VEICULO(matricula)
);