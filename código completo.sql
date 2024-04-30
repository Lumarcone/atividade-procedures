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
-- -- -- -- criando procedure sobre para Cursos -- -- -- -- --
DELIMITER $

CREATE PROCEDURE  Insert_Curso (
    IN p_Nome VARCHAR(100),
    IN p_Descricao TEXT,
    IN p_Professor_ID INT
)
BEGIN
    INSERT INTO Cursos (Nome, Descricao, Professor_ID) VALUES (p_Nome, p_Descricao, p_Professor_ID);
END$
delimiter ;
-- inserindo valores 
call Insert_Curso('Matemática Básica', 'Curso introdutório sobre conceitos fundamentais de matemática.', 1);
call Insert_Curso('Programação em Python', 'Aprenda a programar em Python do zero.', 2);
call Insert_Curso('Inglês Intermediário', 'Desenvolva suas habilidades de comunicação em inglês.', 3);
call Insert_Curso('Ciências Sociais', 'Estudo das relações sociais e culturais na sociedade.', 4);
call Insert_Curso('Gestão Financeira', 'Princípios básicos de gestão financeira empresarial.', 5);
select*from Cursos;
-- -- criando procedure sobre Professores -- -- --
DELIMITER $
create procedure Insert_Professores(
	IN p_nome varchar (100),
    IN p_email varchar (100),
    IN p_telefone varchar (20)
)
BEGIN
INSERT INTO Professores (Nome, Email, Telefone) Values (p_nome, p_email, p_telefone);
end$ delimiter ;

call Insert_Professores('Prof. Carlos', 'carlos.prof@email.com', '(11) 12345-6789');
call Insert_Professores('Prof. Ana', 'ana.prof@email.com', '(11) 23456-7890'); 
call Insert_Professores('Prof. Joana', 'joana.prof@email.com', '(11) 34567-8901');
call Insert_Professores('Prof. Miguel', 'miguel.prof@email.com', '(11) 45678-9012');
call Insert_Professores('Prof. Sofia', 'sofia.prof@email.com', '(11) 56789-0123'); 

select*from Professores;
 
-- -- -- -- -- -- criando procedure sobre Alunos e verificando se o email ja existe no banco -- -- -- -- -- --

DELIMITER $
CREATE PROCEDURE Insert_Aluno (
    IN p_Nome VARCHAR(100),
    IN p_Sobrenome VARCHAR(100),
    IN p_Email varchar (100),
    IN p_Telefone VARCHAR(20),
    IN p_Data_nasc DATE
)
BEGIN
    DECLARE e_Email VARCHAR(100);
    DECLARE i INT DEFAULT 0;

    SET e_Email = lower( CONCAT(p_Nome, '.', p_Sobrenome));

    -- Verificar se o e-mail já existe na tabela
    WHILE EXISTS (SELECT 1 FROM Alunos WHERE Email = e_Email) DO
        SET i = i + 1;
        SET e_Email = CONCAT(LOWER(REPLACE(p_Nome, ' ', '.')), '.', LOWER(REPLACE(p_Sobrenome, ' ', '.')), i);
    END WHILE;

    -- Inserir o aluno na tabela
    INSERT INTO Alunos (Nome, Sobrenome, Email, Telefone, Data_nasc) VALUES (p_Nome, p_Sobrenome, p_Email, p_Telefone, p_Data_nasc);
END$ DELIMITER ;
call Insert_Aluno('João', 'Silva', 'joao.silva@email.com', '(11) 98765-4321', '2000-05-10');
call Insert_Aluno('Maria','Santos', 'maria.santos@email.com', '(11) 87654-3210', '1999-08-15');
call Insert_Aluno('Pedro','Souza', 'pedro.souza@email.com', '(11) 76543-2109', '2001-02-20');
call Insert_Aluno('Ana',' Oliveira', 'ana.oliveira@email.com', '(11) 65432-1098', '2002-11-25');
call Insert_Aluno('Carlos','Ferreira', 'carlos.ferreira@email.com', '(11) 54321-0987', '2000-04-05');

select*from Alunos; 