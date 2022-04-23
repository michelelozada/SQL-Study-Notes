/*
 *  Comando SELECT (com suas cláusulas e operadores)
 *  Repositório: Banco-de-Dados-MySQL_Fundamentos
 *  GitHub: @michelelozada
 */
    
    
-- 1.- Criação da tabela de exemplo:
	CREATE DATABASE db_escola;
    USE db_escola;
    CREATE TABLE tb_alunos(
    id_aluno int(11) not null,
    nome_aluno varchar(50) not null,
    email_aluno varchar(40) not null
    );
    
	INSERT INTO tb_alunos(id_aluno,nome_aluno,email_aluno) 
	VALUES 
	(01, 'Luana Borba', 'luanab@gmail.com'),
	(02, 'Mariana Fernandes', 'marifernandes@gmail.com'),
	(03, 'Cátia Marcondes', 'catiamarcondes@gmail.com'),
	(04, 'Marcos Góes', 'marcosgoes@gmail.com'),
	(05, 'Sônia de Morais', 'sonia_morais@gmail.com'),
	(06, 'Andréa Santos', 'asantos@gmail.com'),
	(07, 'Silvio Soares', 'ssoares@gmail.com'),
	(08, 'Daniele Santana', 'danisantana@gmail.com'),
	(09, 'Luis Henrique Garcia', 'lhgarcia@gmail.com'),
	(10, 'Heloísa Bormann', 'hbormann@gmail.com');
    
	SELECT * FROM tb_alunos;
	/* Retorna:
	1	Luana Borba				luanab@gmail.com
	2	Mariana Fernandes		marifernandes@gmail.com
	3	Cátia Marcondes			catiamarcondes@gmail.com
	4	Marcos Góes				marcosgoes@gmail.com
	5	Sônia de Morais			sonia_morais@gmail.com
	6	Andréa Santos			asantos@gmail.com
	7	Silvio Soares			ssoares@gmail.com
	8	Daniele Santana			danisantana@gmail.com
	9	Luis Henrique Garcia	lhgarcia@gmail.com
	10	Heloísa Bormann			hbormann@gmail.com  */
    
	
-- 2 - A Cláusula ORDER BY:
	SELECT * FROM tb_alunos ORDER BY nome_aluno; -- ordenação default é em ordem crescente
	/* Retorna:
	6	Andréa Santos			asantos@gmail.com
	3	Cátia Marcondes			catiamarcondes@gmail.com
	8	Daniele Santana			danisantana@gmail.com
	10	Heloísa Bormann			hbormann@gmail.com
	1	Luana Borba				luanab@gmail.com
	9	Luis Henrique Garcia	lhgarcia@gmail.com
	4	Marcos Góes				marcosgoes@gmail.com
	2	Mariana Fernandes		marifernandes@gmail.com
	7	Silvio Soares			ssoares@gmail.com
	5	Sônia de Morais			sonia_morais@gmail.com */
		
	SELECT nome_aluno FROM tb_alunos ORDER BY nome_aluno desc;
	/* Retorna:
	Sônia de Morais
	Silvio Soares
	Mariana Fernandes
	Marcos Góes
	Luis Henrique Garcia
	Luana Borba
	Heloísa Bormann
	Daniele Santana
	Cátia Marcondes
	Andréa Santos */


-- 3. A Cláusula WHERE:
	SELECT id_aluno, nome_aluno FROM tb_alunos WHERE id_aluno = '5';
	/* Retorna:
	5	Sônia de Morais */
        
	SELECT id_aluno, nome_aluno FROM tb_alunos WHERE id_aluno >= '5' ORDER BY nome_aluno;
	/* Retorna:
	6	Andréa Santos
	8	Daniele Santana
	10	Heloísa Bormann
	9	Luis Henrique Garcia
	7	Silvio Soares
	5	Sônia de Morais */
        
        
-- 4. O Operador LIKE:
	SELECT * from tb_alunos WHERE nome_aluno LIKE '%A'; -- filtra registros presentes na tabela que tem palavras (no campo nome_aluno) que terminam com a letra 'A' 
	/* Retorna:
	1	Luana Borba				luanab@gmail.com
	8	Daniele Santana			danisantana@gmail.com
	9	Luis Henrique Garcia	lhgarcia@gmail.com */
			
	SELECT * from tb_alunos WHERE nome_aluno LIKE 'M%';  -- filtra registros presentes na tabela que tem palavras (no campo nome_aluno) que começam com a letra 'M' 
	/* Retorna:
	2	Mariana Fernandes	marifernandes@gmail.com
	4	Marcos Góes			marcosgoes@gmail.com  */
        
	SELECT * from tb_alunos WHERE nome_aluno LIKE '%M%'; -- filtra registros presentes na tabela que tem palavras (no campo nome_aluno) que contêm a letra 'M' 
	/* Retorna:
	2	Mariana Fernandes	marifernandes@gmail.com
	3	Cátia Marcondes		catiamarcondes@gmail.com
	4	Marcos Góes			marcosgoes@gmail.com
	5	Sônia de Morais		sonia_morais@gmail.com
	10	Heloísa Bormann		hbormann@gmail.com */     