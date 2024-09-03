/*
Crie uma tabela alunos e a tabela celular, faça o relacionamento entre as tabelas,
insira alguns registros e faça algumas consultas para testar a integridade dos
resultados.


*/


CREATE TABLE ALUNO(
	COD_ALUNO INT IDENTITY (1,1) PRIMARY KEY,
	NOME_ALUNO VARCHAR(100) NOT NULL, -- NOT NULL = PREENCHIMENTO OBRIGATORIO
	EMAIL_ALUNO VARCHAR(100),
	ENDERECO_ALUNO VARCHAR(100),
	IDADE_ALUNO INT
);


INSERT INTO ALUNO (NOME_ALUNO, EMAIL_ALUNO, ENDERECO_ALUNO, IDADE_ALUNO)
VALUES
('João Silva', 'joao.silva@gmail.com', 'Rua das Flores, 123', 19),
('Maria Oliveira', 'maria.oliveira@hotmail.com', 'Avenida Paulista, 456', 20),
('Pedro Santos', 'pedro.santos@yahoo.com', 'Rua Augusta, 789', 22),
('Ana Souza', 'ana.souza@gmail.com', 'Rua Haddock Lobo, 101', 21),
('Lucas Pereira', 'lucas.pereira@outlook.com', 'Rua Frei Caneca, 202', 18),
('Larissa Lima', 'larissa.lima@gmail.com', 'Rua da Consolação, 303', 19),
('Carlos Ferreira', 'carlos.ferreira@hotmail.com', 'Avenida Brigadeiro, 404', 20),
('Beatriz Rocha', 'beatriz.rocha@yahoo.com', 'Rua Oscar Freire, 505', 21),
('Rafael Almeida', 'rafael.almeida@gmail.com', 'Rua Bela Cintra, 606', 22),
('Julia Nogueira', 'julia.nogueira@outlook.com', 'Avenida Rebouças, 707', 18),
('Marcos Silva', 'marcos.silva@gmail.com', 'Rua São João, 150', 23),
('Carla Mendes', 'carla.mendes@hotmail.com', 'Avenida Ipiranga, 200', 22),
('Renato Oliveira', 'renato.oliveira@yahoo.com', 'Rua dos Andradas, 250', 24),
('Fernanda Costa', 'fernanda.costa@gmail.com', 'Rua Sete de Setembro, 300', 21),
('Bruno Pereira', 'bruno.pereira@outlook.com', 'Avenida Brasil, 350', 23),
('Luciana Martins', 'luciana.martins@gmail.com', 'Rua XV de Novembro, 400', 20);


SELECT * FROM ALUNO

CREATE TABLE CELULAR (
COD_CEL INT IDENTITY (1,1) PRIMARY KEY,
NUMERO_CEL CHAR(14) NOT NULL,
C_COD_ALUNO INT NOT NULL,
FOREIGN KEY (C_COD_ALUNO) REFERENCES ALUNO(COD_ALUNO) ON DELETE CASCADE
);
--"CHAVE ESTRANGEIRA ()     REFERENCIA      ()         EM CASACATA DE EXCLUSAO "

SELECT * FROM CELULAR

-- INSERINDO DADOS NA TABELA CELULAR
INSERT INTO CELULAR (NUMERO_CEL, C_COD_ALUNO)
VALUES
('(11)91234-5678', 1),
('(11)92345-6789', 2),
('(11)93456-7890', 3),
('(11)94567-8901', 4),
('(11)95678-9012', 5),
('(11)96789-0123', 6),
('(11)97890-1234', 7),
('(11)98901-2345', 8),
('(11)99012-3456', 9),
('(11)90123-4567', 10),
('(11)91234-5678', 2),  
('(11)92345-6789', 4),  
('(11)93456-7890', 6),  
('(11)94567-8901', 8), 
('(11)91234-5678', 11),
('(11)92345-6789', 12),
('(11)93456-7890', 13),
('(11)94567-8901', 14),
('(11)95678-9012', 15),
('(11)96789-0123', 16);

SELECT * FROM CELULAR


-- CONSULTA GERAL NAS TABELAS
SELECT COD_ALUNO, NOME_ALUNO, EMAIL_ALUNO, NUMERO_CEL, IDADE_ALUNO
	FROM ALUNO, CELULAR
		WHERE COD_ALUNO = C_COD_ALUNO;

--CONSULTA ESPECIFICA PELO CÓDIGO DO ALUNO
SELECT NOME_ALUNO, EMAIL_ALUNO, NUMERO_CEL
	FROM ALUNO, CELULAR
		WHERE COD_ALUNO = C_COD_ALUNO AND COD_ALUNO = 16;

DELETE FROM ALUNO WHERE COD_ALUNO = 16;

SELECT * FROM CELULAR



-- OUTRAS CONSULTAS

--BUSCAR ALUNOS COM IDADE ENTRE 15 E 30
SELECT * FROM ALUNO WHERE IDADE_ALUNO >=15 AND IDADE_ALUNO <=30
--REALIZAR A MESMA BUSCA ORDENANDO POR IDADE
SELECT * FROM ALUNO WHERE IDADE_ALUNO > >= 15 AND IDADE_ALUNO <=30 ORDER BY	IDADE_ALUNO DESC
--REALIZAR A BUSCA DE ALUNOS COM A LETRA "J" NA INICIAL DO SEU NOME
SELECT NOME_ALUNO FROM ALUNO WHERE NOME_ALUNO LIKE 'J%'
--REALIZAR A BUSCA POR NOMES QUE TERMINEM COM A LETRA 'A' EM ORDEM ALFABETICA
SELECT NOME_ALUNO FROM ALUNO WHERE NOME_ALUNO LIKE '%A' ORDER BY NOME_ALUNO



