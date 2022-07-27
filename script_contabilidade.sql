--Criação do BD

CREATE DATABASE Contabilidade;

--Criação de esquemas
--tb: tabelas , vw: visoes

CREATE SCHEMA tb;
CREATE SCHEMA vw;

--Criação de tabelas

CREATE TABLE tb.usuario (
	idUser INT PRIMARY KEY,
	nomeUser VARCHAR(100)
);

CREATE TABLE tb.compra (
	idCompra INT PRIMARY KEY,
	tipoCompra VARCHAR (100),
	descCompra VARCHAR (255),
	tipoPagCompra VARCHAR (50),
	valorCompra FLOAT,
	dataCompra DATE,
	idComprador INT
);

CREATE TABLE tb.conta (
	idConta INT PRIMARY KEY,
	tipoConta VARCHAR (100),
	descConta VARCHAR (255),
	valorConta FLOAT,
	dataAtribConta DATE,
	dataVencConta DATE,
	dataPagConta DATE,
	statusConta VARCHAR (10),
	tipoPagConta VARCHAR (50),
	idPagador INT
		
);

CREATE TABLE tb.renda (
	idRenda INT PRIMARY KEY,
	nomeRenda VARCHAR (100),
	descRenda VARCHAR (255),
	valorRenda FLOAT,
	dataRenda DATE,
	idRecebedor INT
	
);

CREATE TABLE tb.divida (
	idDivida INT PRIMARY KEY,
	tipoDivida VARCHAR (100),
	descDivida VARCHAR (255),
	valorDivida FLOAT,
	dataDivida DATE,
	idDevedor INT,
	idCredor INT
	
);

CREATE TABLE tb.tipoPagamento (
	idPag INT,
	nomeTipoPag VARCHAR (50) UNIQUE
);

CREATE TABLE tb.tipoCompra (
	idCompra INT,
	nomeTipoCompra VARCHAR (100) UNIQUE
);	

-- Restrições
ALTER TABLE tb.compra
ADD CONSTRAINT fk_UserCompra FOREIGN KEY (idComprador) REFERENCES tb.usuario (idUser),
ADD CONSTRAINT fk_TipoCompra FOREIGN KEY (tipoCompra) REFERENCES tb.tipoCompra (nomeTipoCompra),
ADD CONSTRAINT fk_TipoPagCompra FOREIGN KEY (tipoPagCompra) REFERENCES tb.tipoPagamento (nomeTipoPag);


ALTER TABLE tb.conta
ADD CONSTRAINT fk_UserPaga FOREIGN KEY (idPagador) REFERENCES tb.usuario (idUser),
ADD CONSTRAINT fk_TipoConta FOREIGN KEY (tipoConta) REFERENCES tb.tipoCompra (nomeTipoCompra),
ADD CONSTRAINT fk_TipoPagConta FOREIGN KEY (tipoPagConta) REFERENCES tb.tipoPagamento (nomeTipoPag),
ADD CONSTRAINT statusConta CHECK((statusConta = 'PENDENTE') OR (statusConta = 'PAGO') OR (statusConta = 'ATRASADO'));

ALTER TABLE tb.renda
ADD CONSTRAINT fk_UserRecebe FOREIGN KEY (idRecebedor) REFERENCES tb.usuario (idUser);

ALTER TABLE tb.divida
ADD CONSTRAINT fk_UserDeve FOREIGN KEY (idDevedor) REFERENCES tb.usuario (idUser),
ADD CONSTRAINT fk_UserCredor FOREIGN KEY (idCredor) REFERENCES tb.usuario (idUser);

--Inserindo os valores padrões de tipo Compra
INSERT INTO tb.tipoCompra VALUES (1, 'Aluguel');
INSERT INTO tb.tipoCompra VALUES (2, 'Condomínio');
INSERT INTO tb.tipoCompra VALUES (3, 'Garantia');
INSERT INTO tb.tipoCompra VALUES (4, 'Mercado');
INSERT INTO tb.tipoCompra VALUES (5, 'Comida');
INSERT INTO tb.tipoCompra VALUES (6, 'Gasolina');
INSERT INTO tb.tipoCompra VALUES (7, 'Transporte');
INSERT INTO tb.tipoCompra VALUES (8, 'Luz');
INSERT INTO tb.tipoCompra VALUES (9, 'Gás');
INSERT INTO tb.tipoCompra VALUES (10, 'Outros');

--Inserindo os valores padrões de tipo Pagamento
INSERT INTO tb.tipoPagamento VALUES (1, 'Dinheiro');
INSERT INTO tb.tipoPagamento VALUES (2, 'Debito');
INSERT INTO tb.tipoPagamento VALUES (3, 'Credito');
