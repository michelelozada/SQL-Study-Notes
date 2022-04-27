/*
 *  Comandos SQL diversos
 *  Repositório: Banco de Dados MySQL - Fundamentos 
 *  GitHub: @michelelozada
 */


-- 1. Comando SHOW
   
-- 1.1. Listar a(s) base(s) de dados existente(s) no sistema:
SHOW DATABASES;
     
-- 1.2. Visualizar as tabelas existentes na base de dados em questão:
SHOW TABLES;

     
-- 2. Comando USE
-- Imprescindível para que seja definida que base de dados será utilizada.
USE db_escola;


-- 3. Comando DESCRIBE
-- Para apresentar a estrutura da tabela especificada com seus campos, tipo de dados e demais características.
DESCRIBE tb_aluno;
