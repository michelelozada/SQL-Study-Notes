> **Agrupando dados resultantes de uma seleção (cláusula GROUP BY)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
**GROUP BY**  
- Resume os dados resultantes de uma seleção de 'subgrupos de tuplas' que possuam valores de natureza semelhantes. 
- Para tanto, a cláusula `SELECT` deverá possuir uma função de agregação para processamento destas informações.
&nbsp;
     
&nbsp;  
**A tabela para exemplo:** 

| idVenda  | idVendedor  | valorVenda | tipoCliente |
| :---     | :---   	 | :---       | :---        | 
| 1		   | 3			 |  760.00 	  | PJ          |
| 2		   | 2	         |  350.00    | PF          |
| 3	       | 3           | 1000.00    | PJ          |
| 4		   | 3 			 | 2500.00	  | PJ          |
| 5	       | 2			 |  400.00    | PF          |
| 6 	   | 1			 |  750.00    | PJ          |
| 7        | 1           |  150.00    | PF          |
| 8        | 3           | 1600.00    | PJ          |
| 9        | 2			 | 3500.00    | PJ          |
| 10       | 1			 |  400.00    | PJ          |

&nbsp;

&nbsp;  
No exemplo abaixo, desejo retornar o valor total das vendas de cada um dos vendedores *(repare que não foi inclusa a clásula `WHERE`)*:
```mysql
SELECT idVendedor AS 'ID Vendedor', SUM(valorVenda) AS 'Valor total das vendas'
FROM tb_venda
GROUP BY idVendedor;
```
| ID Vendedor  | Valor total das vendas    |
| :---         | :---   				   |
| 1			   | 1300.00				   |	
| 2	           | 4250.00				   |	
| 3		       | 5860.00				   |

&nbsp;

&nbsp;  
No exemplo abaixo, desejo retornar *apenas* o valor total das vendas do vendedor com a Id nº 2 *(aqui inclusa a clásula `WHERE`)*:
```mysql
SELECT idVendedor AS 'ID Vendedor', SUM(valorVenda) AS 'Valor total das vendas'
FROM tb_venda
WHERE idVendedor = '2'
GROUP BY idVendedor;
```
| ID Vendedor | Valor total das vendas |
| :---        | :---   				   |
| 2	          | 4250.00				   |	

&nbsp;

&nbsp;  
No exemplo abaixo, desejo retornar quantas vendas foram realizadas apenas pelo vendedor com a Id nº 3:
```mysql
SELECT idVendedor AS 'ID Vendedor', COUNT(idVenda) AS 'Quantidade de Vendas'
FROM tb_venda
WHERE idVendedor = '3'
GROUP BY idVendedor;
```
| ID Vendedor  | Quantidade de vendas |
| :---         | :---   			  |
| 3	           | 4				      |

&nbsp;

&nbsp;  
No exemplo abaixo, desejo retornar quantas vendas foram realizadas pelos vendedores a clientes do tipo PJ:
```mysql
SELECT idVendedor AS 'ID Vendedor', COUNT(tipoCliente) AS 'Vendas para clientes do tipo PJ'
FROM tb_venda
WHERE tipoCliente = 'PJ'
GROUP BY idVendedor;
```
| iD Vendedor  | Vendas para clientes do tipo PJ |
| :---         | :---   				         |
| 1	           | 2				                 |
| 2	           | 1				                 |
| 3	           | 4				                 |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>