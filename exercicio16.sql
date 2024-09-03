/*
Criar MER e o DER para a empresa Servicos_Temporarios, a empresa deseja manter
um cadastro de vagas, um cadastro para a mão de obra especializada e uma tabela
para registrar os contratos, criar as tabelas necessárias, relacionamentos, incluir
registros nas tabelas, realizar consultas ao banco.
*/

--CRIANDO O BANCO DE DADOS

CREATE DATABASE Servicos_Temporarios;
USE Servicos_Temporarios;


--CRIANDO AS TABELAS

--VAGAS

CREATE TABLE Vagas (
    ID_Vaga INT IDENTITY(1,1) PRIMARY KEY,
    Cargo VARCHAR(50),
    Descricao TEXT,
    Requisitos TEXT
);

SELECT * FROM Vagas

--MAO DE OBRA ESPECIALIZADA

CREATE TABLE Mao_Obra (
    ID_Mao_Obra INT IDENTITY(1,1) PRIMARY KEY,
    Nome VARCHAR(100),
    Especialidade VARCHAR(50),
    Experiencia INT
);


SELECT * FROM Mao_Obra

--CONTRATOS

CREATE TABLE Contratos (
    ID_Contrato INT IDENTITY(1,1) PRIMARY KEY,
    Data_Inicio DATE,
    Data_Fim DATE,
    C_ID_Vaga INT,
    C_ID_Mao_Obra INT,
    FOREIGN KEY (C_ID_Vaga) REFERENCES Vagas(ID_Vaga),
    FOREIGN KEY (C_ID_Mao_Obra) REFERENCES Mao_Obra(ID_Mao_Obra)
);


SELECT * FROM Contratos


--INSERINDO REGISTROS--

--INSERINDO VAGAS

INSERT INTO Vagas (Cargo, Descricao, Requisitos)
VALUES 
('Engenheiro Civil', 'Trabalhar em obras de grande porte', 'Experiência de 5 anos'),
('Programador Java', 'Desenvolvimento de sistemas', 'Experiência de 2 anos com Java');


--MAO DE OBRA ESPECIALIZADA

INSERT INTO Mao_Obra (Nome, Especialidade, Experiencia)
VALUES 
('João Silva', 'Engenharia Civil', 6),
('Maria Oliveira', 'Programação Java', 3);


--CONTRATOS

INSERT INTO Contratos (Data_Inicio, Data_Fim, C_ID_Vaga, C_ID_Mao_Obra)
VALUES 
('2024-08-01', '2024-12-31', 1, 1),
('2024-09-15', '2024-12-15', 2, 2);


--CONSULTAS


SELECT * FROM Vagas;

SELECT * FROM Mao_Obra;

--CONTRATOS COM DETALHES

SELECT C.ID_Contrato, C.Data_Inicio, C.Data_Fim, V.Cargo, M.Nome, M.Especialidade
FROM Contratos C
JOIN Vagas V ON C.C_ID_Vaga = V.ID_Vaga
JOIN Mao_Obra M ON C.C_ID_Mao_Obra = M.ID_Mao_Obra;


--QUANTIDADE DE CONTRATOS POR VAGAS

SELECT V.Cargo, COUNT(*) AS Qtd_Contratos
FROM Contratos C
JOIN Vagas V ON C.C_ID_Vaga = V.ID_Vaga
GROUP BY V.Cargo
ORDER BY Qtd_Contratos DESC;


--CONTRATO POR ESPECIALISTA

SELECT M.Nome, COUNT(*) AS Qtd_Contratos
FROM Contratos C
JOIN Mao_Obra M ON C.C_ID_Mao_Obra = M.ID_Mao_Obra
GROUP BY M.Nome
ORDER BY Qtd_Contratos DESC;



--CRIANDO UMA VIEW

CREATE VIEW ContratosDetalhados AS
SELECT 
    C.ID_Contrato, 
    C.Data_Inicio, 
    C.Data_Fim, 
    V.Cargo, 
    V.Descricao, 
    M.Nome AS Especialista, 
    M.Especialidade
FROM 
    Contratos C
JOIN 
    Vagas V ON C.C_ID_Vaga = V.ID_Vaga
JOIN 
    Mao_Obra M ON C.C_ID_Mao_Obra = M.ID_Mao_Obra;


--CONSULTANDO A VIEW

SELECT * FROM ContratosDetalhados;
