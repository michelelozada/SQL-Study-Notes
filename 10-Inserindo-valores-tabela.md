> Inserindo valores em uma tabela (comando INSERT)  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**INSERT**  
- Utilizado para inserir novo(s) registro(s) de dados em uma tabela já existente.  
- Deve ser utilizado em conjunto com a cláusula INTO e a CLÁUSULA VALUE.  
&nbsp;
     
&nbsp;
**A tabela de exemplo:**  
```
CREATE TABLE tb_aluno(
    idAluno int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeAluno varchar(40),
    foneAluno varchar(15),
    emailAluno varchar(50)
);
```
&nbsp;
     
&nbsp;
**1. Utilizando o comando INSERT para inclusão de apenas um registro:**  
```
INSERT INTO tb_aluno(idAluno,nomeAluno,foneAluno,emailAluno) 
VALUES 
(default, 'Lorenzo Martins', '4199956-xx88','lorenzomartins@gmail.com');
```
&nbsp;
     
&nbsp;
**2. Para inclusão de mais registros:**  
```
INSERT INTO tb_aluno(idAluno,nomeAluno,foneAluno,emailAluno) 
VALUES 
(default, 'Luana Borba','4199956-xx56', 'luanab@email.com'),
(default, 'Mariana Fernandes','4199652-xx25', 'marifernandes@email.com'),
(default, 'Henrique Bormann','4199987-xx45', 'hbormann@email.com');
```
###### Output:  
| ID Aluno | Nome aluno | Telefone   | E-mail       |
| ------   | -----      | -----      | -----        |
| 1	| Lorenzo Martins   | 4199956-xx88  | lorenzomartins@gmail.com |
| 2	| Luana Borba	    | 4199956-xx56	| luanab@email.com |
| 3	| Mariana Fernandes	| 4199652-xx25	| marifernandes@email.com | 
| 4	| Henrique Bormann	| 4199987-xx45	| hbormann@email.com |
