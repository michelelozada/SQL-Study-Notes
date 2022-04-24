/*
 *  DML - Linguagem de Manipulação de Dados (aka Data Manipulation Language)
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos
 *  GitHub: @michelelozada
 */


-- 1. INSERT: 
-- Para inserir dados em uma tabela do banco de dados;
-- Deve ser utilizado em conjunto com a cláusula INTO e a cláusula VALUES.
  	
-- 1.1. - Inserção de apenas um valor:
INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) VALUES (150, 'Lorenzo Martins', 'lorenzomartins@gmail.com');
	
-- 1.2. - Inserção de mais valores:
INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(151, 'Luana Borba', 'luanab@gmail.com'),
(152, 'Mariana Fernandes', 'marifernandes@gmail.com'),
(153, 'Henrique Bormann', 'hbormann@gmail.com');
			
    
-- 2. UPDATE: 
-- Atualiza os dados pré-existentes em uma tabela do banco de dados;
-- Deve ser utilizado juntamente com a cláusula SET, que tem a função de determinar qual o campo será atualizado;
-- Deve ser utilizado juntamente com a cláusula WHERE, quando é necessária a especificação de qual registro terá seus dados atualizados;
-- ATT! Caso não seja utilizado com a cláusula WHERE, todos os registros da tabela serão atualizados com a mesma informação.
UPDATE tb_aluno SET nomeAluno = 'Lorenzo Martins Filho' WHERE idAluno = '150';


-- 3. DELETE: 
-- Para excluir os registros de uma tabela do banco de dados;
-- Deve ser utilizado juntamente com a cláusula FROM, que especifica qual é a fonte dos dados;
-- ATT! Caso não seja utilizado com a cláusula WHERE, todos os registros da tabela serão excluídos.
DELETE FROM tb_aluno WHERE idAluno = 150;