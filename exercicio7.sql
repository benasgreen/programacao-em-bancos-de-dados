/*
Utilize o banco criado para a escola_XYZ, nós já temos a tabela alunos, vamos criar
neste banco a tabela Matrículas e a tabela Cursos de acordo aos slides
(relacionamentos Muitos-para-Muitos) , fazendo as seguintes alterações, vamos

adicionar algumas colunas nas tabelas alunos, matrículas e cursos, criar a tabela
professores e relacioná-la com a tabela cursos, inserir registros em todas as tabelas,
realizar algumas consultas, atualizar alguns registros, verificar a integridade das
informações.
*/

-- Usando o banco de dados da escola_XYZ
USE escola_XYZ;

-- Tabela de Alunos
CREATE TABLE Alunos (
    id_aluno INT IDENTITY(1,1) PRIMARY KEY,
    nome_aluno VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(200),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    id_curso INT IDENTITY(1,1) PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    descricao TEXT
);

-- Tabela de Professores
CREATE TABLE Professores (
    id_professor INT IDENTITY(1,1) PRIMARY KEY,
    nome_professor VARCHAR(100) NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Relacionando Cursos com Professores (Muitos-para-Um)
ALTER TABLE Cursos
ADD id_professor INT;
ALTER TABLE Cursos
ADD CONSTRAINT FK_Professor_Curso FOREIGN KEY (id_professor) REFERENCES Professores(id_professor);

-- Tabela de Matrículas (Relacionamento Muitos-para-Muitos entre Alunos e Cursos)
CREATE TABLE Matriculas (
    id_matricula INT IDENTITY(1,1) PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    data_matricula DATE NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Alunos(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

-- Inserindo registros na tabela de Alunos
INSERT INTO Alunos (nome_aluno, data_nascimento, endereco, email, telefone)
VALUES 
('João Silva', '2000-03-25', 'Rua A, 123', 'joao.silva@gmail.com', '11912345678'),
('Maria Oliveira', '1998-12-15', 'Av. B, 456', 'maria.oliveira@gmail.com', '11987654321'),
('Pedro Santos', '2002-05-20', 'Rua C, 789', 'pedro.santos@gmail.com', '11933445566');

-- Inserindo registros na tabela de Professores
INSERT INTO Professores (nome_professor, especialidade, email, telefone)
VALUES 
('Prof. Carlos Mendes', 'Matemática', 'carlos.mendes@escola.com', '11999887766'),
('Prof. Ana Souza', 'História', 'ana.souza@escola.com', '11988776655'),
('Prof. Paulo Lima', 'Inglês', 'paulo.lima@escola.com', '11977665544');

-- Inserindo registros na tabela de Cursos
INSERT INTO Cursos (nome_curso, carga_horaria, descricao, id_professor)
VALUES 
('Matemática Avançada', 80, 'Curso de aprofundamento em matemática', 1),
('História Geral', 60, 'Curso de história mundial', 2),
('Inglês Intermediário', 50, 'Curso intermediário de língua inglesa', 3);

-- Inserindo registros na tabela de Matrículas
INSERT INTO Matriculas (id_aluno, id_curso, data_matricula)
VALUES 
(1, 1, '2023-08-15'),
(2, 2, '2023-08-16'),
(3, 3, '2023-08-17'),
(1, 3, '2023-08-18');

-- CONSULTAS

-- 1. Verificar todos os alunos matriculados
SELECT * FROM Alunos;

-- 2. Verificar todos os cursos oferecidos
SELECT * FROM Cursos;

-- 3. Verificar todas as matrículas e seus detalhes
SELECT 
    Matriculas.id_matricula, 
    Alunos.nome_aluno, 
    Cursos.nome_curso, 
    Matriculas.data_matricula 
FROM Matriculas
JOIN Alunos ON Matriculas.id_aluno = Alunos.id_aluno
JOIN Cursos ON Matriculas.id_curso = Cursos.id_curso;

-- 4. Verificar todos os professores e seus cursos
SELECT 
    Professores.nome_professor, 
    Cursos.nome_curso 
FROM Cursos
JOIN Professores ON Cursos.id_professor = Professores.id_professor;

-- 5. Consultar alunos matriculados em um determinado curso (exemplo: Matemática Avançada)
SELECT 
    Alunos.nome_aluno 
FROM Matriculas
JOIN Alunos ON Matriculas.id_aluno = Alunos.id_aluno
JOIN Cursos ON Matriculas.id_curso = Cursos.id_curso
WHERE Cursos.nome_curso = 'Matemática Avançada';

-- ATUALIZAÇÕES

-- 1. Atualizar o telefone de um aluno
UPDATE Alunos 
SET telefone = '11955555555' 
WHERE id_aluno = 1;

-- 2. Atualizar a especialidade de um professor
UPDATE Professores 
SET especialidade = 'Física' 
WHERE id_professor = 1;

-- VERIFICAÇÃO DA INTEGRIDADE

-- 1. Verificar se algum curso não está associado a um professor
SELECT * 
FROM Cursos 
WHERE id_professor IS NULL;

-- 2. Verificar se algum aluno não está matriculado em nenhum curso
SELECT Alunos.nome_aluno 
FROM Alunos
LEFT JOIN Matriculas ON Alunos.id_aluno = Matriculas.id_aluno
WHERE Matriculas.id_matricula IS NULL;

-- 3. Consultar o total de alunos matriculados por curso
SELECT 
    Cursos.nome_curso, 
    COUNT(Matriculas.id_matricula) AS Total_Alunos
FROM Matriculas
JOIN Cursos ON Matriculas.id_curso = Cursos.id_curso
GROUP BY Cursos.nome_curso
ORDER BY Total_Alunos DESC;
