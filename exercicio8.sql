/*
Criar um banco de dados para a Pizzaria_Marujos com as seguintes tabelas,
Funcionários, Clientes, Produtos e Pedidos, criar o relacionamento necessário entre as
tabelas, inserir registros, realizar atualização de alguns registros utilizando UPDATE,
testar a integridade das informações. Realizar algumas consultas.
*/


CREATE DATABASE Pizzaria_Marujos;

USE Pizzaria_Marujos
-- Primeiro, criar a tabela Funcionarios
CREATE TABLE Funcionarios(
cod_funcionario INT IDENTITY(1200,1) PRIMARY KEY,
nome_funcionario VARCHAR(100) NOT NULL,
email_funcionario VARCHAR(100),
endereco_funcionario VARCHAR(100),
idade_funcionario INT,
funcao_funcionario VARCHAR(100),
data_contra_funcionario DATE,
);

DROP TABLE Funcionarios

SELECT * FROM Funcionarios

-- Inserir registros na tabela Funcionarios
INSERT INTO Funcionarios (nome_funcionario, email_funcionario, endereco_funcionario, idade_funcionario, funcao_funcionario, data_contra_funcionario)
VALUES 
('Carlos Almeida', 'carlos.almeida@gmail.com', 'Rua das Flores, 123', 34, 'Gerente', '2022-01-10'),
('Mariana Lima', 'mariana.lima@outlook.com', 'Avenida Paulista, 456', 29, 'Atendente', '2021-06-15'),
('Roberto Silva', 'roberto.silva@gmail.com', 'Rua das Acácias, 789', 42, 'Pizzaiolo', '2020-03-20'),
('Ana Oliveira', 'ana.oliveira@gmail.com', 'Rua das Margaridas, 321', 27, 'Caixa', '2023-04-05'),
('Bruno Souza', 'bruno.souza@outlook.com', 'Avenida Brasil, 654', 31, 'Entregador', '2021-11-22'),
('Fernanda Rocha', 'fernanda.rocha@gmail.com', 'Rua das Palmeiras, 987', 26, 'Recepcionista', '2022-09-18'),
('Gabriel Santos', 'gabriel.santos@outlook.com', 'Avenida Independência, 456', 37, 'Auxiliar de Cozinha', '2021-02-10'),
('Helena Almeida', 'helena.almeida@gmail.com', 'Rua das Rosas, 789', 24, 'Atendente', '2022-05-23'),
('Igor Martins', 'igor.martins@outlook.com', 'Avenida Santos Dumont, 123', 39, 'Gerente Assistente', '2020-08-12'),
('Juliana Souza', 'juliana.souza@gmail.com', 'Rua das Orquídeas, 456', 28, 'Caixa', '2023-01-15');

-- Primeiro, criar a tabela Clientes
CREATE TABLE Clientes(
cod_cli INT IDENTITY(1300,1) PRIMARY KEY,
nome_cli VARCHAR(100) NOT NULL,
email_cli VARCHAR(100),
cpf_cli CHAR(14),
tel_cli CHAR(14),
end_cli VARCHAR(100),
);

DROP TABLE clientes

SELECT * FROM clientes


-- Inserir registros na tabela Clientes
INSERT INTO Clientes (nome_cli, email_cli, cpf_cli, tel_cli, end_cli)
VALUES 
('Alice Gomes', 'alice.gomes@gmail.com', '123.456.789-01', '(11)91234-5678', 'Rua das Laranjeiras, 100'),
('Bruno Ferreira', 'bruno.ferreira@outlook.com', '234.567.890-12', '(21)92345-6789', 'Avenida das Nações, 200'),
('Carla Mendes', 'carla.mendes@gmail.com', '345.678.901-23', '(31)93456-7890', 'Travessa dos Pioneiros, 300'),
('Diego Oliveira', 'diego.oliveira@outlook.com', '456.789.012-34', '(41)94567-8901', 'Praça das Flores, 400'),
('Elisa Costa', 'elisa.costa@gmail.com', '567.890.123-45', '(51)95678-9012', 'Avenida Central, 500'),
('Felipe Rocha', 'felipe.rocha@outlook.com', '678.901.234-56', '(61)96789-0123', 'Rua das Acácias, 600'),
('Giovana Martins', 'giovana.martins@gmail.com', '789.012.345-67', '(71)97890-1234', 'Avenida Paulista, 700'),
('Henrique Souza', 'henrique.souza@outlook.com', '890.123.456-78', '(81)98901-2345', 'Rua das Palmeiras, 800'),
('Isabela Lima', 'isabela.lima@gmail.com', '901.234.567-89', '(91)99012-3456', 'Travessa dos Girassóis, 900'),
('João Silva', 'joao.silva@outlook.com', '012.345.678-90', '(11)91234-5678', 'Avenida Brasil, 1000');


-- Primeiro, criar a tabela Produto
CREATE TABLE Produto(
cod_prod INT IDENTITY(200,1) PRIMARY KEY,
nome_prod VARCHAR(50),
desc_prod VARCHAR(255),
ing_prod VARCHAR (255),
valor_prod DECIMAL (10,2),
);



SELECT * FROM produto

-- Inserir registros na tabela Produto
INSERT INTO Produto (nome_prod, desc_prod, ing_prod, valor_prod)
VALUES 
('Pizza Margherita', 'Pizza clássica com molho de tomate, mussarela e manjericão.', 'Molho de tomate, mussarela, manjericão, azeite', 25.90),
('Pizza Pepperoni', 'Pizza com molho de tomate, mussarela e fatias de pepperoni.', 'Molho de tomate, mussarela, pepperoni, orégano', 28.50),
('Pizza Quatro Queijos', 'Pizza com molho de tomate e uma mistura de quatro queijos.', 'Molho de tomate, mussarela, gorgonzola, parmesão, catupiry', 32.00),
('Pizza Portuguesa', 'Pizza com molho de tomate, mussarela, presunto, ovos e azeitonas.', 'Molho de tomate, mussarela, presunto, ovos, azeitonas, cebola, pimentão', 30.00),
('Pizza Calabresa', 'Pizza com molho de tomate, mussarela e calabresa fatiada.', 'Molho de tomate, mussarela, calabresa, cebola, orégano', 27.50),
('Pizza Frango com Catupiry', 'Pizza com molho de tomate, frango desfiado e catupiry.', 'Molho de tomate, frango desfiado, catupiry, milho, orégano', 29.00),
('Pizza Vegetariana', 'Pizza com molho de tomate e diversos vegetais.', 'Molho de tomate, mussarela, abobrinha, berinjela, pimentão, cebola, azeitonas', 26.00),
('Pizza de Atum', 'Pizza com molho de tomate, atum e cebola.', 'Molho de tomate, atum, cebola, mussarela, azeitonas, orégano', 31.00),
('Pizza Napolitana', 'Pizza com molho de tomate, mussarela, anchovas e alcaparras.', 'Molho de tomate, mussarela, anchovas, alcaparras, orégano', 33.00),
('Pizza Bacon e Cheddar', 'Pizza com molho de tomate, mussarela, bacon e cheddar.', 'Molho de tomate, mussarela, bacon, cheddar, orégano', 34.50);



CREATE TABLE Pedido_Marujos (
cod_ped INT IDENTITY(1,1) PRIMARY KEY,
cod_cli INT,
cod_funcionario INT,
data_pedido DATE NOT NULL,
total_pedido DECIMAL(10,2),
FOREIGN KEY (cod_cli) REFERENCES clientes(cod_cli),
FOREIGN KEY (cod_funcionario) REFERENCES funcionarios(cod_funcionario)
);	

SELECT * FROM Pedido_Marujos

INSERT INTO Pedido_Marujos (cod_cli, cod_funcionario, data_pedido, total_pedido) VALUES
(1301, 1201, '2024-07-31', 50.00),
(1302, 1202, '2024-07-31', 75.00),
(1303, 1203, '2024-07-31', 65.00),
(1304, 1204, '2024-07-31', 40.00),
(1305, 1205, '2024-07-31', 55.00),
(1306, 1206, '2024-07-31', 80.00),
(1307, 1207, '2024-07-31', 70.00),
(1308, 1208, '2024-07-31', 90.00),
(1309, 1209, '2024-07-31', 85.00),
(1300, 1200, '2024-07-31', 60.00);

SELECT * FROM Funcionarios

SELECT * FROM clientes


--Listar Todos os Clientes e Seus Pedidos
SELECT 
    c.nome_cli, 
    c.email_cli, 
    p.cod_ped, 
    p.data_pedido, 
    p.total_pedido
FROM 
    Clientes c
JOIN 
    Pedido_Marujos p ON c.cod_cli = p.cod_cli;


SELECT 
    c.cod_cli, 
    c.email_cli, 
    p.cod_ped, 
    p.data_pedido, 
    p.total_pedido
FROM 
    Clientes c
JOIN 
    Pedido_Marujos p ON c.cod_cli = p.cod_cli
JOIN 
    Funcionarios f ON p.cod_funcionario = f.cod_funcionario;

--Atualizar o Endereço de um Cliente

UPDATE Clientes
SET end_cli = 'Rua Nova, 1500'
WHERE nome_cli = 'Alice Gomes';

--Atualizar a Função de um Funcionário
UPDATE Funcionarios
SET funcao_funcionario = 'Chefe de Cozinha'
WHERE nome_funcionario = 'Bruno Silva';