/*
 *  Auto-incremento 
 *  Repositório: Banco de Dados MySQL - Fundamentos 
 *  GitHub: @michelelozada
 */


-- O auto-incremento propicia que um número único seja gerado assim que um novo registro é inserido numa tabela.
-- O valor incial padrão começa em 1 (mas isso pode ser alterado, conforme explicado abaixo), sendo que o incremento ocorre de 1 em 1. 
-- Apenas um campo da tabela pode ser auto-incrementado (geralmente a primary key), sendo que ele deve vir acompanhado da constraint NOT NULL.


-- A. Utilizando o AUTO_INCREMENT:
CREATE DATABASE db_escola;
USE db_escola;
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nomeAluno varchar(50) NOT NULL,
	emailAluno varchar(40) NOT NULL
);

INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(default, 'Luana Borba', 'luanab@gmail.com'),
(default, 'Mariana Fernandes', 'marifernandes@gmail.com'),
(default, 'Cátia Marcondes', 'catiamarcondes@gmail.com'),
(default, 'Marcos Góes', 'marcosgoes@gmail.com'),
(default, 'Sônia de Morais', 'sonia_morais@gmail.com'),
(default, 'Andréa Santos', 'asantos@gmail.com'),
(default, 'Silvio Soares', 'ssoares@gmail.com'),
(default, 'Daniele Santana', 'danisantana@gmail.com'),
(default, 'Luis Garcia', 'lgarcia@gmail.com'),
(default, 'Heloísa Bormann', 'hbormann@gmail.com');

SELECT * FROM tb_aluno;
-- Retornou:
-- 1	Luana Borba luanab@gmail.com
-- 2	Mariana Fernandes marifernandes@gmail.com
-- 3	Cátia Marcondes catiamarcondes@gmail.com
-- 4	Marcos Góes marcosgoes@gmail.com
-- 5	Sônia de Morais sonia_morais@gmail.com
-- 6	Andréa Santos asantos@gmail.com
-- 7	Silvio Soares ssoares@gmail.com
-- 8	Daniele Santana danisantana@gmail.com
-- 9	Luis Garcia lgarcia@gmail.com
-- 10	Heloísa Bormann hbormann@gmail.com


-- B. Caso haja a necessidade de setar o valor default do AUTO_INCREMENT para um valor diferente:  
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nomeAluno varchar(50) NOT NULL,
	emailAluno varchar(40) NOT NULL
) AUTO_INCREMENT = 100;

SELECT * FROM tb_aluno;
-- Retornou:
-- 100	Luana Borba luanab@gmail.com
-- 101	Mariana Fernandes marifernandes@gmail.com
-- 102	Cátia Marcondes catiamarcondes@gmail.com
-- 103	Marcos Góes marcosgoes@gmail.com
-- 104	Sônia de Morais sonia_morais@gmail.com
-- 105	Andréa Santos asantos@gmail.com
-- 106	Silvio Soares ssoares@gmail.com
-- 107	Daniele Santana danisantana@gmail.com
-- 108	Luis Garcia lgarcia@gmail.com
-- 109	Heloísa Bormann hbormann@gmail.com


-- C. Após a tabela já ter sido criada, caso seja necessário que a próxima sequência de registros na tabela comece com um valor de incremento diferente:
ALTER TABLE tb_Aluno AUTO_INCREMENT = 200;

INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(default, 'Marianne Marques', 'marim@gmail.com'),
(default, 'Renato Passos', 'rpassos@gmail.com'),
(default, 'Frederico Fernandes', 'fredfernandes@gmail.com'),
(default, 'Marcela Guedes', 'mar_guedes@gmail.com'),
(default, 'Lúcia Freitas', 'luciafreitas@gmail.com');

SELECT * FROM tb_aluno;
-- Retornou:
-- 100	Luana Borba luanab@gmail.com
-- 101	Mariana Fernandes marifernandes@gmail.com
-- 102	Cátia Marcondes catiamarcondes@gmail.com
-- 103	Marcos Góes marcosgoes@gmail.com
-- 104	Sônia de Morais sonia_morais@gmail.com
-- 105	Andréa Santos asantos@gmail.com
-- 106	Silvio Soares ssoares@gmail.com
-- 107	Daniele Santana danisantana@gmail.com
-- 108	Luis Garcia lgarcia@gmail.com
-- 109	Heloísa Bormann hbormann@gmail.com
-- 200	Marianne Marques marim@gmail.com
-- 201	Renato Passos rpassos@gmail.com
-- 202	Frederico Fernandes fredfernandes@gmail.com
-- 203	Marcela Guedes mar_guedes@gmail.com
-- 204	Lúcia Freitas luciafreitas@gmail.com


-- D. Para verificação do último valor inserido no campo que utilizou AUTO_INCREMENT: 
SELECT MAX(idAluno) FROM tb_Aluno;
-- O exemplo acima retornou: 204