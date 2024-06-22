> **Junção de duas ou mais tabelas (cláusulas LEFT JOIN e RIGHT JOIN)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Cláusulas LEFT OUTER JOIN e RIGHT OUTER JOIN  
```
- As junções (JOINS) permitem que sejam realizadas consultas com informações contidas em duas ou mais tabelas
e através de um único SELECT.  
  
- As ligações acontecem através da relação da chave primária de uma tabela com a(s) chave(s) estantangeira(s)
da(s) outra(s) tabela(s).  
  
- O LEFT OUTER JOIN é um tipo de junção que retorna *todos* os registros da tabela colocada à esquerda da 
junção/termo LEFT JOIN, independentemente dos registros possuírem ou não correspondência com a(s) outra(s) 
tabela(s).   
  
- Já o RIGHT OUTER JOIN é um tipo de junção que retorna *todos* os registros da tabela colocada à direita da
junção/termo RIGHT JOIN, independentemente dos registros possuírem ou não correspondência com a(s) outra(s) 
tabela(s)  
  
- Portanto: tanto no LEFT JOIN quanto no RIGHT JOIN, registros 'excedentes' são exibidos; o que não acontece 
quando é aplicado o INNER JOIN  
  
- Observação: A utilização do termo OUTER é opcional
```
     
&nbsp;  

As tabelas a serem utilizadas para os exemplos abaixo:

&nbsp;  

↳ tb_produto:

```
+-----------+------------------------------+-----------------+---------------------+
| idProduto |         nomeProduto          | marcaProduto_fk | categoriaProduto_fk |
+-----------+------------------------------+-----------------+---------------------+
|         1 | Webcam HD C270               | 2               | 1                   |
|         2 | Mouse Sem Fio WM126 Preto    | 5               | 4                   |
|         3 | Pen Drive 32GB USB 3.0 Prata | 6               | 5                   |
|         4 | Headphone Bluetooth Preto    | 4               | 2                   |
|         5 | Teclado Gamer Warrior TC209  | 3               | 3                   |
|         6 | Mouse Sem Fio USB Preto      | 3               | 4                   |
|         7 | Teclado Slim USB Laser TC193 | 3               | 3                   |
|         8 | Caixa de Som Bluetooth       | 1               | 6                   |
|         9 | Mouse Sem Fio M720 Bluetooth | 2               | 4                   |
|        10 | Headphone Com Fio Preto      | 7               | 2                   |
|        11 | HD Externo 1TB USB 3.0       | NULL            | NULL                |
|        12 | HD Externo 4TB USB Preto     | NULL            | NULL                |
+-----------+------------------------------+-----------------+---------------------+
```

&nbsp; 

↳ tb_categoria:
```
+-------------+-----------------+
| idCategoria |  nomeCategoria  |
+-------------+-----------------+
|           1 | Webcams         |
|           2 | Fones de Ouvido |
|           3 | Teclados        |
|           4 | Mouses          |
|           5 | Pen Drives      |
|           6 | Caixas de Som   |
|           7 | Tablet          |
|           8 | Notebook        |
+-------------+-----------------+
```

&nbsp; 

↳ tb_marca:
```
+---------+------------+
| idMarca | nomeMarca  |
+---------+------------+
|       1 | JBL        |
|       2 | Logitech   |
|       3 | Multilaser |
|       4 | Philco     |
|       5 | Dell       |
|       6 | SanDisk    |
|       7 | Sony       |
+---------+------------+
```

&nbsp;

Aplicando o LEFT JOIN em duas das tabelas acima:
```mysql

SELECT p.nomeProduto As Produto, m.nomeMarca AS Marca
FROM tb_produto AS p
LEFT JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca;
```

↳ Saída gerada: 
```
+------------------------------+------------+
|           Produto            |   Marca    |
+------------------------------+------------+
| Webcam HD C270               | Logitech   |
| Mouse Sem Fio WM126 Preto    | Dell       |
| Pen Drive 32GB USB 3.0 Prata | SanDisk    |
| Headphone Bluetooth Preto    | Philco     |
| Teclado Gamer Warrior TC209  | Multilaser |
| Mouse Sem Fio USB Preto      | Multilaser |
| Teclado Slim USB Laser TC193 | Multilaser |
| Caixa de Som Bluetooth       | JBL        |
| Mouse Sem Fio M720 Bluetooth | Logitech   |
| Headphone Com Fio Preto      | Sony       |
| HD Externo 1TB USB 3.0       | NULL       |
| HD Externo 4TB USB Preto     | NULL       |
+------------------------------+------------+
```

&nbsp;

Nova consulta, retornando agora apenas os dados que não possuem correspondência (nulos):
```mysql

SELECT p.nomeProduto As Produto, m.nomeMarca AS Marca
FROM tb_produto AS p
LEFT JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca
WHERE m.idMarca IS NULL; 
```

↳ Saída gerada: 
```
+--------------------------+-------+
|         Produto          | Marca |
+--------------------------+-------+
| HD Externo 1TB USB 3.0   | NULL  |
| HD Externo 4TB USB Preto | NULL  |
+--------------------------+-------+
```

&nbsp;

Aplicando o RIGHT JOIN em duas das tabelas acima:
```mysql

SELECT p.nomeProduto As Produto, c.nomeCategoria AS Categoria
FROM tb_produto AS p
RIGHT JOIN tb_categoria AS c
ON p.categoriaProduto_fk = c.idCategoria;
```

↳ Saída gerada: 
```
+------------------------------+-----------------+
|           Produto            |    Categoria    |
+------------------------------+-----------------+
| Webcam HD C270               | Webcams         |
| Headphone Bluetooth Preto    | Fones de Ouvido |
| Headphone Com Fio Preto      | Fones de Ouvido |
| Teclado Gamer Warrior TC209  | Teclados        |
| Teclado Slim USB Laser TC193 | Teclados        |
| Mouse Sem Fio WM126 Preto    | Mouses          |
| Mouse Sem Fio USB Preto      | Mouses          |
| Mouse Sem Fio M720 Bluetooth | Mouses          |
| Pen Drive 32GB USB 3.0 Prata | Pen Drives      |
| Caixa de Som Bluetooth       | Caixas de Som   |
| NULL                         | Tablet          |
| NULL                         | Notebook        |
+------------------------------+-----------------+
```

&nbsp;

Nova consulta, retornando apenas os dados que não possuem correspondência/nulos:
```mysql

SELECT p.nomeProduto As Produto, c.nomeCategoria AS Categoria
FROM tb_produto as p
RIGHT JOIN tb_categoria as c
ON p.categoriaProduto_fk = c.idCategoria
WHERE p.idProduto IS NULL; -- irá excluir correspondências
```

↳ Saída gerada: 
```
+---------+-----------+
| Produto | Categoria |
+---------+-----------+
| NULL    | Tablet    |
| NULL    | Notebook  |
+---------+-----------+
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>