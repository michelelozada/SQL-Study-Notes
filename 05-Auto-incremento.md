> **Auto-incremento**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**AUTO_INCREMENT**  
- Propicia que um número único seja gerado assim que um novo registro é inserido numa tabela.  
- O valor incial padrão começa em 1, sendo que o incremento ocorre de 1 em 1 (porém o valor inicial pode ser alterado, conforme explicado abaixo).  
- Apenas um campo da tabela pode ser auto-incrementado, sendo que ele necessariamente deve vir acompanhado da constraint NOT NULL.  
&nbsp;
     
&nbsp;
**1. Utilizando o AUTO_INCREMENT:**  
```
CREATE DATABASE db_escola;
USE db_escola;
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nomeAluno varchar(50) NOT NULL,
	emailAluno varchar(40) NOT NULL
);

INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(default, 'Luana Borba', 'luanab@email.com'),
(default, 'Mariana Fernandes', 'marifernandes@email.com'),
(default, 'Cátia Marcondes', 'catiamarcondes@email.com'),
(default, 'Marcos Góes', 'marcosgoes@email.com'),
(default, 'Sônia de Morais', 'sonia_morais@email.com'),
(default, 'Andréa Santos', 'asantos@email.com'),
(default, 'Silvio Soares', 'ssoares@email.com'),
(default, 'Daniele Santana', 'danisantana@email.com'),
(default, 'Luis Garcia', 'lgarcia@email.com'),
(default, 'Heloísa Bormann', 'hbormann@email.com');
```
###### Output:  
| ID Aluno | Nome aluno | E-mail aluno |
| ------   | -----      | -----        |
| 1 |	Luana Borba | luanab@email.com |
| 2 |	Mariana Fernandes | marifernandes@email.com |
| 3 | Cátia Marcondes | catiamarcondes@email.com |
| 4 |	Marcos Góes | marcosgoes@email.com |
| 5 | Sônia de Morais | sonia_morais@email.com |
| 6 | Andréa Santos|  asantos@email.com |
| 7 | Silvio Soares | ssoares@email.com |
| 8 | Daniele Santana | danisantana@email.com |
| 9 | Luis Garcia | lgarcia@email.com |
| 10| Heloísa Bormann | hbormann@email.com |

&nbsp;
     
&nbsp;
**2. Caso haja a necessidade de setar o valor default do AUTO_INCREMENT para começar com um valor diferente:**  
```
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nomeAluno varchar(50) NOT NULL,
	emailAluno varchar(40) NOT NULL
) AUTO_INCREMENT = 100;
```
###### Output:  
| ID Aluno | Nome aluno | E-mail aluno |
| ------   | -----      | -----        |
| 100 | Luana Borba | luanab@email.com |
| 101	| Mariana Fernandes | marifernandes@email.com |
| 102	| Cátia Marcondes | catiamarcondes@email.com |
| 103	| Marcos Góes | marcosgoes@email.com |
| 104	| Sônia de Morais | sonia_morais@email.com |
| 105	| Andréa Santos | asantos@email.com |
| 106	| Silvio Soares | ssoares@email.com |
| 107	| Daniele Santana | danisantana@email.com |
| 108	| Luis Garcia | lgarcia@email.com |
| 109	| Heloísa Bormann | hbormann@email.com |

&nbsp;
     
&nbsp;
**3. Após a tabela já ter sido criada, caso seja necessário que a próxima sequência de registros na tabela comece com um valor de incremento diferente:**  
```
ALTER TABLE tb_Aluno AUTO_INCREMENT = 200;

INSERT INTO tb_aluno(idAluno,nomeAluno,emailAluno) 
VALUES 
(default, 'Marianne Marques', 'marim@email.com'),
(default, 'Renato Passos', 'rpassos@email.com'),
(default, 'Frederico Fernandes', 'fredfernandes@email.com'),
(default, 'Marcela Guedes', 'mar_guedes@email.com'),
(default, 'Lúcia Freitas', 'luciafreitas@email.com');
```
###### Output:  
| ID Aluno | Nome aluno | E-mail aluno |
| ------   | -----      | -----        |
| 100 |	Luana Borba | luanab@email.com
| 101 |	Mariana Fernandes | marifernandes@email.com |
| 102 |	Cátia Marcondes | catiamarcondes@email.com |
| 103 | Marcos Góes | marcosgoes@email.com |
| 104 | Sônia de Morais | sonia_morais@email.com |
| 105 | Andréa Santos | asantos@email.com |
| 106 | Silvio Soares | ssoares@email.com |
| 107 | Daniele Santana | danisantana@email.com |
| 108 | Luis Garcia | lgarcia@email.com |
| 109 | Heloísa Bormann | hbormann@email.com |
| 200 | Marianne Marques | marim@email.com |
| 201 | Renato Passos | rpassos@email.com |
| 202 | Frederico Fernandes | fredfernandes@email.com |
| 203 | Marcela Guedes | mar_guedes@email.com |
| 204 | Lúcia Freitas | luciafreitas@email.com |

&nbsp;
     
&nbsp;
**4. Para verificação do último valor inserido no campo que utilizou o AUTO_INCREMENT:**  
```
SELECT MAX(idAluno) FROM tb_Aluno;
```
###### Output:  
O exemplo acima retornou 204