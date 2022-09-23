> **Criando banco de dados e tabelas (comando CREATE)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
**CREATE**  
* Comando para a criação de objetos: banco de dados e tabelas.
* A inclusão da cláusula `IF NOT EXISTS` é opcional.
&nbsp;
     
&nbsp;    
**1. Criando um banco de dados:**
```mysql
CREATE DATABASE IF NOT EXISTS db_escola;
```
&nbsp;
&nbsp;    
**2. Criando uma tabela:**
```mysql
CREATE TABLE IF NOT EXISTS tb_aluno(
	idAluno int(11) AUTO_INCREMENT NOT NULL,
	nomeAluno varchar(50) NOT NULL,
	emailAluno varchar(40), 
	PRIMARY KEY (idAluno)
);
```
&nbsp;
     
&nbsp;   
**OUTROS COMANDOS ÚTEIS**  
Seguem abaixo alguns comandos úteis relacionados à criação da base de dados e das tabelas:  
&nbsp;
     
&nbsp;   
**1. Comando USE**  
Após ter sido criado, é imprescindível indicar ao servidor qual banco de dados será utilizado:    
```mysql
USE db_escola;
```
&nbsp;
&nbsp;  
**2. Comando SHOW**  
2.1. Lista quais as bases de dados existentes no servidor:        
```mysql
SHOW DATABASES;
```
###### >> Output:  
| Database  |
| :---      |
| db_escola | 

&nbsp;
&nbsp;  
2.2 Exibe todas as tabelas existentes na base de dados em uso:     
```mysql
SHOW TABLES;
```
###### >> Output:  
| Tables_in_db_escola  |
| :---    		       |
| tb_aluno             | 

&nbsp;
&nbsp;  
**3. Comando SELECT DATABASE**  
Informa qual a base de dados está em uso no momento:    
```mysql
SELECT DATABASE();
```
###### >> Output:  
| DATABASE()  |
| :---        |
| db_escola   | 

&nbsp;
&nbsp;  
**4. Comando DESCRIBE**  
Apresenta a estrutura da tabela especificada com seus campos, tipo de dados e demais características: 
```mysql
DESCRIBE tb_aluno;
```
###### >> Output:  
| Field       | Type        | Null | Key  | Default | Extra          |
| :---        | :--         | :--- | :--- | :---    | :---           |
| idAluno	  | int(11)	    | NO   | PRI  | NULL    | auto_increment |	
| nomeAluno   | varchar(50) | NO   |      | NULL    |			     |
| emailAluno  | varchar(40) | YES  |	  | NULL    |		         |