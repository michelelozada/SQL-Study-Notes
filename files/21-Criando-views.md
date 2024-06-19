> **Criando visões ou 'tabelas virtuais' (comando CREATE VIEW)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Visões/Views
```
- Quando tabelas são criadas através do comando `CREATE TABLE`, "isso significa que a relação e suas 
tuplas são realmente criadas e armazenadas como um arquivo pelo SGBD", sendo que elas "são chamadas de
tabelas (ou relações da base)".[1]  
  
- Já quando tabelas são criadas através do comando `CREATE VIEW`, isto indica que se tratam de relações
virtuais, "distintas das relações da base" e que "podem ou não corresponder a um arquivo físico real".
 
- Portanto, uma view *(ou visão)* é uma tabela virtual - criada com base em declarações `SELECT` - que, 
quando evocada, tem como base tabelas reais ou mesmo outras views.  

- Outras caracteríticas da VIEW: 
	. "mostra sempre resultados de dados atualizados, pois o motor do banco de dados recria os dados toda 
	vez que um usuário consulta a visão;
	. simplifica o acesso a dados que estão armazenados em múltiplas tabelas relacionadas;
	. implementa segurança nos dados de uma tabela, por exemplo criando uma visão que limite os dados que 
	podem ser acessados, por meio de uma cláusula `WHERE`;

- Referências consultadas:     
  . Página 59 do livro "Sistemas de Banco de Dados", dos autores Ramez Elmasri e Shamkant B. Navathe.  
  . "MySQL – VIEWS: Criando Tabelas Virtuais", texto do autor Fábio dos Reis (disponível na internet)
```
     
&nbsp;  

> As tabelas de exemplo:

&nbsp; 

*tb_produto:*
```
+-----------+------------------------------+-----------------+---------------------+
| idProduto |         nomeProduto          | marcaProduto_fk | categoriaProduto_fk |
+-----------+------------------------------+-----------------+---------------------+
|         1 | Webcam HD C270               |               2 |                   1 |
|         2 | Mouse Sem Fio WM126 Preto    |               5 |                   4 |
|         3 | Pen Drive 32GB USB 3.0 Prata |               6 |                   5 |
|         4 | Headphone Bluetooth Preto    |               4 |                   2 |
|         5 | Teclado Gamer Warrior TC209  |               3 |                   8 |
|         6 | Mouse Sem Fio USB Preto      |               3 |                   4 |
|         7 | Teclado Slim USB Laser TC193 |               3 |                   3 |
|         8 | Caixa de Som Bluetooth       |               1 |                   6 |
|         9 | Mouse Sem Fio M720 Bluetooth |               2 |                   4 |
|        10 | Headphone Com Fio Preto      |               7 |                   2 |
+-----------+------------------------------+-----------------+---------------------+
```

&nbsp;  

*tb_marca:*  
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

*tb_categoria:* 
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
+-------------+-----------------+
```

&nbsp;  
     
> Criando uma view:
```mysql

CREATE VIEW vw_catalogo AS 
SELECT p.nomeProduto As Produto, m.nomeMarca AS Marca
FROM tb_produto AS p
INNER JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca
INNER JOIN tb_categoria AS c
ON p.categoriaProduto_fk = c.idCategoria;
```

&nbsp;

> Evocando a view acima:
```mysql

SELECT Produto, Marca
FROM vw_catalogo
ORDER BY Produto;
```

Saída gerada:
```
+------------------------------+------------+
|           Produto            |   Marca    |
+------------------------------+------------+
| Caixa de Som Bluetooth       | JBL        |
| Headphone Bluetooth Preto    | Philco     |
| Headphone Com Fio Preto      | Sony       |
| Mouse Sem Fio M720 Bluetooth | Logitech   |
| Mouse Sem Fio USB Preto      | Multilaser |
| Mouse Sem Fio WM126 Preto    | Dell       |
| Pen Drive 32GB USB 3.0 Prata | SanDisk    |
| Teclado Gamer Warrior TC209  | Multilaser |
| Teclado Slim USB Laser TC193 | Multilaser |
| Webcam HD C270               | Logitech   |
+------------------------------+------------+
```

&nbsp;  

> Alterando uma view:    
*Foi feita inclusão do campo *nomeCategoria* junto ao SELECT
```mysql

ALTER VIEW vw_catalogo AS 
SELECT p.nomeProduto As Produto, m.nomeMarca AS Marca, c.nomeCategoria AS Categoria
FROM tb_produto AS p
INNER JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca
INNER JOIN tb_categoria AS c
ON p.categoriaProduto_fk = c.idCategoria;
```

&nbsp;  

> Evocando a view:
```mysql

SELECT Produto, Marca, Categoria
FROM vw_catalogo
ORDER BY Produto;
```

Saída gerada:
```
+------------------------------+------------+-----------------+
|           Produto            |   Marca    |    Categoria    |
+------------------------------+------------+-----------------+
| Caixa de Som Bluetooth       | JBL        | Caixas de Som   |
| Headphone Bluetooth Preto    | Philco     | Fones de Ouvido |
| Headphone Com Fio Preto      | Sony       | Fones de Ouvido |
| Mouse Sem Fio M720 Bluetooth | Logitech   | Mouses          |
| Mouse Sem Fio USB Preto      | Multilaser | Mouses          |
| Mouse Sem Fio WM126 Preto    | Dell       | Mouses          |
| Pen Drive 32GB USB 3.0 Prata | SanDisk    | Pen Drives      |
| Teclado Gamer Warrior TC209  | Multilaser | Teclados        |
| Teclado Slim USB Laser TC193 | Multilaser | Teclados        |
| Webcam HD C270               | Logitech   | Webcams         |
+------------------------------+------------+-----------------+
```

&nbsp;

> Excluindo a view:
```mysql

DROP VIEW vw_catalogo;
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>