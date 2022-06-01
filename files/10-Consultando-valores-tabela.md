> **Consultando valores de uma tabela (comando SELECT)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**SELECT**  
- Utilizado para realizar consultas a valores inseridos em uma tabela ou mais tabelas do banco de dados.  
- Tal consulta pode ser refinada se for utilizada em conjunto com outras cláusulas e operadores, adiante listados.
- Deve ser utilizado em conjunto com a cláusula FROM.
&nbsp;
     
&nbsp;  
**1. A tabela de exemplo:**  
```mysql
CREATE TABLE tb_aluno(
    idAluno int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nomeAluno varchar(50) NOT NULL,
    emailAluno varchar(40) NOT NULL
);

INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(default, 'Luana Borba', 'luanab@email.com'),
(default, 'Mariana Fernandes', 'marifernandes@email.com'),
(default, 'Cátia Marcondes', 'catiamarcondes@email.com'),
(default, 'Marcos Góes', 'marcosgoes@email.com'),
(default, 'Sônia de Morais', 'sonia_morais@email.com');
```
&nbsp;

&nbsp;
**2.1. Consultando todos os registros da tabela acima:**  
```mysql
SELECT * FROM tb_aluno;
```
###### Output:  
| ID Aluno | Nome aluno | E-mail   | 
| ------   | -----      | -----    | 
| 1  | Luana Borba | luanab@email.com |
| 2  | Mariana Fernandes | marifernandes@email.com |
| 3  | Cátia Marcondes | catiamarcondes@email.com |
| 4  | Marcos Góes | marcosgoes@email.com |
| 5  | Sônia de Morais | sonia_morais@email.com |

&nbsp;
&nbsp;  
**2.2. Consultando registros de apenas uma coluna desta tabela:**  
```mysql
SELECT nomeAluno FROM tb_aluno;
```	
###### Output:  
| Nome aluno |
| ------     |
| Luana Borba | 
| Mariana Fernandes |
| Cátia Marcondes |
| Marcos Góes |
| Sônia de Morais |

&nbsp;
&nbsp;  
**2.3. Consultando registros de duas colunas específicas da tabela:** 
```mysql
SELECT nomeAluno, emailAluno FROM tb_aluno;
```	
###### * Output:  
| Nome aluno | E-mail   | 
| ------   | -----      |
| Luana Borba | luanab@email.com |
| Mariana Fernandes | marifernandes@email.com |
| Cátia Marcondes | catiamarcondes@email.com |
| Marcos Góes | marcosgoes@email.com |
| Sônia de Morais | sonia_morais@email.com |

&nbsp;

&nbsp;  
**3. Utilizando a cláusula ORDER BY:**  
Apresenta os valores consultados em ordem sequencial crescente ou decrescente, bastando acrescentar ASC ou DESC.
```mysql
SELECT nomeAluno FROM tb_aluno ORDER BY nomeAluno DESC;
```
###### * Output:  	
| Nome aluno | 
| ------     | 
| Sônia de Morais |
| Mariana Fernandes |
| Marcos Góes |
| Luana Borba |
| Cátia Marcondes |

&nbsp;
&nbsp;  
Por default, a ordenação é em ordem crescente; portanto o uso de ASC é opcional.
```mysql
SELECT * FROM tb_aluno ORDER BY nomeAluno; 
```
###### * Output:  
| ID Aluno | Nome aluno | E-mail   | 
| ------   | -----      | -----    | 
| 3  | Cátia Marcondes | catiamarcondes@email.com |
| 1  | Luana Borba | luanab@email.com |
| 4  | Marcos Góes | marcosgoes@email.com |
| 2  | Mariana Fernandes | marifernandes@email.com |
| 5  | Sônia de Morais | sonia_morais@email.com |

&nbsp;

&nbsp;  
**4. Utilizando a cláusula WHERE:**  
Ao incluir esta cláusula, apenas os registros que obedecerem às condições ali especificadas serão retornados.
```mysql
SELECT nomeAluno FROM tb_aluno WHERE idAluno = '5';
```
###### * Output:  
| Sônia de Morais |
| ------          |

&nbsp;
&nbsp;  
```mysql
SELECT nomeAluno FROM tb_aluno WHERE idAluno <= '3' ORDER BY nomeAluno DESC;
```
###### * Output:  
| Nome aluno | 
| ------     | 
| Mariana Fernandes |
| Luana Borba |
| Cátia Marcondes |

&nbsp;

&nbsp;        
**5. Utilizando o Operador LIKE:**  
No exemplo abaixo: filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que terminam com a letra 'A' .
```mysql
SELECT * from tb_aluno WHERE nomeAluno LIKE '%A';
```
###### * Output:  	
| ID Aluno | Nome aluno | E-mail   | 
| ------   | -----      | -----    | 
| 1 |Luana Borba |luanab@email.com |

&nbsp;
&nbsp;   
No exemplo abaixo: filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que começam com a letra 'M' 
```mysql
SELECT * from tb_aluno WHERE nomeAluno LIKE 'M%';  
```
###### * Output:  	
| ID Aluno | Nome aluno | E-mail   | 
| ------   | -----      | -----    | 
| 2 |Mariana Fernandes |marifernandes@email.com |
| 4 |Marcos Góes |marcosgoes@email.com |

&nbsp;
&nbsp;   
No exemplo abaixo: filtra registros presentes na tabela que tem palavras (no campo nomeAluno) que contêm a letra 'M' 
```mysql
SELECT * from tb_aluno WHERE nomeAluno LIKE '%M%'; 
```
###### * Output:  	
| ID Aluno | Nome aluno | E-mail   | 
| ------   | -----      | -----    | 
| 2 |Mariana Fernandes | marifernandes@email.com |
| 3 |Cátia Marcondes | catiamarcondes@email.com |
| 4 |Marcos Góes | marcosgoes@email.com |