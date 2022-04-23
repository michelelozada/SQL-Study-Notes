/*
 *  Comandos SQL diversos
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos
 *  GitHub: @michelelozada
 */


-- 1. Comando SHOW
	-- Para listar bases de dados existentes ou, senão, as tabelas existentes na base de dados em questão.
    -- 1.1. Visualizar a(s) base(s) de dados existente(s):
		SHOW DATABASES;
     
     -- 1.2. Visualizar as tabelas:
		SHOW TABLES;
     
-- 2. Comando USE
	-- Imprescindível para que a database criada possa ser criada.
		USE db_escola;

-- 3. Comando DESCRIBE
	-- Para apresentar a estrutura da tabela especificada com seus campos, tipo de dados e demais características.
		DESCRIBE tb_alunos;
