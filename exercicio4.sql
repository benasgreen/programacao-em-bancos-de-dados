/*
Crie um banco com o nome escola_XYZ, crie uma tabela de alunos com os seguintes
campos, ID, Nome, Sobrenome, Email, Mês_Aniversario, Data_Inicio_Escola, insira 10
alunos.
Selecione todos os alunos cadastrados.
Selecione o primeiro nome e o sobrenome de todos os alunos.
Selecione o e-mail do aluno com o ID 5 no banco de dados.
Selecione todos os dados de qualquer aluno cujo sobrenome seja Silva
Selecione todos os alunos que fazem aniversário no mês de agosto.


*/

--CRIANDO O BANCO DE DADOS
CREATE DATABASE ESCOLA_XYZ
--UTILIZANDO O BANCO RECÉM CRIADO
USE ESCOLA_XYZ
--CRIANDO A TABELA ALUNOS_XYZ
	CREATE TABLE ALUNOS_XYZ(
	ID_AL INT IDENTITY(100,1) PRIMARY KEY,
	NOME_AL VARCHAR (20) NOT NULL,
	SOBRENOME_AL VARCHAR(100) NOT NULL,
	EMAIL_AL VARCHAR(35),
	NIVER_AL DATE NOT NULL,
	DATA_MAT_AL DATE
	);

SELECT *FROM ALUNOS_XYZ;
DROP TABLE ALUNOS_XYZ;
--INSERIR 10 ALUNOS

INSERT INTO ALUNOS_XYZ (NOME_AL, SOBRENOME_AL, EMAIL_AL, NIVER_AL, DATA_MAT_AL)
VALUES
('Joao', 'Silva', 'joao.silva@gmail.com', '2005-03-15', '2024-07-01'),
('Maria', 'Oliveira', 'maria.oliveira@hotmail.com', '2006-04-10', '2024-07-01'),
('Pedro', 'Santos', 'pedro.santos@yahoo.com', '2004-05-20', '2024-07-01'),
('Ana', 'Souza', 'ana.souza@gmail.com', '2005-06-25', '2024-07-01'),
('Lucas', 'Pereira', 'lucas.pereira@outlook.com', '2006-07-30', '2024-07-01'),
('Larissa', 'Lima', 'larissa.lima@gmail.com', '2004-08-05', '2024-07-01'),
('Carlos', 'Ferreira', 'carlos.ferreira@hotmail.com', '2005-09-10', '2024-07-01'),
('Beatriz', 'Rocha', 'beatriz.rocha@yahoo.com', '2006-10-15', '2024-07-01'),
('Rafael', 'Almeida', 'rafael.almeida@gmail.com', '2004-11-20', '2024-07-01'),
('Julia', 'Nogueira', 'julia.nogueira@outlook.com', '2005-12-25', '2024-07-01');




--REALIZANDO AS CONSULTAS
--SELECIONAR TODOS OS ALUNOS
SELECT * FROM ALUNOS_XYZ;
--SELECIONAR O NOME E SOBRENOME DOS ALUNOS
SELECT NOME_AL, SOBRENOME_AL FROM ALUNOS_XYZ;
SELECT NOME_AL+' '+SOBRENOME_AL AS "NOME COMPLETO" FROM ALUNOS_XYZ
--SELECIONAR O EMAIL DO ALUNO COM ID 5
SELECT EMAIL_AL FROM ALUNOS_XYZ WHERE ID_AL = 105;
--SELECIONAR TODOS OS DADOS DE UM ALUNO QUE TENHA O SOBRENOME SILVA
SELECT * FROM ALUNOS_XYZ WHERE SOBRENOME_AL = 'SILVA';
--SELECIONAR OS ALUNOS QUE FAZEM ANIVERSARIO EM AGOSTO
SELECT * FROM ALUNOS_XYZ WHERE NIVER_AL = 'AGOSTO';





SELECT NOME_AL+' '+SOBRENOME_AL AS "NOME COMPLETO" FROM ALUNOS_XYZ
