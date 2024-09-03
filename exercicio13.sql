/*
A prefeitura de Miguelópolis lhe contratou para desenvolver um sistema de controle
de pacientes para o posto de saúde, crie o banco, as tabelas, faça os relacionamentos
necessários, insira nas tabelas alguns registros, realize algumas consultas para verificar
a integridade das informações. O sistema deve permitir o registro de médicos,
pacientes e consultas realizadas. Faça algumas consultas utilizando como base os
códigos disponíveis no arquivo txt.
*/
-- Criando o banco de dados
CREATE DATABASE PostoSaude;

-- Usando o banco de dados
USE PostoSaude;

-- Criando a tabela de Médicos
CREATE TABLE Medicos (
    id_medico INT IDENTITY(1,1) PRIMARY KEY,
    nome_medico VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50) NOT NULL,
    crm VARCHAR(20) NOT NULL
);


-- Criando a tabela de Pacientes
CREATE TABLE Pacientes (
    id_paciente INT IDENTITY(1,1) PRIMARY KEY,
    nome_paciente VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200)
);

-- Criando a tabela de Consultas
CREATE TABLE Consultas (
    id_consulta INT IDENTITY(1,1) PRIMARY KEY,
    id_medico_con INT NOT NULL,
    id_paciente_con INT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao TEXT,
    FOREIGN KEY (id_medico_con) REFERENCES Medicos(id_medico),
    FOREIGN KEY (id_paciente_con) REFERENCES Pacientes(id_paciente)
 );

SELECT * FROM Consultas

-- Inserindo registros na tabela de Médicos
INSERT INTO Medicos (nome_medico, especialidade, crm)
VALUES 
    ('Dr. João Silva', 'Cardiologista', '123456'),
    ('Dra. Maria Santos', 'Dermatologista', '654321'),
    ('Dr. Carlos Mendes', 'Pediatra', '112233');

	SELECT * FROM Medicos

	DROP TABLE Medicos

-- Inserindo registros na tabela de Pacientes
INSERT INTO Pacientes (nome_paciente, cpf, data_nascimento, endereco)
VALUES 
    ('Ana Oliveira', '12345678901', '1985-04-10', 'Rua A, 123'),
    ('Pedro Costa', '98765432100', '1990-11-05', 'Avenida B, 456'),
    ('Maria Souza', '11122233344', '1975-06-18', 'Travessa C, 789');

	SELECT * FROM Pacientes

-- Inserindo registros na tabela de Consultas
INSERT INTO Consultas (id_medico_con, id_paciente_con, data_consulta, descricao)
VALUES 
    (1, 1, '2024-08-15', 'Check-up cardiológico'),
    (2, 2, '2024-08-16', 'Consulta de dermatologia'),
    (3, 3, '2024-08-17', 'Consulta pediátrica para o filho de Maria');


	SELECT * FROM Consultas




select id_medico, nome_medico, especialidade
from Medicos, Consultas
where data_consulta = '2024-08-17';

SELECT COUNT(*) AS "Quantidade de Médicos" FROM medicos;


ALTER TABLE Medicos
ADD salario DECIMAL(10,2);

ALTER TABLE Medicos
ADD data_contratacao date;

select * from Medicos

INSERT INTO Medicos (nome_medico, especialidade, data_contratacao, salario, crm)
VALUES 
('Dr. João Silva', 'Cardiologia', GETDATE(), 12000,123456 ),
('Dra. Maria Oliveira', 'Pediatria', GETDATE(), 9500, 654321),
('Dr. Pedro Santos', 'Ortopedia', GETDATE(), 11000, 112233),
('Dra. Ana Lima', 'Dermatologia', GETDATE(), 10000, 223344);


--somando os salarios com a formatacao monetaria
SELECT FORMAT(SUM(salario), 'C', 'pt-BR') AS "Salário Formatado" 
FROM medicos;

--media salarial
SELECT CONVERT(DECIMAL(10,2), AVG(salario)) AS "Média Salarial" 
FROM medicos;


--Selecionar todos os médicos e suas especialidades:
SELECT nome_medico, especialidade
FROM Medicos;

--Selecionar todos os pacientes que nasceram antes de 1980:
SELECT nome_paciente, data_nascimento
FROM Pacientes
WHERE data_nascimento < '1980-01-01';

--Selecionar todas as consultas realizadas em um determinado mês (por exemplo, agosto de 2024):
SELECT id_consulta, id_medico_con, id_paciente_con, data_consulta, descricao
FROM Consultas
WHERE YEAR(data_consulta) = 2024 AND MONTH(data_consulta) = 8;

--Selecionar o nome do médico e a quantidade de consultas realizadas por ele:
SELECT m.nome_medico, COUNT(c.id_consulta) AS total_consultas
FROM Medicos m
JOIN Consultas c ON m.id_medico = c.id_medico_con
GROUP BY m.nome_medico;

--Selecionar os pacientes e suas respectivas consultas, ordenados pela data da consulta:
SELECT p.nome_paciente, c.data_consulta, c.descricao
FROM Pacientes p
JOIN Consultas c ON p.id_paciente = c.id_paciente_con
ORDER BY c.data_consulta;


--Selecionar médicos cuja especialidade é 'Cardiologia' e que possuem um salário maior que 10.000:
SELECT nome_medico, especialidade, salario
FROM Medicos
WHERE especialidade = 'Cardiologia' AND salario > 10000;