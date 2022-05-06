/*
 *  Comandos SQL diversos
 *  Repositório: Banco de Dados MySQL - Fundamentos 
 *  GitHub: @michelelozada
 */


-- 1. Comando SHOW
   
-- 1.1. Listar a(s) base(s) de dados existente(s) no servidor:
SHOW DATABASES;
     
-- 1.2. Visualizar as tabelas existentes na base de dados em questão:
SHOW TABLES;

     
-- 2. Comando USE
-- É imprescindível que seja indicado ao servidor qual base de dados será utilizada.
USE db_escola;


-- 3. Comando SELECT DATABASE()
-- Este comando irá informar qual a base de dados em utilização (caso ela tenha sido previamente especificada). 
SELECT DATABASE();
-- Considerando o exemplo acima, irá retornar: db_escola


-- 4. Comando DESCRIBE
-- Para apresentar a estrutura da tabela especificada com seus campos, tipo de dados e demais características.
DESCRIBE tb_aluno;
