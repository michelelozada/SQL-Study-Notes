/*
 *  DDL - Linguagem de Definição dos Dados (aka Data Definition Language)
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos 
 *  GitHub: @michelelozada
 */


-- 1. CREATE: 
	-- para a criação de objetos (banco de dados e tabelas) 'vazios'

	-- 1.1. Criação de um banco de dados:
		CREATE DATABASE db_escola;

	-- 2.2. Criação de uma tabela:
		CREATE TABLE tb_alunos;


-- 2.  DROP: 
	-- para a remoção/exclusão de objetos 

	-- 2.1. Exclusão de um banco de dados:
		DROP DATABASE db_escola;

	-- 2.2. Exclusão de uma tabela:
		DROP TABLE tb_professores;


-- 3. ALTER: 
	-- para alterar objetos já existentes; 
    -- esta alteração pode ser através de adição, modificação ou exclusão.
        
	-- 3.1. Alteração da tabela através de adição de uma coluna:
		ALTER TABLE tb_alunos
		ADD column email_aluno varchar(50) not null AFTER telefone_aluno;
    
    -- 3.2. Alteração da tabela através de modificação de uma definição da mesma:
	-- (Imagine que ao atributo email_aluno foi atribuído acidentalmente o tipo de dado int e agora necessito consertar isso...)
		ALTER TABLE tb_alunos
		MODIFY column email_aluno varchar(50);
    
    -- 3.3. Alteração da tabela através da exclusão de uma coluna:
		ALTER TABLE tb_professores
		DROP COLUMN idade_professor;