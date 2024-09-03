/*
Desenvolver o sistema para reserva de quarto de uma pousada, identificar quais
seriam os atributos necessários a quantidade de tabelas e os relacionamentos
necessários. Inserir alguns registros nas tabelas, realizar algumas consultas, calcular
um valor de desconto para um determinado cliente que fará um pagamento a vista,
aumentar o valor de uma reserva em uma diária, para um cliente que excedeu o prazo
para a sua saída. Atualizar dados de um determinado cliente.
*/

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

SELECT * FROM reservas

-- Consulta com operador LIKE para buscar clientes pelo domínio do email:
SELECT * FROM clientes 
WHERE email LIKE '%gmail.com';


--Consulta com operador BETWEEN para buscar reservas em um intervalo de datas:
SELECT * FROM reservas 
WHERE data_checkin BETWEEN '2024-08-01' AND '2024-08-10';

--Consulta com operador IN para buscar clientes por uma lista de cidades no endereço:
SELECT * FROM clientes 
WHERE endereco IN ('Rua A', 'Rua B', 'Rua C');


--Consulta com operador >, mostrando quartos com valor de diária acima de R$200,00:
SELECT * FROM quartos 
WHERE valor_diaria > 200.00;

--Consulta com operador NOT LIKE para excluir clientes com emails de um domínio específico:

SELECT * FROM clientes 
WHERE email NOT LIKE '%outlook.com';


--Consulta usando COUNT para contar o número de reservas confirmadas:
SELECT COUNT(*) AS total_reservas_confirmadas 
FROM reservas 
WHERE status = 'Confirmada';


--Consulta com operador OR para buscar reservas com status Confirmada ou Pendente:
SELECT * FROM reservas 
WHERE status = 'Confirmada' OR status = 'Pendente';


--Consulta com operador AND para buscar reservas confirmadas acima de R$500:
SELECT * FROM reservas 
WHERE status = 'Confirmada' AND valor_total > 500.00;


-- Consulta com operador MIN e MAX para encontrar a menor e maior diária dos quartos:

SELECT MIN(valor_diaria) AS menor_diaria, MAX(valor_diaria) AS maior_diaria 
FROM quartos;
