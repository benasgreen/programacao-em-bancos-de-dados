/*
Uma pequena rede de supermercados, conta com uma matriz e duas filiais, solicita
que você crie um sistema de banco de dados para gerenciar as unidades, desenvolva o
banco de dados, crie as tabelas utilizando algumas restrições, crie os relacionamentos
necessários, insira registros em todas as tabelas, realize algumas consultas para
verificar a integridade dos relacionamentos. Utilize Group By e Order By em algumas
das consultas realizadas.
*/

-- Criando o banco de dados
CREATE DATABASE Supermercados;

-- Usando o banco de dados
USE Supermercados;

-- Criando a tabela de Unidades (Matriz e Filiais)
CREATE TABLE Unidades (
    id_unidade INT IDENTITY(1,1) PRIMARY KEY,
    nome_unidade VARCHAR(100) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    tipo_unidade VARCHAR(50) CHECK (tipo_unidade IN ('Matriz', 'Filial')) NOT NULL
);

-- Criando a tabela de Produtos
CREATE TABLE Produtos (
    id_produto INT IDENTITY(1,1) PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL CHECK (estoque >= 0)
);

-- Criando a tabela de Vendas
CREATE TABLE Vendas (
    id_venda INT IDENTITY(1,1) PRIMARY KEY,
    id_unidade INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    data_venda DATE NOT NULL,
    FOREIGN KEY (id_unidade) REFERENCES Unidades(id_unidade),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

-- Inserindo registros na tabela de Unidades
INSERT INTO Unidades (nome_unidade, endereco, tipo_unidade)
VALUES 
    ('Supermercado Matriz', 'Rua Principal, 123', 'Matriz'),
    ('Supermercado Filial 1', 'Avenida Secundária, 456', 'Filial'),
    ('Supermercado Filial 2', 'Rua Terceira, 789', 'Filial');

-- Inserindo registros na tabela de Produtos
INSERT INTO Produtos (nome_produto, preco, estoque)
VALUES 
    ('Arroz', 20.00, 100),
    ('Feijão', 10.00, 150),
    ('Açúcar', 5.50, 200),
    ('Óleo', 7.00, 120);

-- Inserindo registros na tabela de Vendas
INSERT INTO Vendas (id_unidade, id_produto, quantidade, data_venda)
VALUES 
    (1, 1, 10, '2024-08-01'),
    (2, 2, 15, '2024-08-02'),
    (3, 3, 20, '2024-08-03'),
    (1, 4, 12, '2024-08-01'),
    (2, 1, 18, '2024-08-02');


--Consultas com Group By e Order By

SELECT nome_unidade, SUM(quantidade) AS total_vendido
FROM Vendas
JOIN Unidades ON Vendas.id_unidade = Unidades.id_unidade
GROUP BY nome_unidade
ORDER BY total_vendido DESC;

--Total de vendas por produto:

SELECT nome_produto, SUM(quantidade) AS total_vendido
FROM Vendas
JOIN Produtos ON Vendas.id_produto = Produtos.id_produto
GROUP BY nome_produto
ORDER BY total_vendido DESC;

--Média de vendas por unidade:
SELECT nome_unidade, AVG(quantidade) AS media_vendas
FROM Vendas
JOIN Unidades ON Vendas.id_unidade = Unidades.id_unidade
GROUP BY nome_unidade;


--Vendas ordenadas por data:

SELECT nome_unidade, nome_produto, quantidade, data_venda
FROM Vendas
JOIN Unidades ON Vendas.id_unidade = Unidades.id_unidade
JOIN Produtos ON Vendas.id_produto = Produtos.id_produto
ORDER BY data_venda DESC;


--Estoque disponível em cada unidade para determinado produto:

SELECT nome_produto, estoque
FROM Produtos
WHERE nome_produto = 'Arroz';