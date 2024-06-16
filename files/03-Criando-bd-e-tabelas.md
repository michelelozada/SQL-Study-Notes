> **Criando banco de dados e tabelas (comando CREATE)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
## Comando CREATE
```
- Comando para a criação de objetos: banco de dados e tabelas

- A inclusão da cláusula `IF NOT EXISTS` é opcional  
```

&nbsp;
    
> Criando um banco de dados:
```mysql

CREATE DATABASE IF NOT EXISTS db_escola;
```

&nbsp; 

> Criando uma tabela:
```mysql

CREATE TABLE IF NOT EXISTS tb_aluno(
  idAluno int(11) AUTO_INCREMENT NOT NULL,
  nomeAluno varchar(50) NOT NULL,
  emailAluno varchar(40), 
  PRIMARY KEY (idAluno)
);
```

&nbsp;
     
## Outros comandos úteis
Seguem abaixo alguns comandos úteis relacionados à criação da base de dados e das tabelas:  
     
&nbsp;   

### • Comando USE  
Após ter sido criado, é imprescindível indicar ao servidor qual banco de dados será utilizado    

```mysql

USE db_escola;
```

&nbsp;
     
### • Comando SHOW  

> Listando quais as bases de dados existentes no servidor:        
```mysql

SHOW DATABASES;
```

Saída gerada: 
```
+-----------+
| Database  |
+-----------+
| db_escola |
+-----------+
```

&nbsp;
 
> Exibindo todas as tabelas existentes na base de dados em uso:     
```mysql

SHOW TABLES;
```

Saída gerada: 
```
+---------------------+
| Tables_in_db_escola |
+---------------------+
| tb_aluno            |
+---------------------+
```

&nbsp;
     
### • Comando SELECT DATABASE  
Informa qual a base de dados está em uso no momento

```mysql

SELECT DATABASE();
```

Saída gerada:  
```
+------------+
| DATABASE() |
+------------+
| db_escola  |
+------------+
```

&nbsp;
     
### • Comando DESCRIBE  
Apresenta a estrutura da tabela especificada com seus campos, tipo de dados e demais características 

```mysql

DESCRIBE tb_aluno;
```

Saída gerada: 
```
+------------+--------------+------+-----+---------+----------------+
|   Field    |     Type     | Null | Key | Default |     Extra      |
+------------+--------------+------+-----+---------+----------------+
| idAluno    | int(11)      | NO   | PRI | NULL    | auto_increment |
| nomeAluno  | varchar(50)  | NO   |     | NULL    |                |
| emailAluno | varchar(40)  | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+
```

&nbsp;    

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>