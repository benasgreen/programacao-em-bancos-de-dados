/*
A empresa Vento_Gelado trabalha com manutenções em aparelhos de ar
condicionado, e contratou você para desenvolver um banco de dados para a empresa,
desenvolva o banco de dados, as tabelas e os relacionamentos necessários para
atender a necessidade da empresa. Sabemos que ela possui uma carteira de clientes,
um controle com as datas das manutenções realizadas e a lista de peças que foram
trocadas em cada aparelho de cada cliente.
*/

--criando a tabela Clientes
CREATE TABLE Clientes (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf_cliente CHAR(11) NOT NULL UNIQUE,
    telefone_cliente VARCHAR(15),
    endereco_cliente VARCHAR(255)
);

--Criando a tabela Aparelhos
CREATE TABLE Aparelhos (
    id_aparelho INT IDENTITY(1,1) PRIMARY KEY,
    id_cliente INT NOT NULL,
    modelo_aparelho VARCHAR(50) NOT NULL,
    marca_aparelho VARCHAR(50) NOT NULL,
    data_instalacao DATE,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente) ON DELETE CASCADE
);

--criando a tabela manutencoes 
CREATE TABLE Manutencoes (
    id_manutencao INT IDENTITY(1,1) PRIMARY KEY,
    id_aparelho INT NOT NULL,
    data_manutencao DATE NOT NULL,
    descricao_servico VARCHAR(255),
    CONSTRAINT fk_aparelho FOREIGN KEY (id_aparelho) REFERENCES Aparelhos(id_aparelho) ON DELETE CASCADE
);

--criando a tabela pecas
CREATE TABLE Pecas (
    id_peca INT IDENTITY(1,1) PRIMARY KEY,
    nome_peca VARCHAR(100) NOT NULL,
    descricao_peca VARCHAR(255),
    valor_peca DECIMAL(10,2)
);

--criando a tabela pecas de manutencao
CREATE TABLE Pecas_Manutencao (
    id_manutencao INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade INT,
    CONSTRAINT fk_manutencao FOREIGN KEY (id_manutencao) REFERENCES Manutencoes(id_manutencao) ON DELETE CASCADE,
    CONSTRAINT fk_peca FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca) ON DELETE CASCADE,
    PRIMARY KEY (id_manutencao, id_peca)
);


--inserindo dados
INSERT INTO Clientes (nome_cliente, cpf_cliente, telefone_cliente, endereco_cliente)
VALUES 
('João Silva', '12345678901', '(11) 91234-5678', 'Rua A, 123'),
('Maria Santos', '23456789012', '(21) 92345-6789', 'Rua B, 456');


--inserindo aparelhos
INSERT INTO Clientes (nome_cliente, cpf_cliente, telefone_cliente, endereco_cliente)
VALUES 
('João Silva', '12345678901', '(11) 91234-5678', 'Rua A, 123'),
('Maria Santos', '23456789012', '(21) 92345-6789', 'Rua B, 456');


--inserindo manutencao
INSERT INTO Manutencoes (id_aparelho, data_manutencao, descricao_servico)
VALUES 
(1, '2024-08-15', 'Limpeza de filtros e troca de gás'),
(2, '2024-08-20', 'Troca de motor e revisão geral');


--inserindo pecas
INSERT INTO Pecas (nome_peca, descricao_peca, valor_peca)
VALUES 
('Filtro de Ar', 'Filtro de ar para aparelho Samsung', 50.00),
('Gás Refrigerante', 'Gás R410A', 200.00),
('Motor', 'Motor LG 220V', 350.00);


--inserindo pecas por manutencao

INSERT INTO Pecas_Manutencao (id_manutencao, id_peca, quantidade)
VALUES 
(1, 1, 1), -- Filtro de ar para manutenção 1
(1, 2, 1), -- Gás refrigerante para manutenção 1
(2, 3, 1); -- Motor para manutenção 2



--fazendo consultas

--Listar todas as manutenções de um cliente específico:
SELECT C.nome_cliente, A.modelo_aparelho, M.data_manutencao, M.descricao_servico
FROM Manutencoes M
JOIN Aparelhos A ON M.id_aparelho = A.id_aparelho
JOIN Clientes C ON A.id_cliente = C.id_cliente
WHERE C.nome_cliente = 'João Silva';

--Listar todas as peças trocadas em uma manutenção:
SELECT P.nome_peca, PM.quantidade, P.valor_peca
FROM Pecas_Manutencao PM
JOIN Pecas P ON PM.id_peca = P.id_peca
WHERE PM.id_manutencao = 1;

--Atualizar dados de um cliente:
UPDATE Clientes 
SET telefone_cliente = '(11) 98765-4321', endereco_cliente = 'Rua Nova, 789'
WHERE nome_cliente = 'João Silva';

--Verificar as manutenções realizadas em um determinado período:
SELECT * FROM Manutencoes
WHERE data_manutencao BETWEEN '2024-08-01' AND '2024-08-31';



SELECT nome_cliente, endereco_cliente
FROM Clientes
WHERE endereco_cliente LIKE 'Rua A%';

SELECT id_manutencao, id_aparelho, data_manutencao
FROM Manutencoes
WHERE data_manutencao BETWEEN '2024-08-01' AND '2024-08-31';


SELECT id_manutencao, id_aparelho, data_manutencao, descricao_servico
FROM Manutencoes
WHERE id_aparelho IN (1, 2);


SELECT nome_cliente 
FROM Clientes
WHERE id_cliente NOT IN (SELECT id_cliente FROM Aparelhos);


SELECT M.id_manutencao, M.data_manutencao, P.nome_peca
FROM Manutencoes M
JOIN Pecas_Manutencao PM ON M.id_manutencao = PM.id_manutencao
JOIN Pecas P ON PM.id_peca = P.id_peca
WHERE M.data_manutencao BETWEEN '2024-08-01' AND '2024-08-31'
AND PM.quantidade > 0;


SELECT nome_cliente, endereco_cliente
FROM Clientes
WHERE endereco_cliente LIKE 'Rua A%' OR endereco_cliente LIKE 'Rua B%';

--Consulta com agregação (SUM): Calcular o total de peças trocadas em uma manutenção específica.
SELECT nome_peca, valor_peca
FROM Pecas
WHERE valor_peca > 200.00;


--Consulta com DISTINCT: Listar todos os modelos de aparelhos sem repetições.
SELECT SUM(PM.quantidade) AS total_pecas_trocadas
FROM Pecas_Manutencao PM
WHERE PM.id_manutencao = 1;

-- Consulta com COUNT: Contar quantas manutenções foram realizadas em um determinado aparelho.
SELECT COUNT(*) AS total_manutencoes
FROM Manutencoes
WHERE id_aparelho = 1;