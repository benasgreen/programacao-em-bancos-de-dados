/*
Criar um banco para receber as informações do aplicativo de controle de gastos de
viagem, de acordo as instruções na aula.
*/

CREATE DATABASE AppViagem;

USE AppViagem:

CREATE TABLE CONSUMO_COMB (
COD_COMB INT IDENTITY (1,1) PRIMARY KEY,
TIPO_COMB VARCHAR(30),
CONSUMO_COMB DECIMAL (10,2),
DISTANCIA DECIMAL (10,2),
PRECO DECIMAL(10,2)
);

CREATE TABLE GASTOS (
COD_GASTO INT IDENTITY (1,1) PRIMARY KEY,
PEDAGIO DECIMAL(10,2),
ESTACIONAMENTO DECIMAL(10,2),
ALIMENTACAO DECIMAL(15,2),
EMERGENCIA DECIMAL (10,2)
);

CREATE TABLE MOTORISTA (
COD_MOT INT IDENTITY (1,1) PRIMARY KEY,
NOME_MOT VARCHAR(74),
CAT_CNH VARCHAR(10)
);


CREATE TABLE VIAGEM(
COD_VIAGEM INT IDENTITY (1,1) PRIMARY KEY,
DESTINO VARCHAR(50),
PARTIDA VARCHAR(50),
CHEGADA VARCHAR(50),
TEMPO TIME,
VELOCIDADE DECIMAL,
V_COD_COMB INT,
V_COD_GASTO INT,
V_COD_MOT INT
);


--inserindo alguns dados na tabela Consumo
INSERT INTO CONSUMO_COMB (TIPO_COMB, CONSUMO_COMB, DISTANCIA, PRECO)
VALUES 
    ('Gasolina', 15.5, 250.75, 5.89),
    ('Diesel', 10.2, 300.40, 4.79),
    ('Etanol', 8.7, 150.30, 4.39);


--inserindo alguns dados na tabela gastos

INSERT INTO GASTOS (PEDAGIO, ESTACIONAMENTO, ALIMENTACAO, EMERGENCIA)
VALUES 
    (50.00, 25.00, 100.00, 30.00),
    (35.00, 20.00, 85.00, 10.00),
    (40.00, 15.00, 120.00, 25.00);


--inserindo alguns dados na tabela motorista
INSERT INTO MOTORISTA (NOME_MOT, CAT_CNH)
VALUES 
    ('Carlos Andrade', 'B'),
    ('Fernanda Souza', 'C'),
    ('Ricardo Lima', 'D');


--inserindo dados na tabela viagem
INSERT INTO VIAGEM (DESTINO, PARTIDA, CHEGADA, TEMPO, VELOCIDADE, V_COD_COMB, V_COD_GASTO, V_COD_MOT)
VALUES 
    ('São Paulo', 'Rio de Janeiro', 'Campinas', '05:30:00', 90, 1, 1, 1),
    ('Salvador', 'Recife', 'Fortaleza', '08:45:00', 80, 2, 2, 2),
    ('Curitiba', 'Florianópolis', 'Porto Alegre', '04:15:00', 95, 3, 3, 3);


--Fazendo algumas consultas
--verificando o consulmo de combustivel em cada viagem
SELECT V.COD_VIAGEM, V.DESTINO, C.TIPO_COMB, C.CONSUMO_COMB, C.PRECO
FROM VIAGEM V
JOIN CONSUMO_COMB C ON V.V_COD_COMB = C.COD_COMB;


--consultando o gasto de cada viagem
SELECT V.COD_VIAGEM, V.DESTINO, G.PEDAGIO + G.ESTACIONAMENTO + G.ALIMENTACAO + G.EMERGENCIA AS TOTAL_GASTOS
FROM VIAGEM V
JOIN GASTOS G ON V.V_COD_GASTO = G.COD_GASTO;


--consulta para listar as viagens ordenadas por destino
SELECT DESTINO, PARTIDA, CHEGADA, TEMPO, VELOCIDADE
FROM VIAGEM
ORDER BY DESTINO ASC;


--consultando as viagens por motorista e calculando a media de velocidade
SELECT M.NOME_MOT, AVG(V.VELOCIDADE) AS MEDIA_VELOCIDADE
FROM VIAGEM V
JOIN MOTORISTA M ON V.V_COD_MOT = M.COD_MOT
GROUP BY M.NOME_MOT;


-- criando uma view para listar os detalhes da viagens
CREATE VIEW vw_viagens_detalhes AS
SELECT V.COD_VIAGEM, V.DESTINO, V.PARTIDA, V.CHEGADA, V.TEMPO, M.NOME_MOT, C.TIPO_COMB, G.PEDAGIO + G.ESTACIONAMENTO + G.ALIMENTACAO + G.EMERGENCIA AS TOTAL_GASTOS
FROM VIAGEM V
JOIN MOTORISTA M ON V.V_COD_MOT = M.COD_MOT
JOIN CONSUMO_COMB C ON V.V_COD_COMB = C.COD_COMB
JOIN GASTOS G ON V.V_COD_GASTO = G.COD_GASTO;


--consultando a view
SELECT * FROM vw_viagens_detalhes;
