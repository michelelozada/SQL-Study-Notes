/*
 *  DDL - Linguagem de Definição dos Dados (aka Data Definition Language)
 *  Repositório: Banco de Dados MySQL - Fundamentos 
 *  GitHub: @michelelozada
 */


-- 1. CREATE: 
-- Para a criação de objetos (banco de dados e tabelas) 'vazios'

-- 1.1. Criação de um banco de dados:
CREATE DATABASE db_escola;

-- 2.2. Criação de uma tabela:
CREATE TABLE tb_aluno(
idAluno int(11) not null,
nomeAluno varchar(50) not null,
emailAluno varchar(40) not null
);


-- 2.  DROP: 
-- Para a exclusão de objetos 

-- 2.1. Exclusão de um banco de dados:
DROP DATABASE db_escola;

-- 2.2. Exclusão de uma tabela:
DROP TABLE tb_professor;


-- 3. ALTER: 
-- Para alterar objetos já existentes
-- Esta alteração pode ser através de adição, modificação ou exclusão
        
-- 3.1.1. Alteração da tabela através da adição de uma coluna:
ALTER TABLE tb_aluno
ADD COLUMN enderecoAluno varchar(50) not null AFTER telefoneAluno;
        
-- 3.1.2. Alteração da tabela através da adição de uma chave primária:   
ALTER TABLE tb_aluno
ADD PRIMARY KEY (idAluno);
		       
-- 3.2. Alteração da tabela através da modificação de uma definição da mesma:
-- (Imagine que foi atribuído acidentalmente o tipo de dado int ao atributo emailAluno e que agora necessito consertar isso...)
ALTER TABLE tb_aluno
MODIFY COLUMN emailAluno varchar(50);
   
-- 3.3. Alteração da tabela através da exclusão de uma coluna:
ALTER TABLE tb_professor
DROP COLUMN idadeProfessor;