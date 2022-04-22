/*
 *  DML - Linguagem de Manipulação de Dados (aka Data Manipulation Language)
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos
 *  GitHub: @michelelozada
 */


-- 1. INSERT: 
	-- Para inserir dados em uma tabela do banco de dados;
  	-- Deve ser acompanhado de INTO. 

	INSERT INTO alunos_tb(id_aluno,nome_aluno,email_aluno) values (150, 'Lorenzo Martins', 'lorenzomartins@gmail.com');


-- 2. UPDATE: 
	-- Atualiza os dados pré-existentes em uma tabela do banco de dados;
	-- Deve ser usado juntamente com a cláusula WHERE, quando se quiser especificar qual registro terá seus dados atualizados;
	-- Caso seja utilizado sem a cláusula WHERE, todos os registros serão assim atualizados!
 
	UPDATE alunos_tb SET email_aluno = 'lorenzomartins@yahoo.com.br' WHERE id_aluno = 150;


-- 3. DELETE: 
	-- Para excluir os registros de uma tabela do banco de dados;
	-- Caso seja utilizado sem a cláusula WHERE, todos os registros serão excluídos!

	DELETE FROM alunos_tb WHERE id_aluno = 150;