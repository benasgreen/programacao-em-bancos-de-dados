
/*
Crie um banco de dados com o nome padaria_joca, crie as seguintes tabelas:

Clientes
Fornecedores
Funcionarios
Produtos
Insira pelo menos 10 registros nas tabelas, realize algumas consultas.
*/


CREATE DATABASE padaria_joca

USE padaria_joca

--CRIANDO A TABELA DE CLIENTES

CREATE TABLE Clientes(
cod_cli INT IDENTITY (1,1) PRIMARY KEY,
nome_cli VARCHAR(30),
cpf_cli CHAR(15),
endereco_cli VARCHAR(255),
telefone_cli CHAR(14),
email_cli VARCHAR(30),
genero_cli VARCHAR(30),
data_nasc_cli DATE,
idade_cli INT,
data_cadastro_cli DATE
);


SELECT * FROM Clientes

--CRIANDO A TABELA DE FORNECEDORES

CREATE TABLE Fornecedores(
cod_for INT IDENTITY (1,1) PRIMARY KEY,
nome_for VARCHAR(30),
razao_social_for VARCHAR(100),
cnpj_for VARCHAR(20),
email_for VARCHAR(30),
data_cadastro_for DATE,
tipo_servico_for VARCHAR(30),
forma_pagamento_for VARCHAR(20),
dt_cadastro_for DATE
);

SELECT * FROM Fornecedores

--CRIANDO A TABELA DE FUNCIONARIOS

CREATE TABLE Funcionarios(
cod_fun INT IDENTITY (1,1) PRIMARY KEY,
nome_fun VARCHAR(30),
cpf_fun CHAR(15),
endereco_fun VARCHAR(255),
telefone_fun CHAR(14),
email_fun VARCHAR(30),
genero_fun VARCHAR(30),
data_nasc_fun DATE,
idade_fun INT,
data_cadastro_fun DATE
);

SELECT * FROM Funcionarios

--CRIANDO A TABELA DE PRODUTOS

CREATE TABLE Produtos (
cod_pro INT IDENTITY (1,1) PRIMARY KEY,
nome_pro VARCHAR(30),
sabor_pro VARCHAR (30),
descricao_pro VARCHAR(100),
ingredientes_pro VARCHAR(100),
data_producao_pro DATE,
data_vencimento_pro DATE,
tipo_pro VARCHAR(20),
qtd_estoque_pro INT,
valor_pro DECIMAL (4,2),
);

SELECT * FROM Produtos


INSERT INTO Clientes (nome_cli, cpf_cli, endereco_cli, telefone_cli, email_cli, genero_cli, data_nasc_cli, idade_cli, data_cadastro_cli)
VALUES
('Mônica Luiz', '328.852.753-19', 'Rua Exemplo, 123', '(11)912345678', 'monicalz@gmail.com', 'cisgenero', '2000-07-07', 24, '2024-07-31'),
('Marcos Aurelio', '026.850.789-88', 'Rua Exemplo, 456', '(11)987654321', 'marcosaurelio@gmail.com', 'cisgenero', '1991-03-07', 33, '2024-07-31'),
('Luiz Silva', '328.852.231-19', 'Rua Exemplo, 789', '(11)912340191', 'luizsilva@gmail.com', 'cisgenero', '1950-07-07', 74, '2024-07-31'),
('Antonia Costa', '042.812.723-32', 'Rua Exemplo, 321', '(11)9123456789', 'antcosta@gmail.com', 'trans', '2005-07-07', 19, '2024-07-31'),
('Eric Silva', '328.852.753-19', 'Rua Exemplo, 654', '(11)9123456789', 'eric_silva@gmail.com', 'cisgenero', '1992-07-07', 32, '2024-07-31'),
('Ana Pereira', '123.456.789-00', 'Rua Flor, 45', '(11)912340987', 'ana.pereira@example.com', 'cisgenero', '1985-08-12', 38, '2024-07-31'),
('Carlos Santos', '987.654.321-11', 'Av. Central, 123', '(21)998765432', 'carlos.santos@example.com', 'cisgenero', '1978-05-20', 46, '2024-07-31'),
('Beatriz Oliveira', '456.123.789-22', 'Rua das Flores, 789', '(31)912345987', 'beatriz.oliveira@example.com', 'cisgenero', '1995-11-30', 28, '2024-07-31'),
('João Mendes', '321.654.987-33', 'Av. Paulista, 1000', '(41)998712345', 'joao.mendes@example.com', 'cisgenero', '1982-01-15', 42, '2024-07-31'),
('Fernanda Costa', '789.321.654-44', 'Rua Rio Branco, 250', '(51)912367890', 'fernanda.costa@example.com', 'trans', '2002-04-04', 22, '2024-07-31');

SELECT * FROM Clientes

INSERT INTO Fornecedores (nome_for, razao_social_for, cnpj_for, email_for, data_cadastro_for, tipo_servico_for, forma_pagamento_for, dt_cadastro_for)
VALUES
('AlfaTech', 'Alfa Tecnologia LTDA', '12.345.678/0001-00', 'contato@alfatech.com', '2024-07-31', 'Tecnologia', 'Transferência', '2024-07-31'),
('BetaCon', 'Beta Construções SA', '23.456.789/0001-11', 'vendas@betacon.com', '2024-07-31', 'Construção', 'Boleto', '2024-07-31'),
('GammaFoods', 'Gamma Alimentos LTDA', '34.567.890/0001-22', 'sac@gammafoods.com', '2024-07-31', 'Alimentação', 'Cartão de Crédito', '2024-07-31'),
('DeltaLog', 'Delta Logística LTDA', '45.678.901/0001-33', 'logistica@deltalog.com', '2024-07-31', 'Logística', 'Transferência', '2024-07-31'),
('EpsilonMed', 'Epsilon Medicamentos SA', '56.789.012/0001-44', 'atendimento@epsilonmed.com', '2024-07-31', 'Medicamentos', 'Boleto', '2024-07-31'),
('ZetaEnergia', 'Zeta Energia LTDA', '67.890.123/0001-55', 'energia@zetaenergia.com', '2024-07-31', 'Energia', 'Cartão de Crédito', '2024-07-31'),
('EtaTrans', 'Eta Transportes LTDA', '78.901.234/0001-66', 'sac@etatrans.com', '2024-07-31', 'Transportes', 'Transferência', '2024-07-31'),
('ThetaConsult', 'Theta Consultoria LTDA', '89.012.345/0001-77', 'consultoria@thetaconsult.com', '2024-07-31', 'Consultoria', 'Boleto', '2024-07-31'),
('IotaSeguros', 'Iota Seguros SA', '90.123.456/0001-88', 'sac@iotaseguros.com', '2024-07-31', 'Seguros', 'Cartão de Crédito', '2024-07-31'),
('KappaTech', 'Kappa Tecnologia LTDA', '01.234.567/0001-99', 'suporte@kappatech.com', '2024-07-31', 'Tecnologia', 'Transferência', '2024-07-31');


SELECT * FROM Fornecedores


INSERT INTO Funcionarios (nome_fun, cpf_fun, endereco_fun, telefone_fun, email_fun, genero_fun, data_nasc_fun, idade_fun, data_cadastro_fun)
VALUES
('João Silva', '123.456.789-00', 'Rua A, 123', '(11)91234-5678', 'joao.silva@example.com', 'Masculino', '1985-08-15', 38, '2024-07-31'),
('Maria Oliveira', '234.567.890-11', 'Rua B, 456', '(21)92345-6789', 'maria.oliveira@example.com', 'Feminino', '1990-01-20', 34, '2024-07-31'),
('Carlos Souza', '345.678.901-22', 'Av. Central, 789', '(31)93456-7890', 'carlos.souza@example.com', 'Masculino', '1978-11-30', 45, '2024-07-31'),
('Ana Costa', '456.789.012-33', 'Rua das Flores, 321', '(41)94567-8901', 'ana.costa@example.com', 'Feminino', '1995-07-07', 29, '2024-07-31'),
('Pedro Martins', '567.890.123-44', 'Av. Paulista, 1000', '(51)95678-9012', 'pedro.martins@example.com', 'Masculino', '1982-04-04', 42, '2024-07-31'),
('Julia Lima', '678.901.234-55', 'Rua Rio Branco, 250', '(61)96789-0123', 'julia.lima@example.com', 'Feminino', '2000-12-25', 23, '2024-07-31'),
('Ricardo Alves', '789.012.345-66', 'Rua Amazonas, 987', '(71)97890-1234', 'ricardo.alves@example.com', 'Masculino', '1988-06-15', 36, '2024-07-31'),
('Fernanda Mendes', '890.123.456-77', 'Rua Bahia, 654', '(81)98901-2345', 'fernanda.mendes@example.com', 'Feminino', '1992-02-28', 32, '2024-07-31'),
('Marcos Lima', '901.234.567-88', 'Rua Paraná, 432', '(91)99012-3456', 'marcos.lima@example.com', 'Masculino', '1975-09-09', 48, '2024-07-31'),
('Patricia Souza', '012.345.678-99', 'Rua Ceará, 876', '(11)90123-4567', 'patricia.souza@example.com', 'Feminino', '1999-05-18', 25, '2024-07-31');

SELECT * FROM Funcionarios

INSERT INTO Produtos (nome_pro, sabor_pro, descricao_pro, ingredientes_pro, data_producao_pro, data_vencimento_pro, tipo_pro, qtd_estoque_pro, valor_pro)
VALUES
('Pão Francês', 'Tradicional', 'Pão crocante e macio', 'Farinha, água, sal, fermento', '2024-07-30', '2024-08-05', 'Pão', 100, 0.50),
('Bolo de Chocolate', 'Chocolate', 'Bolo fofinho de chocolate', 'Farinha, ovos, açúcar, chocolate, fermento', '2024-07-29', '2024-08-10', 'Bolo', 20, 15.00),
('Croissant', 'Manteiga', 'Croissant francês autêntico', 'Farinha, manteiga, leite, açúcar, fermento', '2024-07-30', '2024-08-03', 'Folhado', 50, 4.00),
('Torta de Limão', 'Limão', 'Torta doce com recheio de limão', 'Farinha, ovos, açúcar, limão, manteiga', '2024-07-28', '2024-08-07', 'Torta', 15, 18.00),
('Pão de Queijo', 'Queijo', 'Pão de queijo mineiro', 'Polvilho, queijo, ovos, leite, óleo', '2024-07-31', '2024-08-10', 'Salgado', 60, 1.50),
('Brioche', 'Manteiga', 'Pão doce e macio', 'Farinha, manteiga, leite, ovos, açúcar', '2024-07-30', '2024-08-05', 'Pão', 30, 3.00),
('Pastel de Nata', 'Creme', 'Pastel português de nata', 'Farinha, ovos, açúcar, leite, creme', '2024-07-29', '2024-08-03', 'Folhado', 40, 5.00),
('Empada de Frango', 'Frango', 'Empada recheada com frango', 'Farinha, frango, óleo, sal, temperos', '2024-07-31', '2024-08-06', 'Salgado', 25, 3.50),
('Bolo de Cenoura', 'Cenoura', 'Bolo de cenoura com cobertura de chocolate', 'Farinha, ovos, cenoura, açúcar, fermento, chocolate', '2024-07-28', '2024-08-07', 'Bolo', 18, 12.00),
('Quiche Lorraine', 'Bacon e Queijo', 'Quiche francesa com bacon e queijo', 'Farinha, ovos, creme de leite, bacon, queijo', '2024-07-29', '2024-08-05', 'Quiche', 12, 20.00);

SELECT * FROM Produtos


SELECT * FROM Produtos;
SELECT * FROM Produtos WHERE tipo_pro = 'Pão';
SELECT * FROM Produtos WHERE qtd_estoque_pro < 50;
SELECT COUNT(*) AS TotalProdutos FROM Produtos;

SELECT * FROM Funcionarios;
SELECT * FROM Funcionarios WHERE idade_fun > 30;
SELECT * FROM Funcionarios WHERE genero_fun = 'Feminino';
SELECT COUNT(*) AS TotalFuncionarios FROM Funcionarios;

SELECT * FROM Fornecedores;
SELECT * FROM Fornecedores WHERE tipo_servico_for = 'Tecnologia';
SELECT * FROM Fornecedores WHERE forma_pagamento_for = 'Transferência';
SELECT COUNT(*) AS TotalFornecedores FROM Fornecedores;
