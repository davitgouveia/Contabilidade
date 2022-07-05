--Criação do BD

CREATE DATABASE Contabilidade;

--Criação de esquemas
--tb: tabelas , vw: visoes

CREATE SCHEMA tb, vw;

--Criação de tabelas

CREATE TABLE tb.usuario (
	idUser INT,
	nomeUser VARCHAR(100)
);

CREATE TABLE tb.renda (
	idRenda INT,
	nomeRenda VARCHAR (100),
	descRenda VARCHAR (255),
	valorRenda FLOAT,
	dataRenda DATE,
	idRecebedor INT
);

CREATE TABLE tb.compra (
	idCompra INT,
	nomeCompra VARCHAR (100),
	descCompra VARCHAR (255),
	tipoPagCompra INT,
	valorCompra FLOAT,
	dataCompra DATE,
	idComprador INT
);

CREATE TABLE tb.conta (
	idConta INT,
	nomeConta VARCHAR (100),
	descConta VARCHAR (255),
	valorConta FLOAT,
	dataAtribConta DATE,
	dataVencConta DATE,
	dataPagConta DATE,
	statusConta VARCHAR 10
	idPagador INT
	
	constraint statusConta check((statusConta = 'PENDENTE') or (statusConta = 'PAGO') or (statusConta = 'ATRASADO'))
	
);
	