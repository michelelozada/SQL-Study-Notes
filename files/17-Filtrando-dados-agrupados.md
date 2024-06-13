> **Filtrando registros após terem sido agrupados (cláusula HAVING)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
## Cláusula HAVING
```
- Pode ser aplicado um filtro apenas aos dados resultantes de um agrupamento feito através da cláusula `GROUP BY`.  

- Para tanto, basta usar a cláusula `HAVING`, junto à função de agregação que foi utilizada junto ao comando `SELECT`.  

- Apesar da cláusula `WHERE` ser bastante similar à cláusula `GROUP BY`, a primeira não funciona junto a resultados de funções de agregação.
```

&nbsp;  

**A tabela para exemplo:** 

| idVenda  | idVendedor  | valorVenda | tipoCliente |
| :---     | :---   	   | :---       | :---        | 
| 1		     | 3			     |  760.00 	  | PJ          |
| 2		     | 2	         |  350.00    | PF          |
| 3	       | 3           | 1000.00    | PJ          |
| 4		     | 3 			     | 2500.00	  | PJ          |
| 5	       | 2			     |  400.00    | PF          |
| 6 	     | 1			     |  750.00    | PJ          |
| 7        | 1           |  150.00    | PF          |
| 8        | 3           | 1600.00    | PJ          |
| 9        | 2			     | 3500.00    | PJ          |
| 10       | 1			     |  400.00    | PJ          |

&nbsp;

No exemplo abaixo, desejo retornar o valor total das vendas de cada um dos vendedores *(repare que aqui não foi inclusa a clásula `HAVING`)*:
```mysql
SELECT idVendedor AS 'Id Vendedor', SUM(valorVenda) AS 'Valor total das vendas'
FROM tb_venda
GROUP BY idVendedor;
```
| Id Vendedor | Valor total das vendas |
| ----        | ----   				         |
| 1			      |	1300.00				         |	
| 2	          | 4250.00				         |	
| 3		        | 5860.00				         |

&nbsp;

Aqui, desejo retornar os vendendores que fizeram vendas superiores a R$ 5.000,00 *(aqui é utilizada a clásula `HAVING`)*:
```mysql
SELECT idVendedor AS 'Id Vendedor', SUM(valorVenda) AS 'Valor total das vendas'
FROM tb_venda
GROUP BY idVendedor
HAVING SUM(valorVenda) > 5000.00;
```
| Id Vendedor | Valor total das vendas |
| ----        | ----   				         |
| 3		        | 5860.00				         |	

&nbsp;

No exemplo abaixo, desejo retornar quantas vendas cada vendedor realizou *(repare que não foi inclusa a clásula `HAVING`)*:
```mysql
SELECT idVendedor AS 'Id Vendedor', COUNT(idVenda) AS 'Quantidade de Vendas'
FROM tb_venda
GROUP BY idVendedor;
```
| Id Vendedor | Quantidade de vendas |
| ----        | ----   		           |
| 1	          | 3			               |
| 2	          | 3			               |
| 3	          | 4				             |

&nbsp;

No exemplo abaixo, desejo saber se algum vendedor realizou 4 (ou mais) vendas até esse momento *(aqui utilizada a clásula `HAVING`)*:
```mysql
SELECT idVendedor AS 'Id Vendedor', COUNT(idVenda) AS 'Quantidade de Vendas'
FROM tb_venda
GROUP BY idVendedor
HAVING COUNT(idVenda) >= 4;
```
| Id Vendedor | Quantidade de vendas |
| ----        | ----   		           |
| 3	          | 4				             |

&nbsp;

No exemplo abaixo, desejo saber se algum vendedor realizou mais que 3 vendas para clientes do tipo PJ até esse momento:
```mysql
SELECT idVendedor AS 'Id Vendedor', COUNT(tipoCliente) AS 'Vendas para clientes do tipo PJ'
FROM tb_venda
WHERE tipoCliente = 'PJ'
GROUP BY idVendedor
HAVING COUNT(tipoCliente) > 3;
```
| Id Vendedor | Vendas para cliente do tipo PJ |
| ----        | ----   		                     |
| 3	          | 4				                       |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>