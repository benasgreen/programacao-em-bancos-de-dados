/*Crie o banco de dados “confeitariaHelena”, crie duas tabelas, uma para produtos e a
segunda para clientes da confeitaria, acrescente os campos necessários para
armazenar os dados. Insira pelo menos 10 registros nas tabelas, na sequência iremos
realizar algumas consultas utilizando o conteúdo das duas primeiras aulas.*/

CREATE DATABASE ConfeitariaHelena

use ConfeitariaHelena

CREATE TABLE Produtos (
codigo INT IDENTITY (1,1) PRIMARY KEY,
nome VARCHAR(30),
sabor VARCHAR (30),
descricao VARCHAR(100),
ingredientes VARCHAR(100),
data_produto DATE,
data_vencimento DATE,
valor DECIMAL (4,2),
);


CREATE TABLE Clientes (
codigo INT IDENTITY (1,1) PRIMARY KEY,
nome VARCHAR(30),
cpf CHAR(15),
endereco VARCHAR(30),
telefone CHAR(14),
email VARCHAR(30)
);


SELECT * FROM Produtos

SELECT * FROM Clientes

--INSERINDO OS DADOS NA TABELA PRODUTOS
INSERT INTO Produtos
VALUES 
('Bolo','Chocolate','Bolo de Chocolate com Granulado','Ovo,Leite,Farinha,Fermento,Cacau em Pó','2024-07-30','2024-08-03',60.50);


INSERT INTO Produtos
VALUES 
('Bolo','Cenoura com Chocolate','Bolo de Cenoura com Cobertura de Chocolate','Ovo,Leite,Farinha,Fermento,Cenoura,Cacau em Pó','2024-07-30','2024-08-03',29.99);

INSERT INTO Produtos
VALUES 
('Bolo','Morango','Bolo de Morango com Chantily','Ovo,Leite,Farinha,Fermento,Chantily,Morango','2024-07-30','2024-08-03',49.50);


INSERT INTO Produtos
VALUES 
('Bolo','Ninho com Nutella','Bolo de Ninho com Recheio de Nutella','Ovo,Leite,Farinha,Fermento,Cacau em Pó,Nutella,Ninho','2024-07-30','2024-08-03',99.50);

INSERT INTO Produtos
VALUES 
('Bolo','Ninho com Morango','Bolo de Ninho com Recheio de Morango','Ovo,Leite,Farinha,Fermento,Morango,Geleia de Morango,Ninho','2024-07-30','2024-08-03',99.50);

INSERT INTO Produtos
VALUES 
('Bolo','Fubá Cremoso','Bolo de Fubá Cremoso com Erva Doce','Ovo,Leite,Farinha de milho,Fermento,Erva doce','2024-07-30','2024-08-03',35.00);

INSERT INTO Produtos
VALUES 
('Bolo','Prestigio','Bolo de Prestigio','Ovo,Leite,Farinha,Fermento,Cacau em Pó,Chocolate ao Leite, Coco Ralado, Leite de Coco','2024-07-30','2024-08-03',65.50);

INSERT INTO Produtos
VALUES 
('Bolo','Doce de Leite com Ameixa','Bolo de Doce de Leite com Ameixa','Ovo,Leite,Farinha,Fermento,Doce de Leite,Ameixa','2024-07-30','2024-08-03',70.00);

INSERT INTO Produtos
VALUES 
('Bolo','Abacaxi','Bolo Cremoso de Abacaxi','Ovo,Leite,Farinha,Fermento,Abacaxi','2024-07-30','2024-08-03',40.50);

INSERT INTO Produtos
VALUES 
('Bolo','Pão de Mel','Bolo de Pão de Mel com Doce de Leite','Ovo,Leite,Farinha,Fermento,Canela,Doce de Leite, Chocolate ao Leite','2024-07-30','2024-08-03',99.50);



SELECT * FROM Produtos

--INSERINDO OS DADOS DA TABELA CLIENTES

INSERT INTO Clientes
VALUES
('Rafael Silva','123.345.678-90','Rua Taguá,887','(11)987654545','rsilva@gmail.com');


INSERT INTO Clientes
VALUES
('Luan Aparecido','426.851.078-85','Rua Estonia,132','(11)98561234','luanap@bol.com.br');


INSERT INTO Clientes
VALUES
('Maria Clara da Costa','387.852.972-08','Rua Caneleiras,625','(11)988521478','mclaracosta@outlook.com');


INSERT INTO Clientes
VALUES
('Sarah Teixeira','285.897.544-18','Rua Badajos,87','(11)98745849','sarahteixeira@gmail.com');


INSERT INTO Clientes
VALUES
('Marcos Oliveira','385.897.544-18','Rua Capim Santo,817','(11)98745849','marcosol@gmail.com');


INSERT INTO Clientes
VALUES
('Antonio Silva','235.485.854-85','Rua Oratiorio,17','(11)987654545','antsilva@gmail.com');


INSERT INTO Clientes
VALUES
('Luana Rocha','321.525.485-75','Rua Pirai,132','(11)98541434','luanarocha@msn.com');


INSERT INTO Clientes
VALUES
('Clara da Costa','387.852.124-08','Rua ijaras,625','(11)988527412','claracosta@outlook.com');


INSERT INTO Clientes
VALUES
('Valdir Teixeira','285.123.544-18','Rua Holanda,72','(11)91567849','valdireira@gmail.com');

INSERT INTO Clientes
VALUES
('Lucas Moraes','285.897.456-18','Rua Polonia,321','(11)913457849','lucasmoraes@gmail.com');

INSERT INTO Clientes
VALUES
('Sonia Lima','285.748.544-18','Rua Badajos,187','(11)985498949','sonialima@gmail.com');


--FAZENDO ALTERACAO 

ALTER TABLE Produtos
ADD qtd_estoque INT

ALTER TABLE Produtos
ADD inf_nutricional VARCHAR(100)

ALTER TABLE Clientes
ADD idade INT

ALTER TABLE Clientes
ADD frequencia INT

ALTER TABLE Clientes
ADD valor_gasto DECIMAL(6,2)

ALTER TABLE Clientes
ADD forma_pgto VARCHAR(20)


ALTER TABLE Clientes
ADD genero VARCHAR(20)

ALTER TABLE Clientes
ADD sabor_produto VARCHAR(20)


ALTER TABLE Clientes
ADD sabor_produto VARCHAR(30)


SELECT * FROM Produtos

SELECT * FROM Clientes

--CONSULTANDO A TABELA


SELECT * FROM Clientes ORDER BY nome;
SELECT * FROM Clientes ORDER BY nome DESC;
SELECT * FROM Produtos ORDER BY nome;
SELECT * FROM Produtos ORDER BY nome DESC;
SELECT * FROM Produtos ORDER BY sabor;
SELECT * FROM Produtos ORDER BY valor;

--INSERINDO VALOR NA TABELA CLIENTES

UPDATE Clientes 
SET idade = 20 WHERE codigo = 1;
UPDATE Clientes 
SET idade = 32 WHERE codigo = 2;
UPDATE Clientes 
SET idade = 44 WHERE codigo = 3;
UPDATE Clientes 
SET idade = 98 WHERE codigo = 4;
UPDATE Clientes 
SET idade = 13 WHERE codigo = 5;
UPDATE Clientes 
SET idade = 36 WHERE codigo = 6;
UPDATE Clientes 
SET idade = 42 WHERE codigo = 7;
UPDATE Clientes 
SET idade = 26 WHERE codigo = 8;
UPDATE Clientes 
SET idade = 21 WHERE codigo = 9;
UPDATE Clientes 
SET idade = 22 WHERE codigo = 10;
UPDATE Clientes 
SET idade = 29 WHERE codigo = 11;

SELECT * FROM Clientes


--INSERINDO VALOR NA TABELA PRODUTOS

UPDATE Produtos 
SET qtd_estoque = 2 WHERE codigo = 1;
UPDATE Produtos 
SET qtd_estoque = 3 WHERE codigo = 2;
UPDATE Produtos 
SET qtd_estoque = 6 WHERE codigo = 3;
UPDATE Produtos 
SET qtd_estoque = 7 WHERE codigo = 14;

SELECT * FROM Produtos
