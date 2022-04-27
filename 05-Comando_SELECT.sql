/*
 *  Comando SELECT (com suas cláusulas e operadores)
 *  Repositório: Banco de Dados MySQL - Fundamentos 
 *  GitHub: @michelelozada
 */
    
    
-- 1.- Criação da tabela de exemplo:
	CREATE DATABASE db_escola;
	USE db_escola;
	CREATE TABLE tb_aluno(
	idAluno int(11) not null,
	nomeAluno varchar(50) not null,
	emailAluno varchar(40) not null
	);
    
	INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
	VALUES 
	(01, 'Luana Borba', 'luanab@gmail.com'),
	(02, 'Mariana Fernandes', 'marifernandes@gmail.com'),
	(03, 'Cátia Marcondes', 'catiamarcondes@gmail.com'),
	(04, 'Marcos Góes', 'marcosgoes@gmail.com'),
	(05, 'Sônia de Morais', 'sonia_morais@gmail.com'),
	(06, 'Andréa Santos', 'asantos@gmail.com'),
	(07, 'Silvio Soares', 'ssoares@gmail.com'),
	(08, 'Daniele Santana', 'danisantana@gmail.com'),
	(09, 'Luis Garcia', 'lgarcia@gmail.com'),
	(10, 'Heloísa Bormann', 'hbormann@gmail.com');
    
	SELECT * FROM tb_aluno;
	/* Retorna:
	1 |Luana Borba |luanab@gmail.com
	2 |Mariana Fernandes |marifernandes@gmail.com
	3 |Cátia Marcondes |catiamarcondes@gmail.com
	4 |Marcos Góes |marcosgoes@gmail.com
	5 |Sônia de Morais |sonia_morais@gmail.com
	6 |Andréa Santos |asantos@gmail.com
	7 |Silvio Soares |ssoares@gmail.com
	8 |Daniele Santana |danisantana@gmail.com
	9 |Luis Garcia |lgarcia@gmail.com
	10 |Heloísa Bormann |hbormann@gmail.com  */
    
	
-- 2 - A Cláusula ORDER BY:
	SELECT * FROM tb_aluno ORDER BY nomeAluno; -- ordenação default é em ordem crescente
	/* Retorna:
	6 |Andréa Santos |asantos@gmail.com
	3 |Cátia Marcondes |catiamarcondes@gmail.com
	8 |Daniele Santana |danisantana@gmail.com
	10 |Heloísa Bormann |hbormann@gmail.com
	1 |Luana Borba |luanab@gmail.com
	9 |Luis Garcia	|lgarcia@gmail.com
	4 |Marcos Góes |marcosgoes@gmail.com
	2 |Mariana Fernandes |marifernandes@gmail.com
	7 |Silvio Soares |ssoares@gmail.com
	5 |Sônia de Morais |sonia_morais@gmail.com */
		
	SELECT nomeAluno FROM tb_aluno ORDER BY nomeAluno desc;
	/* Retorna:
	Sônia de Morais
	Silvio Soares
	Mariana Fernandes
	Marcos Góes
	Luis Garcia
	Luana Borba
	Heloísa Bormann
	Daniele Santana
	Cátia Marcondes
	Andréa Santos */


-- 3. A Cláusula WHERE:
	SELECT nomeAluno FROM tb_aluno WHERE idAluno = '5';
	/* Retorna:
	Sônia de Morais */
        
	SELECT nomeAluno FROM tb_aluno WHERE idAluno >= '5' ORDER BY nomeAluno;
	/* Retorna:
	Andréa Santos
	Daniele Santana
	Heloísa Bormann
	Luis Garcia
	Silvio Soares
	Sônia de Morais */
        
        
-- 4. O Operador LIKE:
	SELECT * from tb_aluno WHERE nomeAluno LIKE '%A'; -- filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que terminam com a letra 'A' 
	/* Retorna:
	1 |Luana Borba	|luanab@gmail.com
	8 |Daniele Santana |danisantana@gmail.com
	9 |Luis Garcia	|lgarcia@gmail.com */
			
	SELECT * from tb_aluno WHERE nomeAluno LIKE 'M%';  -- filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que começam com a letra 'M' 
	/* Retorna:
	2 |Mariana Fernandes |marifernandes@gmail.com
	4 |Marcos Góes |marcosgoes@gmail.com  */
         
	SELECT * from tb_aluno WHERE nomeAluno LIKE '%M%'; -- filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que contêm a letra 'M' 
	/* Retorna:
	2 |Mariana Fernandes |marifernandes@gmail.com
	3 |Cátia Marcondes	|catiamarcondes@gmail.com
	4 |Marcos Góes	|marcosgoes@gmail.com
	5 |Sônia de Morais |sonia_morais@gmail.com
	10 |Heloísa Bormann |hbormann@gmail.com */     