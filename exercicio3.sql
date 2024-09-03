/*
Desenvolva um banco de dados para uma determinada fábrica de sorvetes, crie as
tabelas de acordo as necessidades do negócio.
Insira pelo menos 10 registros nas tabelas, realize algumas consultas.


*/

-- Criando o banco de dados
CREATE DATABASE FabricaSorvetes;
USE FabricaSorvetes;

-- Tabela de Sabores
CREATE TABLE Sabores (
    ID_Sabor INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Sabor VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Disponivel BIT DEFAULT 1 -- Indica se o sabor está disponível (1) ou não (0)
);

-- Tabela de Ingredientes
CREATE TABLE Ingredientes (
    ID_Ingrediente INT IDENTITY(1,1) PRIMARY KEY,
    Nome_Ingrediente VARCHAR(100) NOT NULL,
    Tipo_Ingrediente VARCHAR(50), -- Ex: Fruta, Chocolate, Leite, etc.
    Quantidade_Estoque DECIMAL(10,2) NOT NULL -- Quantidade disponível no estoque (em kg)
);

-- Tabela de Produção de Sorvetes
CREATE TABLE Producao (
    ID_Producao INT IDENTITY(1,1) PRIMARY KEY,
    Data_Producao DATE NOT NULL,
    ID_Sabor INT NOT NULL,
    Lote VARCHAR(20) NOT NULL,
    Quantidade_Produzida DECIMAL(10,2) NOT NULL, -- Quantidade produzida em litros
    FOREIGN KEY (ID_Sabor) REFERENCES Sabores(ID_Sabor)
);

-- Inserindo registros na tabela Sabores
INSERT INTO Sabores (Nome_Sabor, Descricao)
VALUES 
('Chocolate', 'Sabor de chocolate com cacau 70%'),
('Baunilha', 'Sabor de baunilha natural'),
('Morango', 'Feito com morangos frescos'),
('Limão', 'Sabor cítrico e refrescante de limão'),
('Manga', 'Sabor de manga tropical'),
('Coco', 'Cremoso com pedaços de coco'),
('Doce de Leite', 'Sabor de doce de leite argentino'),
('Pistache', 'Sorvete premium de pistache'),
('Uva', 'Sabor de uva natural'),
('Maracujá', 'Refrescante e cítrico com maracujá natural');

-- Inserindo registros na tabela Ingredientes
INSERT INTO Ingredientes (Nome_Ingrediente, Tipo_Ingrediente, Quantidade_Estoque)
VALUES 
('Cacau', 'Chocolate', 50.00),
('Leite', 'Laticínio', 200.00),
('Açúcar', 'Adoçante', 100.00),
('Morangos Frescos', 'Fruta', 30.00),
('Manga', 'Fruta', 40.00),
('Limão', 'Fruta', 25.00),
('Coco', 'Fruta', 50.00),
('Baunilha', 'Especiaria', 5.00),
('Uva', 'Fruta', 30.00),
('Maracujá', 'Fruta', 35.00);

-- Inserindo registros na tabela Produção
INSERT INTO Producao (Data_Producao, ID_Sabor, Lote, Quantidade_Produzida)
VALUES 
('2024-09-01', 1, 'CHOC20240901', 100.00),
('2024-09-02', 2, 'BAUN20240902', 150.00),
('2024-09-02', 3, 'MORA20240902', 120.00),
('2024-09-03', 4, 'LIMA20240903', 80.00),
('2024-09-03', 5, 'MANG20240903', 90.00),
('2024-09-04', 6, 'COCO20240904', 110.00),
('2024-09-05', 7, 'DOCE20240905', 130.00),
('2024-09-05', 8, 'PIST20240905', 70.00),
('2024-09-06', 9, 'UVA20240906', 60.00),
('2024-09-07', 10, 'MARA20240907', 50.00);

-- CONSULTAS

-- Consultar todos os sabores disponíveis
SELECT * FROM Sabores WHERE Disponivel = 1;

-- Consultar a quantidade de cada ingrediente em estoque
SELECT Nome_Ingrediente, Quantidade_Estoque 
FROM Ingredientes 
ORDER BY Nome_Ingrediente;

-- Consultar as produções realizadas por data
SELECT 
    Data_Producao, 
    Sabores.Nome_Sabor, 
    Producao.Lote, 
    Producao.Quantidade_Produzida 
FROM 
    Producao
JOIN 
    Sabores ON Producao.ID_Sabor = Sabores.ID_Sabor
ORDER BY 
    Data_Producao DESC;

-- Consultar a produção total por sabor
SELECT 
    Sabores.Nome_Sabor, 
    SUM(Producao.Quantidade_Produzida) AS Total_Produzido
FROM 
    Producao
JOIN 
    Sabores ON Producao.ID_Sabor = Sabores.ID_Sabor
GROUP BY 
    Sabores.Nome_Sabor
ORDER BY 
    Total_Produzido DESC;

-- Consultar a produção total de sorvete (em litros)
SELECT SUM(Quantidade_Produzida) AS Total_Produzido
FROM Producao;

-- Consultar a quantidade de sabores produzidos em um determinado dia
SELECT COUNT(*) AS Sabores_Produzidos 
FROM Producao 
WHERE Data_Producao = '2024-09-02';

-- Consultar os sabores que tiveram produção maior que 100 litros
SELECT Sabores.Nome_Sabor, Producao.Quantidade_Produzida
FROM Producao
JOIN Sabores ON Producao.ID_Sabor = Sabores.ID_Sabor
WHERE Producao.Quantidade_Produzida > 100
ORDER BY Producao.Quantidade_Produzida DESC;
