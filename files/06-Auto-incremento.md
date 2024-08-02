> **Auto-incremento**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Auto-incremento
```
- Propicia que um número único seja gerado assim que um novo registro é inserido numa tabela  

- O valor inicial padrão começa em 1, sendo que o incremento ocorre de 1 em 1 (porém o valor 
inicial pode ser alterado, conforme explicado abaixo)  

- Apenas um campo da tabela pode ser auto-incrementado, sendo que ele necessariamente deve vir
acompanhado da constraint NOT NULL  
```

&nbsp;
     
## Utilizando o AUTO_INCREMENT

```mysql

CREATE DATABASE db_escola;
USE db_escola;
CREATE TABLE tb_aluno(
  idAluno INT(11) AUTO_INCREMENT NOT NULL,
  nomeAluno VARCHAR(50) NOT NULL,
  emailAluno VARCHAR(40) NOT NULL,
  PRIMARY KEY(idAluno)
);

INSERT INTO tb_aluno(nomeAluno,emailAluno) 
VALUES 
  ('Luana Borba', 'luanab@email.com'),
  ('Mariana Fernandes', 'marifernandes@email.com'),
  ('Cátia Marcondes', 'catiamarcondes@email.com'),
  ('Marcos Góes', 'marcosgoes@email.com'),
  ('Sônia de Morais', 'sonia_morais@email.com'),
  ('Andréa Santos', 'asantos@email.com'),
  ('Silvio Soares', 'ssoares@email.com'),
  ('Daniele Santana', 'danisantana@email.com'),
  ('Luis Garcia', 'lgarcia@email.com'),
  ('Heloísa Bormann', 'hbormann@email.com');
```

↳ Saída gerada:  
```
+-----+--------------------+--------------------------+
| ID  | Aluno  Nome aluno  |       E-mail aluno       |
+-----+--------------------+--------------------------+
|  1  | Luana Borba        | luanab@email.com         |
|  2  | Mariana Fernandes  | marifernandes@email.com  |
|  3  | Cátia Marcondes    | catiamarcondes@email.com |
|  4  | Marcos Góes        | marcosgoes@email.com     |
|  5  | Sônia de Morais    | sonia_morais@email.com   |
|  6  | Andréa Santos      | asantos@email.com        |
|  7  | Silvio Soares      | ssoares@email.com        |
|  8  | Daniele Santana    | danisantana@email.com    |
|  9  | Luis Garcia        | lgarcia@email.com        |
| 10  | Heloísa Bormann    | hbormann@email.com       |
+-----+--------------------+--------------------------+
```

&nbsp;
     
Caso haja a necessidade de setar o valor default do AUTO_INCREMENT para começar com um valor diferente:
```mysql

CREATE TABLE tb_aluno(
  idAluno INT(11) AUTO_INCREMENT NOT NULL,
  nomeAluno VARCHAR(50) NOT NULL,
  emailAluno VARCHAR(40) NOT NULL,
  PRIMARY KEY(idAluno)
) AUTO_INCREMENT = 100;
```

↳ Saída gerada:  
```
+----------+--------------------+--------------------------+
| ID Aluno |    Nome aluno      |       E-mail aluno       |
+----------+--------------------+--------------------------+
|     100  | Luana Borba        | luanab@email.com         |
|     101  | Mariana Fernandes  | marifernandes@email.com  |
|     102  | Cátia Marcondes    | catiamarcondes@email.com |
|     103  | Marcos Góes        | marcosgoes@email.com     |
|     104  | Sônia de Morais    | sonia_morais@email.com   |
|     105  | Andréa Santos      | asantos@email.com        |
|     106  | Silvio Soares      | ssoares@email.com        |
|     107  | Daniele Santana    | danisantana@email.com    |
|     108  | Luis Garcia        | lgarcia@email.com        |
|     109  | Heloísa Bormann    | hbormann@email.com       |
+----------+--------------------+--------------------------+
```

&nbsp;
     
Após a tabela já ter sido criada, caso seja necessário que a próxima sequência de registros na tabela comece com um valor de incremento diferente:
```mysql

ALTER TABLE tb_Aluno AUTO_INCREMENT = 200;

INSERT INTO tb_aluno(nomeAluno,emailAluno) 
VALUES ('Marianne Marques', 'marim@email.com'),
       ('Renato Passos', 'rpassos@email.com'),
       ('Frederico Fernandes', 'fredfernandes@email.com'),
       ('Marcela Guedes', 'mar_guedes@email.com'),
       ('Lúcia Freitas', 'luciafreitas@email.com');
```

↳ Saída gerada:  
```
+----------+----------------------+--------------------------+
| ID Aluno |      Nome aluno      |       E-mail aluno       |
+----------+----------------------+--------------------------+
|     100  | Luana Borba          | luanab@email.com         |
|     101  | Mariana Fernandes    | marifernandes@email.com  |
|     102  | Cátia Marcondes      | catiamarcondes@email.com |
|     103  | Marcos Góes          | marcosgoes@email.com     |
|     104  | Sônia de Morais      | sonia_morais@email.com   |
|     105  | Andréa Santos        | asantos@email.com        |
|     106  | Silvio Soares        | ssoares@email.com        |
|     107  | Daniele Santana      | danisantana@email.com    |
|     108  | Luis Garcia          | lgarcia@email.com        |
|     109  | Heloísa Bormann      | hbormann@email.com       |
|     200  | Marianne Marques     | marim@email.com          |
|     201  | Renato Passos        | rpassos@email.com        |
|     202  | Frederico Fernandes  | fredfernandes@email.com  |
|     203  | Marcela Guedes       | mar_guedes@email.com     |
|     204  | Lúcia Freitas        | luciafreitas@email.com   |
+----------+----------------------+--------------------------+
```

&nbsp;
     
Para verificação do último valor inserido no campo que utilizou o `AUTO_INCREMENT`
```mysql

SELECT MAX(idAluno) 
FROM tb_Aluno;
```

↳ Saída gerada:  
204

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>