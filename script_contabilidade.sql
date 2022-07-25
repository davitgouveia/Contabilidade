--Criação do BD

CREATE DATABASE Contabilidade;

--Criação de esquemas
--tb: tabelas , vw: visoes

CREATE SCHEMA tb, vw;

--Criação de tabelas

CREATE TABLE tb.usuario (
	idUser INT PRIMARY KEY AUTOINCREMENT,
	nomeUser VARCHAR(100)
);

CREATE TABLE tb.compra (
	idCompra INT PRIMARY KEY AUTOINCREMENT,
	tipoCompra VARCHAR (100),
	descCompra VARCHAR (255),
	tipoPagCompra INT,
	valorCompra FLOAT,
	dataCompra DATE,
	idComprador INT
	CONSTRAINT fk_UserCompra FOREIGN KEY (idComprador) REFERENCES tb.usuario (idUser)
	CONSTRAINT fk_TipoCompra FOREIGN KEY (tipoCompra) REFERENCES tb.tipoPagamento (nomeTipoCompra)
	CONSTRAINT fk_TipoPagCompra FOREIGN KEY (tipoPagCompra) REFERENCES tb.tipoPagamento (nomeTipoPag)
);

CREATE TABLE tb.conta (
	idConta INT PRIMARY KEY AUTOINCREMENT,
	tipoConta VARCHAR (100),
	descConta VARCHAR (255),
	valorConta FLOAT,
	dataAtribConta DATE,
	dataVencConta DATE,
	dataPagConta DATE,
	statusConta VARCHAR (10)
	tipoPagCompra VARCHAR (50)
	idPagador INT
	CONSTRAINT fk_UserPaga FOREIGN KEY (idPagador) REFERENCES tb.usuario (idUser)
	CONSTRAINT fk_TipoPagConta FOREIGN KEY (tipoPagConta) REFERENCES tb.tipoPagamento (nomeTipoPag)
	constraint statusConta check((statusConta = 'PENDENTE') or (statusConta = 'PAGO') or (statusConta = 'ATRASADO'))
	
);

CREATE TABLE tb.renda (
	idRenda INT PRIMARY KEY AUTOINCREMENT,
	nomeRenda VARCHAR (100),
	descRenda VARCHAR (255),
	valorRenda FLOAT,
	dataRenda DATE,
	idRecebedor INT
	CONSTRAINT fk_UserRecebe FOREIGN KEY (idRecebedor) REFERENCES tb.usuario (idUser)
);

CREATE TABLE tb.tipoPagamento (
	idPag INT
	nomeTipoPag VARCHAR (50)
);

CREATE TABLE tb.tipoCompra (
	idCompra INT
	nomeTipoCompra VARCHAR (100)
);	
