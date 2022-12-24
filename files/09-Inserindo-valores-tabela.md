> **Inserindo valores em uma tabela (comando INSERT)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**INSERT**  
- Utilizado para inserir novo(s) registro(s) de dados em uma tabela já existente.  
- Deve ser utilizado em conjunto com a cláusula `INTO` e a cláusula `VALUES`.  
&nbsp;
     
&nbsp;
**A tabela de exemplo:**  
```mysql
CREATE TABLE tb_aluno(
    idAluno int(11) NOT NULL AUTO_INCREMENT,
    nomeAluno varchar(40),
    foneAluno varchar(15),
    emailAluno varchar(50),
    PRIMARY KEY(idAluno)
);
```
&nbsp;
     
&nbsp;
**1. Utilizando o comando INSERT para inclusão de apenas um registro:**  
```mysql
INSERT INTO tb_aluno(idAluno,nomeAluno,foneAluno,emailAluno) 
VALUES (default, 'Lorenzo Martins', '4199956-xx88','lorenzomartins@gmail.com');
```
&nbsp;
&nbsp;    
Uma vez que a coluna id_aluno é `AUTO_INCREMENT`, a query pode também ser escrita da seguinte forma: 
```mysql
INSERT INTO tb_aluno(nomeAluno,foneAluno,emailAluno) 
VALUES ('Lorenzo Martins', '4199956-xx88','lorenzomartins@gmail.com');
```

###### * Output:  
| ID Aluno | Nome aluno         | Telefone      | E-mail                   |
| :---     | :---               | :---          | :---                     |
| 1	       | Lorenzo Martins    | 4199956-xx88  | lorenzomartins@gmail.com |

&nbsp;
     
&nbsp;
**2. Para inclusão de mais registros:**  
```mysql
INSERT INTO tb_aluno(idAluno,nomeAluno,foneAluno,emailAluno) 
VALUES 
	(default, 'Luana Borba','4199956-xx56', 'luanab@email.com'),
	(default, 'Mariana Fernandes','4199652-xx25', 'marifernandes@email.com'),
	(default, 'Henrique Bormann','4199987-xx45', 'hbormann@email.com');
```
&nbsp;
&nbsp;    
Ou alternativamente: 
```mysql
INSERT INTO tb_aluno(nomeAluno,foneAluno,emailAluno) 
VALUES 
	('Luana Borba','4199956-xx56', 'luanab@email.com'),
	('Mariana Fernandes','4199652-xx25', 'marifernandes@email.com'),
	('Henrique Bormann','4199987-xx45', 'hbormann@email.com');
```

###### * Output:  
| ID Aluno | Nome aluno         | Telefone      | E-mail                   |
| :---     | :---               | :---          | :---                     |
| 1	       | Lorenzo Martins    | 4199956-xx88  | lorenzomartins@gmail.com |
| 2	       | Luana Borba	      | 4199956-xx56	| luanab@email.com     |
| 3	       | Mariana Fernandes	| 4199652-xx25	| marifernandes@email.com  | 
| 4	       | Henrique Bormann  	| 4199987-xx45	| hbormann@email.com       |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/Banco-de-Dados-MySQL-Fundamentos">[Voltar à tela inicial do repositório]</a>
</div>