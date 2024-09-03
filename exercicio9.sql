/*
Crie um banco de dados com o nome Autoescola Jurandir, crie as seguintes tabelas,
clientes, frota, funcionários, faça os relacionamentos necessários, insira alguns
registros em cada uma das tabelas, na sequência realize algumas buscas, procurando
por:
Clientes que estão emitindo a CNH letra D.
Selecionar todos os veículos da Autoescola
Selecionar o nome de todos os funcionários que terminem com a letra A.
Realizar algumas atualizações nos registros dos clientes.

*/


--Criando os Bancos de dados e Tabelas

CREATE DATABASE Autoescola_Jurandir;

USE Autoescola_Jurandir;

-- Tabela Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100),
    idade INT,
    cnh_letra CHAR(1)
);

-- Tabela Frota
CREATE TABLE frota (
    id_veiculo INT PRIMARY KEY IDENTITY(1,1),
    modelo VARCHAR(100),
    placa VARCHAR(10)
);

-- Tabela Funcionários
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100),
    cargo VARCHAR(50)
);

--Inserindo os dados

-- Inserir clientes
INSERT INTO clientes (nome, idade, cnh_letra)
VALUES 
('João Silva', 30, 'B'),
('Maria Souza', 40, 'D'),
('Carlos Pereira', 25, 'C'),
('Ana Oliveira', 35, 'D');

-- Inserir frota
INSERT INTO frota (modelo, placa)
VALUES 
('Chevrolet Onix', 'ABC-1234'),
('Fiat Uno', 'DEF-5678'),
('Volkswagen Gol', 'GHI-9012');

-- Inserir funcionários
INSERT INTO funcionarios (nome, cargo)
VALUES 
('Paulo Santos', 'Instrutor'),
('Fernanda Costa', 'Secretária'),
('Rafaela Lima', 'Gerente'),
('Ricardo Martins', 'Instrutor');

-- Realizando Consultas

SELECT * FROM clientes WHERE cnh_letra = 'D';


SELECT * FROM frota;


SELECT nome FROM funcionarios WHERE nome LIKE '%a';


-- Atualizando a idade do cliente João Silva
UPDATE clientes SET idade = 31 WHERE nome = 'João Silva';