> **Junção de duas ou mais tabelas (cláusula INNER JOIN)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**INNER JOIN**  
- As junções (JOINS) permitem que sejam realizadas consultas com informações contidas em mais de uma tabela e através de um único SELECT.
- As ligações acontecem através da relação da chave primária de uma tabela com a(s) chave(s) estantangeira(s) da(s) outra(s) tabela(s).
- O INNER JOIN é um tipo de junção que retorna *apenas* registros que possuam correspondência entre duas ou mais tabelas. 
&nbsp;
     
&nbsp;  
**A primeira tabela para exemplo - Produtos *(tb_produto):***  
| idProduto	 | nomeProduto			        | marcaProduto_fk	| categoriaProduto_fk |
| ----	     | ----			                | ----	            | ----                |
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

&nbsp;  
**A segunda tabela - Marcas *(tb_marca):***  
| idMarca | nomeMarca  | 
| ----	  | ----       |
| 1	      | JBL        |
| 2	      | Logitech   |
| 3	      | Multilaser |
| 4	      | Philco     |
| 5	      | Dell       |
| 6	      | SanDisk    |
| 7	      | Sony       |

&nbsp;

&nbsp;  
**A terceira tabela - Categorias *(tb_categoria):*** 
| idCategoria | nomeCategoria	| 
| ----	      | ----            |
| 1	          | Webcams		    |
| 2	          | Fones de Ouvido |
| 3	          | Teclados        |
| 4	          | Mouses          |
| 5	          | Pen Drives      |
| 6           | Caixas de Som   |

&nbsp;

&nbsp;  
**Aplicando o INNER JOIN nas três tabelas acima:**   
```mysql
SELECT idProduto AS Código, nomeProduto As Produto, nomeMarca AS Marca, nomeCategoria AS Categoria
FROM tb_produto
INNER JOIN tb_marca
ON tb_produto.marcaProduto_fk = tb_marca.idMarca
INNER JOIN tb_categoria 
ON tb_produto.categoriaProduto_fk = tb_categoria.idCategoria;
```
##### * Output:
| Código | Produto                      |  Marca     | Categoria       |
| ----	 | ----                         | ----	     | ----            |
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