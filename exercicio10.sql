/*
Crie um banco de dados para a escola primária Estrelinhas, crie a tabela alunos com os
seguintes campos, ID, nome, idade, nome_responsavel, celular_responsavel,
email_responsavel, data_inicio_escola, hora_registro, valor_mensalidade.
Cadastre alguns alunos
Selecione todos os alunos com idade menor ou igual a 7 anos
Selecione todos os alunos maiores que 10 anos
Selecione o nome do aluno, idade e nome do responsável
Selecione o nome do aluno, data de início e hora do registro
Selecione todos os alunos em ordem de idade
Selecione o celular e nome dos pais em ordem alfabética
Atualize o celular e e-mail de um responsável
Atualize o valor da mensalidade de dois alunos
*/

-- Criando o banco de dados e tabelas


CREATE DATABASE Escola_Estrelinhas;

USE Escola_Estrelinhas;

-- Tabela Alunos
CREATE TABLE alunos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(100),
    idade INT,
    nome_responsavel VARCHAR(100),
    celular_responsavel VARCHAR(15),
    email_responsavel VARCHAR(100),
    data_inicio_escola DATE,
    hora_registro TIME,
    valor_mensalidade DECIMAL(10, 2)
);


--Inserindo dados dos alunos
INSERT INTO alunos (nome, idade, nome_responsavel, celular_responsavel, email_responsavel, data_inicio_escola, hora_registro, valor_mensalidade)
VALUES 
('Lucas Silva', 7, 'João Silva', '99999-1234', 'joao.silva@outlook.com', '2022-03-01', '08:00:00', 800.00),
('Mariana Oliveira', 5, 'Ana Oliveira', '98888-5678', 'ana.oliveira@gmail.com', '2023-01-15', '09:15:00', 850.00),
('Pedro Santos', 12, 'Carlos Santos', '97777-7890', 'carlos.santos@gmail.com', '2021-08-10', '10:30:00', 750.00),
('Fernanda Costa', 11, 'Renata Costa', '96666-4321', 'renata.costa@outlook.com', '2022-02-20', '11:45:00', 780.00),
('João Martins', 6, 'Marcos Martins', '95555-9876', 'marcos.martins@outlook.com', '2023-06-01', '08:30:00', 790.00);

-- Realizando consultas

SELECT * FROM alunos WHERE idade <= 7;
SELECT * FROM alunos WHERE idade > 10;
SELECT nome, idade, nome_responsavel FROM alunos;
SELECT nome, data_inicio_escola, hora_registro FROM alunos;
SELECT * FROM alunos ORDER BY idade;
SELECT nome_responsavel, celular_responsavel FROM alunos ORDER BY nome_responsavel;


-- atualizando registros

UPDATE alunos 
SET celular_responsavel = '94444-1234', email_responsavel = 'joao.silva_novo@email.com'
WHERE nome_responsavel = 'João Silva';
UPDATE alunos 
SET valor_mensalidade = 900.00
WHERE nome = 'Lucas Silva';

UPDATE alunos 
SET valor_mensalidade = 920.00
WHERE nome = 'Mariana Oliveira';

Exercicio 14:

-- Criando o Banco de Dados
CREATE DATABASE Pousada;

-- Selecionando o Banco de Dados
USE Pousada;

-- Criando a Tabela Clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY IDENTITY(1,1),
    nome NVARCHAR(100),
    cpf NVARCHAR(11),
    email NVARCHAR(100),
    telefone NVARCHAR(15),
    endereco NVARCHAR(150)
);

SELECT * FROM clientes

-- Criando a Tabela Quartos
CREATE TABLE quartos (
    id_quarto INT PRIMARY KEY IDENTITY(1,1),
    numero_quarto INT,
    tipo NVARCHAR(50),
    valor_diaria DECIMAL(10, 2)
);

DROP TABLE quartos

SELECT * FROM quartos

-- Criando a Tabela Reservas
CREATE TABLE reservas (
    id_reserva INT PRIMARY KEY IDENTITY(1,1),
    id_cliente INT,
    id_quarto INT,
    data_checkin DATE,
    data_checkout DATE,
    valor_total DECIMAL(10, 2),
    status NVARCHAR(50),
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quartos(id_quarto)
);


SELECT * FROM clientes

-- Inserindo clientes
INSERT INTO clientes (nome, cpf, email, telefone, endereco)
VALUES 
('Ana Costa', '12345678901', 'ana.costa@gmail.com', '99999-1234', 'Rua A, 123'),
('Lucas Silva', '23456789012', 'lucas.silva@outlook.com', '98888-5678', 'Rua B, 456');

-- Inserindo quartos
INSERT INTO quartos (numero_quarto, tipo, valor_diaria)
VALUES 
(101, 'Simples', 150.00),
(102, 'Duplo', 200.00),
(201, 'Suíte', 300.00);

-- Inserindo reservas

INSERT INTO reservas (id_cliente, id_quarto, data_checkin, data_checkout, valor_total, status)
VALUES 
(1, 1, '2024-08-01', '2024-08-05', 600.00, 'Confirmada'),
(2, 2, '2024-08-10', '2024-08-12', 400.00, 'Confirmada');

SELECT * FROM reservas

--fazendo consultas
SELECT * FROM reservas WHERE status = 'Confirmada';

SELECT c.nome, q.numero_quarto
FROM reservas r
JOIN clientes c ON r.id_cliente = c.id_cliente
JOIN quartos q ON r.id_quarto = q.id_quarto;

SELECT * FROM reservas WHERE data_checkout > '2024-08-05';


--Calculo de desconto para pagamento a vista

-- Selecionando o valor total da reserva
SELECT valor_total FROM reservas WHERE id_cliente = 1;

-- Aplicando o desconto de 10%
UPDATE reservas 
SET valor_total = valor_total * 0.90 
WHERE id_cliente = 1;


--aumentando o valor para o cliente que extendeu o prazo
-- Adicionando uma diária extra ao valor total da reserva
UPDATE reservas 
SET valor_total = valor_total + (SELECT valor_diaria FROM quartos WHERE id_quarto = 101)
WHERE id_cliente = 1;


--atualizando dados do cliente
-- Atualizando os dados do cliente Ana Costa
UPDATE clientes 
SET telefone = '97777-4321', email = 'ana.costa_novo@gmail.com'
WHERE nome = 'Ana Costa';

