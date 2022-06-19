> **Junção de duas ou mais tabelas (cláusulas LEFT JOIN e RIGHT JOIN)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**LEFT OUTER JOIN e RIGHT OUTER JOIN**  
- As junções (JOINS) permitem que sejam realizadas consultas com informações contidas em duas ou mais tabelas e através de um único SELECT.  
&nbsp;  
- As ligações acontecem através da relação da chave primária de uma tabela com a(s) chave(s) estantangeira(s) da(s) outra(s) tabela(s).  
&nbsp;  
- O LEFT OUTER JOIN é um tipo de junção que retorna *todos* os registros da tabela colocada à esquerda da junção/termo LEFT JOIN, 
independentemente dos registros possuírem ou não correspondência com a(s) outra(s) tabela(s).   
&nbsp;  
- Já o RIGHT OUTER JOIN é um tipo de junção que retorna *todos* os registros da tabela colocada à direita da junção/termo RIGHT JOIN,
independentemente dos registros possuírem ou não correspondência com a(s) outra(s) tabela(s).  
&nbsp;  
- Portanto: tanto no LEFT quanto no RIGHT JOIN os registros 'excedentes' são exibidos; o que não acontece quando é aplicado o INNER JOIN.  
&nbsp;  
- Observação: A utilização do termo OUTER é opcional.
&nbsp;
     
&nbsp;  
**A primeira tabela para exemplo - Produtos *(tb_produto):***  
| idProduto | nomeProduto   			   | marcaProduto_fk |	categoriaProduto_fk |	
| ----		| ----		    			   | ----		     | ----					|
| 1			| Webcam HD C270			   | 2				 |	1					|
| 2			| Mouse Sem Fio WM126 Preto	   | 5				 |	4					|
| 3			| Pen Drive 32GB USB 3.0 Prata | 6			     |	5					|
| 4			| Headphone Bluetooth Preto	   | 4				 |	2					|
| 5			| Teclado Gamer Warrior TC209  | 3				 |	3					|
| 6			| Mouse Sem Fio USB Preto	   | 3			     |	4					|
| 7			| Teclado Slim USB Laser TC193 | 3			     |	3					|
| 8			| Caixa de Som Bluetooth	   | 1				 | 	6					|
| 9			| Mouse Sem Fio M720 Bluetooth | 2				 |	4					|
| 10		| Headphone Com Fio Preto	   | 7				 |	2					|
| 11		| HD Externo 1TB USB 3.0 	   | NULL	         |	NULL				|
| 12		| HD Externo 4TB USB Preto 	   | NULL	         |	NULL				|

&nbsp; 

&nbsp;  
**A segunda tabela - Categoria *(tb_categoria):***  
| idCategoria | nomeCategoria   |
| ----		  |	 ----		    |
| 1			  |	Webcams			|
| 2	          | Fones de Ouvido |
| 3			  | Teclados        |
| 4			  | Mouses			|
| 5			  | Pen Drives      |
| 6			  | Caixas de Som   |
| 7			  | Tablet          |
| 8			  | Notebook		|

&nbsp; 

&nbsp;  
**A terceira tabela - Marcas *(tb_marca):***  
| idMarca 	  | nomeMarca       |
| ----		  |	 ----		    |
| 1			  |	JBL	            |
| 2	          | Logitech        |
| 3	          | Multilaser      |
| 4	          | Philco          |
| 5	          | Dell            |
| 6	          | SanDisk         |
| 7	          | Sony            |

&nbsp;

&nbsp;  
**1.1. Aplicando o LEFT JOIN em duas das tabelas acima:**   
```mysql
SELECT nomeProduto As Produto, nomeMarca AS Marca
FROM tb_produto
LEFT JOIN tb_marca
ON tb_produto.marcaProduto_fk = tb_marca.idMarca;
```
##### * Output:
| Produto 			           | Marca 			 |
| ----		                   | ----            |
| Webcam HD C270			   | Logitech        |
| Mouse Sem Fio WM126 Preto	   | Dell            |
| Pen Drive 32GB USB 3.0 Prata | SanDisk         |
| Headphone Bluetooth Preto	   | Philco          |
| Teclado Gamer Warrior TC209  | Multilaser      |
| Mouse Sem Fio USB Preto	   | Multilaser      |
| Teclado Slim USB Laser TC193 | Multilaser      |
| Caixa de Som Bluetooth	   | JBL             |
| Mouse Sem Fio M720 Bluetooth | Logitech        |
| Headphone Com Fio Preto	   | Sony            | 
| HD Externo 1TB USB 3.0 	   | NULL            |
| HD Externo 4TB USB Preto 	   | NULL            |

&nbsp;

&nbsp; 
**1.2. Nova consulta, retornando agora apenas os dados que não possuem correspondência/nulos:**
```mysql
SELECT nomeProduto As Produto, nomeMarca AS Marca
FROM tb_produto
LEFT JOIN tb_marca
ON tb_produto.marcaProduto_fk = tb_marca.idMarca
WHERE tb_marca.idMarca IS NULL; 
```

##### * Output:
| Produto 			       | Marca |
| ----		               | ----  |
| HD Externo 1TB USB 3.0   | NULL  |   	
| HD Externo 4TB USB Preto | NULL  |

&nbsp;

&nbsp;  
**2.1. Aplicando o RIGHT JOIN em duas das tabelas acima:**   
```mysql
SELECT nomeProduto As Produto, nomeCategoria AS Categoria
FROM tb_produto
RIGHT JOIN tb_categoria
ON tb_produto.categoriaProduto_fk = tb_categoria.idCategoria;
```
##### * Output:
| Produto 			           | Marca 			 |
| ----		                   | ----            |
| Webcam HD C270			   | Webcams         |
| Headphone Bluetooth Preto	   | Fones de Ouvido |
| Headphone Com Fio Preto	   | Fones de Ouvido |
| Teclado Gamer Warrior TC209  | Teclados        |
| Teclado Slim USB Laser TC193 | Teclados        |
| Mouse Sem Fio WM126 Preto	   | Mouses          |
| Mouse Sem Fio USB Preto	   | Mouses          |
| Mouse Sem Fio M720 Bluetooth | Mouses          |
| Pen Drive 32GB USB 3.0 Prata | Pen Drives      |
| Caixa de Som Bluetooth	   | Caixas de Som   |
| NULL					   	   | Tablet		     |
| NULL					       | Notebook        |

&nbsp;

&nbsp;  
**2.2. Nova consulta, retornando apenas os dados que não possuem correspondência/nulos:**
```mysql
SELECT nomeProduto As Produto, nomeCategoria AS Categoria
FROM tb_produto
RIGHT JOIN tb_categoria
ON tb_produto.categoriaProduto_fk = tb_categoria.idCategoria
WHERE tb_produto.idProduto IS NULL; -- retona dados onde dados são nulos/ excluindo correspondências
```
##### * Output:
| Produto | Categoria |
| ----	  | ----      |
| NULL 	  | Tablet	  |   	
| NULL    | Notebook  |