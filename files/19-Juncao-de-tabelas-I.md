> **Junção de duas ou mais tabelas (cláusula INNER JOIN)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Cláusula INNER JOIN
```
- As junções (JOINS) permitem que sejam realizadas consultas com informações contidas em duas ou mais tabelas e através de um único SELECT.  
  
- No MySQL, INNER JOIN, JOIN e CROSS JOINsão equivalentes sintáticos (eles podem substituir um ao outro).  
  
- As ligações acontecem através da relação da chave primária de uma tabela com a(s) chave(s) estantangeira(s) da(s) outra(s) tabela(s).  
  
- O INNER JOIN é um tipo de junção que retorna apenas registros que possuam correspondência entre duas ou mais tabelas.  
  
- Portanto: registros 'excedentes' não são exibidos neste tipo de consulta; esta exibição acontecerá, porém, quando aplicados o LEFT JOIN e RIGHT JOIN.  
```

&nbsp;  

**A primeira tabela para exemplo - Produtos *(tb_produto):***  
| idProduto	 | nomeProduto			        | marcaProduto_fk	| categoriaProduto_fk |
| :---	     | :---			                | :---	            | :---                |
| 1	         | Webcam HD C270				| 2	                | 1                   |
| 2	         | Mouse Sem Fio WM126 Preto	| 5	                | 4                   |
| 3	         | Pen Drive 32GB USB 3.0 Prata | 6	                | 5                   |
| 4	         | Headphone Bluetooth Preto	| 4	                | 2                   |
| 5	         | Teclado Gamer Warrior TC209	| 3	                | 8                   |
| 6	         | Mouse Sem Fio USB Preto	    | 3	                | 4                   |
| 7	         | Teclado Slim USB Laser TC193	| 3	                | 3                   |
| 8	         | Caixa de Som Bluetooth	    | 1	                | 6                   |
| 9	         | Mouse Sem Fio M720 Bluetooth	| 2	                | 4                   |
| 10         | Headphone Com Fio Preto	    | 7	                | 2                   |

&nbsp; 

**A segunda tabela - Marcas *(tb_marca):***  
| idMarca | nomeMarca  | 
| :---	  | :---       |
| 1	      | JBL        |
| 2	      | Logitech   |
| 3	      | Multilaser |
| 4	      | Philco     |
| 5	      | Dell       |
| 6	      | SanDisk    |
| 7	      | Sony       |

&nbsp;

**A terceira tabela - Categorias *(tb_categoria):*** 
| idCategoria | nomeCategoria	| 
| :---	      | :---            |
| 1	          | Webcams		    |
| 2	          | Fones de Ouvido |
| 3	          | Teclados        |
| 4	          | Mouses          |
| 5	          | Pen Drives      |
| 6           | Caixas de Som   |

&nbsp;

**Aplicando o INNER JOIN nas três tabelas acima:**   
```mysql
SELECT tb_produto.idProduto AS Código, tb_produto.nomeProduto As Produto, tb_marca.nomeMarca AS Marca, tb_categoria.nomeCategoria AS Categoria
-- acima estão os campos que desejo que sejam exibidos na consulta
FROM tb_produto
INNER JOIN tb_marca
ON tb_produto.marcaProduto_fk = tb_marca.idMarca
-- acima está representado onde as 2 tabelas (produto e marca) se comunicam
INNER JOIN tb_categoria
ON tb_produto.categoriaProduto_fk = tb_categoria.idCategoria
-- acima está representado onde as 2 tabelas (produto e categoria) se comunicam
ORDER BY Código ASC;
```

##### * Output:
| Código | Produto                      | Marca      | Categoria       |
| :---	 | :---                         | :---	     | :---            |
| 1	     | Webcam HD C270	            | Logitech   | Webcams         |
| 2	     | Mouse Sem Fio WM126 Preto	| Dell       | Mouses          |
| 3	     | Pen Drive 32GB USB 3.0 Prata | SanDisk    | Pen Drives      |
| 4	     | Headphone Bluetooth Preto	| Philco	 | Fones de Ouvido |
| 5	     | Teclado Gamer Warrior TC209  | Multilaser | Teclados        |
| 6	     | Mouse Sem Fio USB Preto	    | Multilaser | Mouses          |
| 7	     | Teclado Slim USB Laser TC193 | Multilaser | Teclados        |
| 8	     | Caixa de Som Bluetooth	    | JBL	     | Caixas de Som   |
| 9	     | Mouse Sem Fio M720 Bluetooth | Logitech	 | Mouses          |
|10	     | Headphone Com Fio Preto	    | Sony	     | Fones de Ouvido |

&nbsp;

**Mesma consulta acima, mas agora utilizando aliases (apelidos) junto aos nomes das colunas para sintetizar o código:**   
```mysql
SELECT p.idProduto AS Código, p.nomeProduto As Produto, m.nomeMarca AS Marca, c.nomeCategoria AS Categoria
FROM tb_produto AS p
INNER JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca
INNER JOIN tb_categoria AS c
ON p.categoriaProduto_fk = c.idCategoria
ORDER BY Código ASC;
```

&nbsp;

**Utilizando a cláusula `GROUP BY` para descobrir quantos itens de produtos existem em cada tipo de categoria:**   
```mysql
SELECT c.nomeCategoria AS Categorias, COUNT(p.idProduto) AS Itens
FROM tb_produto AS p
INNER JOIN tb_categoria AS c
ON p.categoriaProduto_fk = c.idCategoria
GROUP BY nomeCategoria
ORDER BY Itens DESC;
```

##### * Output:
| Categorias      | Itens | 
| :---            | :---  | 
| Mouses          | 3     |
| Teclados        | 2     |
| Fones de Ouvido |	2     |
| Webcams	      | 1     |
| Caixas de Som	  | 1     |
| Pen Drives      |	1     |

&nbsp;

**Utilizando a cláusula `HAVING` para descobrir qual marca possui mais ou ao menos 3 itens de produto:**  
```mysql
SELECT m.nomeMarca AS Marcas, COUNT(p.idProduto) AS Itens
FROM tb_produto AS p
INNER JOIN tb_marca AS m
ON p.marcaProduto_fk = m.idMarca
GROUP BY Marcas
HAVING COUNT(Itens) >= 3;
```

##### * Output:
| Marcas     | Itens | 
| :---       | :---  | 
| Multilaser | 3     |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>