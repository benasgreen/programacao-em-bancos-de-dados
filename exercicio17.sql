/*
Criar MER e o DER para a empresa Bolos_de_Pote, o banco deve permitir o cadastro
de produtos, clientes e vendas, realizar os relacionamentos necessários, testar os
relacionamentos com as consultas aos dados cadastrados.
*/

-- Criando o banco de dados
CREATE DATABASE Bolos_de_Pote;
USE Bolos_de_Pote;

-- Criando a tabela Clientes
CREATE TABLE Clientes (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Cliente VARCHAR(100) NOT NULL,
    Contato VARCHAR(50)
);

-- Criando a tabela Produtos
CREATE TABLE Produtos (
    ID_Produto INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Produto VARCHAR(100) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL
);

-- Criando a tabela Vendas (tabela simplificada)
CREATE TABLE Vendas (
    ID_Venda INT IDENTITY(1,1) PRIMARY KEY,
    Data_Venda DATE NOT NULL,
    V_ID_Cliente INT,
    V_ID_Produto INT,
    Quantidade INT,
    FOREIGN KEY (V_ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (V_ID_Produto) REFERENCES Produtos(ID_Produto)
);

-- Inserindo registros na tabela Clientes
INSERT INTO Clientes (Nome_Cliente, Contato)
VALUES 
('Ana Silva', 'ana@email.com'),
('Carlos Oliveira', 'carlos@email.com'),
('Maria Souza', 'maria@email.com');

-- Inserindo registros na tabela Produtos
INSERT INTO Produtos (Nome_Produto, Preco)
VALUES 
('Bolo de Chocolate', 10.50),
('Bolo de Morango', 12.00),
('Bolo de Laranja', 8.75);

-- Inserindo registros na tabela Vendas
INSERT INTO Vendas (Data_Venda, V_ID_Cliente, V_ID_Produto, Quantidade)
VALUES 
('2024-09-01', 1, 1, 2), -- Ana Silva comprou 2 Bolos de Chocolate
('2024-09-01', 2, 2, 1), -- Carlos Oliveira comprou 1 Bolo de Morango
('2024-09-02', 3, 3, 3); -- Maria Souza comprou 3 Bolos de Laranja

-- CONSULTAS

-- Consultando todas as vendas realizadas
SELECT Vendas.ID_Venda, Vendas.Data_Venda, Clientes.Nome_Cliente, Produtos.Nome_Produto, Vendas.Quantidade
FROM Vendas
JOIN Clientes ON Vendas.V_ID_Cliente = Clientes.ID_Cliente
JOIN Produtos ON Vendas.V_ID_Produto = Produtos.ID_Produto;

-- Consulta para verificar a quantidade total de produtos vendidos
SELECT Produtos.Nome_Produto, SUM(Vendas.Quantidade) AS Total_Vendido
FROM Vendas
JOIN Produtos ON Vendas.V_ID_Produto = Produtos.ID_Produto
GROUP BY Produtos.Nome_Produto
ORDER BY Total_Vendido DESC;

-- Consulta para verificar vendas por cliente
SELECT Clientes.Nome_Cliente, COUNT(Vendas.ID_Venda) AS Total_Vendas, SUM(Vendas.Quantidade) AS Total_Produtos
FROM Vendas
JOIN Clientes ON Vendas.V_ID_Cliente = Clientes.ID_Cliente
GROUP BY Clientes.Nome_Cliente
ORDER BY Total_Vendas DESC;

-- Consulta para verificar o valor total vendido de cada produto
SELECT Produtos.Nome_Produto, SUM(Vendas.Quantidade * Produtos.Preco) AS Total_Valor_Vendido
FROM Vendas
JOIN Produtos ON Vendas.V_ID_Produto = Produtos.ID_Produto
GROUP BY Produtos.Nome_Produto;

-- VIEW: Criação de uma View para mostrar vendas detalhadas
CREATE VIEW Vendas_Detalhadas AS
SELECT 
    Vendas.ID_Venda, 
    Vendas.Data_Venda, 
    Clientes.Nome_Cliente, 
    Produtos.Nome_Produto, 
    Vendas.Quantidade, 
    (Vendas.Quantidade * Produtos.Preco) AS Valor_Total
FROM 
    Vendas
JOIN 
    Clientes ON Vendas.V_ID_Cliente = Clientes.ID_Cliente
JOIN 
    Produtos ON Vendas.V_ID_Produto = Produtos.ID_Produto;

-- Consultando a View
SELECT * FROM Vendas_Detalhadas;