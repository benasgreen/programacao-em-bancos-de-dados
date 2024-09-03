/*
Crie um banco de dados para a empresa XPTO com as tabelas Departamento e
Funcionários, faça o relacionamento entre as tabelas, insira registros e faça consultas,
realize algumas alterações nos dados dos funcionários.

*/



--CRIANDO UM BANCO DE DADOS
CREATE DATABASE XPTO

-- CRIANDO A TABELA DEPARTAMENTO
CREATE TABLE Departamento (
    COD_DEPARTAMENTO INT IDENTITY(1,1) PRIMARY KEY,
    NOME_DEPARTAMENTO VARCHAR(100) NOT NULL
);

SELECT * FROM Departamento

-- CRIANDO A TABELA FUNCIONARIOS
CREATE TABLE Funcionarios (
    COD_FUNCIONARIO INT IDENTITY(1,1) PRIMARY KEY,
    NOME_FUNCIONARIO VARCHAR(100) NOT NULL,
    EMAIL_FUNCIONARIO VARCHAR(100),
    ENDERECO_FUNCIONARIO VARCHAR(100),
    IDADE_FUNCIONARIO INT,
    COD_DEPARTAMENTO INT,
    FOREIGN KEY (COD_DEPARTAMENTO) REFERENCES Departamento(COD_DEPARTAMENTO)
);

SELECT * FROM Funcionarios

-- Inserindo registros na tabela Departamento
INSERT INTO Departamento (NOME_DEPARTAMENTO)
VALUES 
('Recursos Humanos'),
('Financeiro'),
('TI'),
('Marketing'),
('Vendas');

SELECT * FROM Departamento


-- Inserindo registros na tabela Funcionarios
INSERT INTO Funcionarios (NOME_FUNCIONARIO, EMAIL_FUNCIONARIO, ENDERECO_FUNCIONARIO, IDADE_FUNCIONARIO, COD_DEPARTAMENTO)
VALUES
('João Silva', 'joao.silva@xpto.com', 'Rua das Flores, 123', 30, 1),
('Maria Oliveira', 'maria.oliveira@xpto.com', 'Avenida Paulista, 456', 25, 2),
('Pedro Santos', 'pedro.santos@xpto.com', 'Rua Augusta, 789', 28, 3),
('Ana Souza', 'ana.souza@xpto.com', 'Rua Haddock Lobo, 101', 32, 4),
('Lucas Pereira', 'lucas.pereira@xpto.com', 'Rua Frei Caneca, 202', 27, 5),
('Larissa Lima', 'larissa.lima@xpto.com', 'Rua da Consolação, 303', 29, 1),
('Carlos Ferreira', 'carlos.ferreira@xpto.com', 'Avenida Brigadeiro, 404', 31, 2),
('Beatriz Rocha', 'beatriz.rocha@xpto.com', 'Rua Oscar Freire, 505', 26, 3),
('Rafael Almeida', 'rafael.almeida@xpto.com', 'Rua Bela Cintra, 606', 33, 4),
('Julia Nogueira', 'julia.nogueira@xpto.com', 'Avenida Rebouças, 707', 24, 5);


--FAZENDO ALGUMAS CONSULTAS

--LISTANDO TODOS OS FUNCIONARIOS
SELECT * FROM Funcionarios;
--LISTANDO TODOS OS DEPARTAMENTOS
SELECT * FROM Departamento;


--LISTANDO FUNCIONARIOS DA 'T.I.'
SELECT 
    NOME_FUNCIONARIO, 
    EMAIL_FUNCIONARIO 
FROM 
    Funcionarios 
WHERE 
    COD_DEPARTAMENTO = (SELECT COD_DEPARTAMENTO FROM Departamento WHERE NOME_DEPARTAMENTO = 'TI');

--ATUALIZANDO DADO DE CADASTRO DE FUNCIONARIO
UPDATE Funcionarios
SET ENDERECO_FUNCIONARIO = 'Rua Nova, 123'
WHERE NOME_FUNCIONARIO = 'João Silva';

--ATUALIZANDO O DEPARTAMENTO DE UM FUNCIONARIO
UPDATE Funcionarios
SET COD_DEPARTAMENTO = (SELECT COD_DEPARTAMENTO FROM Departamento WHERE NOME_DEPARTAMENTO = 'Vendas')
WHERE NOME_FUNCIONARIO = 'Maria Oliveira';

--ALTERANDO A IDADE DE UM FUNCIONARIO
UPDATE Funcionarios
SET IDADE_FUNCIONARIO = 35
WHERE NOME_FUNCIONARIO = 'Pedro Santos';


--CONSULTANDO OS DADOS ATUALIZADOS
-- Verificar as alterações realizadas
SELECT * FROM Funcionarios WHERE NOME_FUNCIONARIO = 'João Silva';
SELECT * FROM Funcionarios WHERE NOME_FUNCIONARIO = 'Maria Oliveira';
SELECT * FROM Funcionarios WHERE NOME_FUNCIONARIO = 'Pedro Santos';