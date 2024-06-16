> **Testando valores NULL (operadores IS NULL e IS NOT NULL)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;      
### Valores NULL
```
- São aqueles a que não há nenhum valor associado, ou seja, foi campo deixado vazio/sem preecher

- Podem ser testados através dos operadores IS NULL e IS NOT NULL  
```

&nbsp;

> A tabela para o exemplo:   
| idCliente | nomeCliente 		| scoreCliente |
| :---      | :---	      		| :---         |
| 1         | Luana Borba	    | 300          |
| 2	        | Mariana Fernandes | 710          |
| 3	        | Cátia Marcondes	| NULL         |
| 4	        | Marcos Góes	    | NULL         |
| 5	        | Enzo Marques	    | 500          |
| 6	        | Carla Santana	    | 800          |
| 7	        | Sandra de Paula	| NULL         |
| 8	        | Paulo Figueiredo  | NULL         |
| 9	        | Larissa Torres	| 520          |
| 10        | Vinícius Motta	| NULL         |

&nbsp;
     
### • Utilizando o operador IS NULL:  
Retorna registros com valores vazios da coluna identificada  

```mysql

SELECT * 
FROM tb_cliente 
WHERE scoreCliente IS NULL;
```

Saída gerada:

| idCliente | nomeCliente 		| scoreCliente |
| :---      | :---	      		| :---         |
| 3	        | Cátia Marcondes	| NULL         |
| 4	        | Marcos Góes	    | NULL         |
| 7	        | Sandra de Paula	| NULL         |
| 8	        | Paulo Figueiredo  | NULL         |
| 10        | Vinícius Motta	| NULL         |

&nbsp;
     
### • Utilizando o operador IS NOT NULL:
Retorna registros com valores não-vazios da coluna identificada  

```mysql

SELECT * 
FROM tb_cliente 
WHERE scoreCliente IS NOT NULL
ORDER BY scoreCliente DESC;
```
Saída gerada:

| idCliente | nomeCliente 		| scoreCliente |
| :---      | :---	      		| :---         |
| 6	        | Carla Santana	    | 800          |
| 2	        | Mariana Fernandes | 710          |
| 9	        | Larissa Torres	| 520          |
| 5	        | Enzo Marques	    | 500          |
| 1         | Luana Borba	    | 300          |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>