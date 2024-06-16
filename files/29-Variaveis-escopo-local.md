> **Trabalhando com variáveis de escopo local**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Variáveis de escopo local 
```
- Têm visibilidade apenas local, ou seja, são conhecidas apenas dentro das funções ou stored procedures

- Somente podem ser declaradas dentro de um bloco BEGIN ... END, através da instrução DECLARE

- São válidas apenas durante a execução do programa em que foram declaradas; após isso são destruídas 
da memória
```
     
&nbsp;   

> A tabela a ser utilizada para os exemplos abaixo:

| idCurso | nomeCurso      | turnoCurso | mensalidadeCurso |
| :--     | :--            | :--        | :--              |
| 1       | Direito		   | M          | 876.28           |
| 2	      | Pedagogia	   | M	        | 249.50           |

&nbsp;     

> A. Criação da função  
Objetivo: Criação de uma função para calcular redução da mensalidade, tendo sido informados o código do curso e a taxa de desconto:

```mysql

DELIMITER //  
CREATE FUNCTION reduzirMensalidade(codigoCurso INT, taxaDesconto DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
  DECLARE mensalidade DECIMAL(10,2);
  SELECT mensalidadeCurso INTO mensalidade
  FROM tb_curso
  WHERE idCurso = codigoCurso;
  RETURN mensalidade - mensalidade * taxaDesconto/100;
END //
DELIMITER ; 
```
&nbsp;    

> B. Chamada da função  
Parâmetros: Curso de código 1 e taxa de desconto de 10%  
```mysql

SELECT reduzirMensalidade(1,10) AS 'Mensalidade com desconto';
```

Saída gerada: 
| Mensalidade com desconto |
| :---					   |					
| 788,65		           |

&nbsp;  

> C. Nova chamada da função  
Parâmetros: Curso de código 2 e taxa de desconto de 5%  
```mysql

SELECT reduzirMensalidade(2,5) AS 'Mensalidade com desconto';
```

Saída gerada: 
| Mensalidade com desconto |
| :---					   |					
| 237,03				   |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>