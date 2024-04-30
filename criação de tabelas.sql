use exerprocedure;
-- Tabela para armazenar informações dos alunos
CREATE TABLE Alunos (
    Aluno_ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Sobrenome varchar (100),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    Data_nasc DATE
);
-- Tabela para armazenar informações dos cursos
CREATE TABLE Cursos (
    ID_Cursos INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao TEXT,
    Professor_ID INT,
    FOREIGN KEY (Professor_ID) REFERENCES Professores(ID_professores)
);

-- Tabela para armazenar informações dos professores
CREATE TABLE Professores (
    ID_professores INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);