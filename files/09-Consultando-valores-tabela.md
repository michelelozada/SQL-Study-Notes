> **Consultando valores de uma tabela (comando SELECT e suas principais cláusulas)**     
> Repositório: Banco de Dados SQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Comando SELECT
```
- Utilizado para realizar consultas a valores inseridos em uma tabela ou mais tabelas do banco 
de dados.  

- Tal consulta pode ser refinada se for utilizada em conjunto com outras cláusulas e operadores,
adiante listados.

- Deve ser utilizado em conjunto com a cláusula `FROM`.
```
     
&nbsp;  

Criando a tabela a ser utilizada para os exemplos abaixo:
```mysql

CREATE TABLE tb_aluno(
  idAluno INT(11) NOT NULL AUTO_INCREMENT,
  nomeAluno VARCHAR(50) NOT NULL,
  emailAluno VARCHAR(40) NOT NULL,
  PRIMARY KEY(idAluno)
);

INSERT INTO tb_aluno(nomeAluno,emailAluno) 
VALUES ('Luana Borba', 'luanab@email.com'),
       ('Mariana Fernandes', 'marifernandes@email.com'),
       ('Cátia Marcondes', 'catiamarcondes@email.com'),
       ('Marcos Góes', 'marcosgoes@email.com'),
       ('Sônia de Morais', 'sonia_morais@email.com'),
       ('Enzo Freitas', 'efreitas@email.com'),
       ('Rodrigo Mattos', 'rodrigo.mattos@email.com'),
       ('Paula Souza', 'paula_souza@email.com');
```

&nbsp;   

### • Consultando todos os registros de uma tabela

```mysql

SELECT * 
FROM tb_aluno;
```

↳ Saída gerada: 
```
+----------+--------------------+--------------------------+
| ID Aluno |     Nome aluno     |          E-mail          |
+----------+--------------------+--------------------------+
|        1 | Luana Borba        | luanab@email.com         |
|        2 | Mariana Fernandes  | marifernandes@email.com  |
|        3 | Cátia Marcondes    | catiamarcondes@email.com |
|        4 | Marcos Góes        | marcosgoes@email.com     |
|        5 | Sônia de Morais    | sonia_morais@email.com   |
|        6 | Enzo Freitas       | efreitas@email.com       |
|        7 | Rodrigo Mattos     | rodrigo.mattos@email.com |
|        8 | Paula Souza        | paula_souza@email.com    |
+----------+--------------------+--------------------------+
```

&nbsp;
  
Consultando registros de apenas uma coluna desta tabela:
```mysql

SELECT nomeAluno 
FROM tb_aluno;
```	

↳  Saída gerada: 
```
+-------------------+
|    Nome aluno     |
+-------------------+
| Luana Borba       |
| Mariana Fernandes |
| Cátia Marcondes   |
| Marcos Góes       |
| Sônia de Morais   |
+-------------------+
```

&nbsp;
  
Consultando registros de duas colunas específicas da tabela:
```mysql

SELECT nomeAluno, emailAluno 
FROM tb_aluno;
```	

↳ Saída gerada: 
```
+-------------------+--------------------------+
|    Nome aluno     |          E-mail          |
+-------------------+--------------------------+
| Luana Borba       | luanab@email.com         |
| Mariana Fernandes | marifernandes@email.com  |
| Cátia Marcondes   | catiamarcondes@email.com |
| Marcos Góes       | marcosgoes@email.com     |
| Sônia de Morais   | sonia_morais@email.com   |
| Enzo Freitas      | efreitas@email.com       |
| Rodrigo Mattos    | rodrigo.mattos@email.com |
| Paula Souza       | paula_souza@email.com    |
+-------------------+--------------------------+
```

&nbsp;

### • Utilizando a cláusula ORDER BY
Apresenta os valores consultados em ordem sequencial crescente ou decrescente, bastando acrescentar `ASC` ou `DESC`.  
(Obs: É possível utilizar mais de um critério de ordenação, basta acrescentar uma vírgula e adicionar o respetivo campo).  

```mysql

SELECT nomeAluno 
FROM tb_aluno 
ORDER BY nomeAluno DESC;
```

↳ Saída gerada: 
```
+-------------------+
|    Nome aluno     |
+-------------------+
| Sônia de Morais   |
| Rodrigo Mattos    |
| Paula Souza       |
| Mariana Fernandes |
| Marcos Góes       |
| Luana Borba       |
| Enzo Freitas      |
| Cátia Marcondes   |
+-------------------+
```

&nbsp;

Por default, a ordenação é em ordem crescente; portanto o uso de `ASC` é opcional.
```mysql

SELECT nomeAluno 
FROM tb_aluno 
ORDER BY nomeAluno;
```

↳ Saída gerada: 
```
+-------------------+
|    Nome aluno     |
+-------------------+
| Cátia Marcondes   |
| Enzo Freitas      |
| Luana Borba       |
| Marcos Góes       |
| Mariana Fernandes |
| Paula Souza       |
| Rodrigo Mattos    |
| Sônia de Morais   |
+-------------------+
```

&nbsp;

### • Utilizando a cláusula WHERE
Ao incluir esta cláusula, apenas os registros que obedecerem às condições ali especificadas serão retornados.

```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE idAluno = 5;
```

↳ Saída gerada: 
```
+----------+-----------------+
| ID Aluno |   Nome aluno    |
+----------+-----------------+
|        5 | Sônia de Morais |
+----------+-----------------+
```

&nbsp;
  
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE idAluno <= 3 
ORDER BY nomeAluno DESC;
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|       2  | Mariana Fernandes |
|       1  | Luana Borba       |
|       3  | Cátia Marcondes   |
+----------+-------------------+
```
&nbsp;

```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE NOT idAluno > 4;
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|        1 | Luana Borba       |
|        2 | Mariana Fernandes |
|        3 | Cátia Marcondes   |
|        4 | Marcos Góes       |
+----------+-------------------+
```

&nbsp;

```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE (idAluno = 8 AND nomeAluno = "Paulinha") OR (idAluno = 7 AND nomeAluno = "Rodrigo Mattos");
```

↳ Saída gerada: 
```
+----------+----------------+
| ID Aluno |   Nome aluno   |
+----------+----------------+
|        7 | Rodrigo Mattos |
+----------+----------------+
```

&nbsp;

**Observações:**
&nbsp;&nbsp; ◦ Operadores que podem ser utilizados para montar as condições de WHERE: `=`, `!=` ou`<>`, `>`,`<`, `>=`,`<=`  
&nbsp;&nbsp; ◦ Para números float (devido a não-precisão), as operações de igualdade ou diferença não funcionam - nestes casos, deve-se usar a cláusula `BETWEEN`  
&nbsp;&nbsp; ◦ Os operadores acima podem se utilizados com strings também: `SELECT * FROM tb_aluno WHERE nomeAluno >= 'Mariana Fernandes';`  
&nbsp;

### • Utilizando a cláusula LIMIT
Ao incluir esta cláusula, o número de registros retornados obedecerá ao número ali especificado.

```mysql

SELECT nomeAluno   
FROM tb_aluno 
WHERE sexoAluno = 'F';
ORDER BY nomeAluno   
LIMIT 3;
```

↳ Saída gerada: 
```
+-------------------+
|    Nome aluno     |
+-------------------+
| Cátia Marcondes   |
| Luana Borba       |
| Mariana Fernandes |
+-------------------+
```

&nbsp;

### • Utilizando o Operador LIKE
Ao incluir esta cláusula, junto ao coringa `%`, são realizadas comparações de letras ou palavras de uma string.  

No exemplo abaixo: retorno dos registros presentes na tabela, cujas strings (do campo nomeAluno) terminam com a letra 'A'.
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno LIKE '%A';
```

↳ Saída gerada: 
```
+----------+-------------+
| ID Aluno | Nome aluno  |
+----------+-------------+
|        1 | Luana Borba |
|        8 | Paula Souza |
+----------+-------------+
```

&nbsp;

No exemplo abaixo: retorna registros presentes na tabela, cujas strings (do campo nomeAluno) começa, com a letra 'M'. 
```mysql

SELECT idAluno, nomeAluno 
FROM b_aluno 
WHERE nomeAluno LIKE 'M%';  
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|       2  | Mariana Fernandes |
|       4  | Marcos Góes       |
+----------+-------------------+
```
&nbsp;
  
No exemplo abaixo: retorna registros presentes na tabela, cujas strings (do campo nomeAluno) contêm a letra 'M'. 
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno LIKE '%M%'; 
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|       2  | Mariana Fernandes |
|       3  | Cátia Marcondes   |
|       4  | Marcos Góes       |
|       5  | Sonia Morais      |
|       7  | Rodrigo Mattos    |
+----------+-------------------+
```

&nbsp;
  
No exemplo abaixo: retorna registros presentes na tabela, cuja terceira letra da string (do campo nomeAluno) é a letra 'r'.
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno LIKE '__R%'; 
```

↳ Saída gerada: 	
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|        2 | Mariana Fernandes |
|        4 | Marcos Góes       |
+----------+-------------------+
```

&nbsp;
   
No exemplo abaixo: retorna registros presentes na tabela, cuja string (do campo nomeAluno) termina com 'ndes'. 
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno LIKE '%NDES'; 
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|       2  | Mariana Fernandes |
|       3  | Cátia Marcondes   |
+----------+-------------------+
```

&nbsp;
   
No exemplo abaixo: retorna registros presentes na tabela, cuja string (do campo nomeAluno) começa com 'm' e termina com 's'. 
```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno LIKE 'm%s'; 
```

↳ Saída gerada: 
```
+----------+-------------------+
| ID Aluno |    Nome aluno     |
+----------+-------------------+
|        2 | Mariana Fernandes |
|        4 | Marcos Góes       |
+----------+-------------------+
```

&nbsp;

### •  Utilizando o Operador NOT LIKE
No exemplo abaixo: retorna registros presentes na tabela, cujas strings (do campo nomeAluno) **não** contêm a letra 'R'. 

```mysql

SELECT idAluno, nomeAluno 
FROM tb_aluno 
WHERE nomeAluno NOT LIKE '%R%'; 
```

↳ Saída gerada: 
```
+----------+-------------+
| ID Aluno | Nome aluno  |
+----------+-------------+
|        8 | Paula Souza |
+----------+-------------+
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/SQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>