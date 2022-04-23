/*
 *  DML - Linguagem de Manipulação de Dados (aka Data Manipulation Language)
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos
 *  GitHub: @michelelozada
 */


-- 1. INSERT: 
	-- Para inserir dados em uma tabela do banco de dados;
  	-- Deve ser acompanhado de INTO. 

	-- 1.1. - Inserção de apenas um valor:
		INSERT INTO tb_alunos(id_aluno,nome_aluno,email_aluno) VALUES (150, 'Lorenzo Martins', 'lorenzomartins@gmail.com');
	
    -- 1.2. - Inserção de mais valores:
		INSERT INTO tb_alunos(id_aluno,nome_aluno,email_aluno) 
		VALUES 
		(151, 'Luana Borba', 'luanab@gmail.com'),
		(152, 'Mariana Fernandes', 'marifernandes@gmail.com'),
		(153, 'Henrique Bormann', 'hbormann@gmail.com');
			
    
-- 2. UPDATE: 
	-- Atualiza os dados pré-existentes em uma tabela do banco de dados;
	-- Deve ser utilizado juntamente com a cláusula WHERE, quando se quiser especificar qual registro terá seus dados atualizados;
	-- ATT! Caso não seja utilizado com a cláusula WHERE, todos os registros da tabela serão atualizados com a mesma informação.
		UPDATE tb_alunos SET nome_aluno = 'Lorenzo Martins Filho' WHERE id_aluno = '150';


-- 3. DELETE: 
	-- Para excluir os registros de uma tabela do banco de dados;
	-- ATT! Caso não seja utilizado com a cláusula WHERE, todos os registros da tabela serão excluídos.
		DELETE FROM tb_alunos WHERE id_aluno = 150;