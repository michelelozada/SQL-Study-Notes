> **Implementando funções (comando CREATE FUNCTION)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**FUNÇÕES**  
- São rotinas ou subprogramas, armazenadas de maneira persistente no SGBD, que executam uma determinada tarefa.   
- São identificadas por um nome, pelo qual são invocadas.  
- Uma função recebe parâmetros e retorna algum valor, confome o exemplo abaixo.  
&nbsp;
     
&nbsp;  
**Exemplo 1 - Declarando uma função**
```mysql
CREATE FUNCTION fn_primeiraFuncao(a INT,b INT)
RETURNS INT
RETURN a + b;
```
&nbsp;
&nbsp;    
**Invocando esta função**
```mysql
SELECT fn_primeiraFuncao(5,4) AS Resultado; 
```
###### * Output:  
| Resultado |
| :---      |
| 9			|

&nbsp;
&nbsp;    
**Excluindo esta função**
```mysql
DROP FUNCTION fn_primeiraFuncao;
```
&nbsp;
     
&nbsp;  
**Exemplo 2 - A ideia aqui é a criação de uma função que calcule a média das notas dos alunos:**    
| idAluno | nomeAluno         | notaObtida1 | notaObtida2 |
| :---    | :---              | :---        | :---        |
| 1	      | Carla Santana	  | 5.5	        | 7.1         |
| 2	      | Cátia Marcondes	  | 6.8	        | 7.4         |
| 3	      | Enzo Marques	  | 7.8	        | 8.7         |
| 4	      | Luana Borba	      | 7.5	        | 8.5         | 
| 5	      | Marcos Góes	      | 8.9	        | 9.8         |
| 6	      | Mariana Fernandes |	5.4	        | 6.2         |

&nbsp;
&nbsp;     
**Declarando a função**
```mysql
CREATE FUNCTION fn_calculoMedia(notaObtida1 DECIMAL(2,1), notaObtida2 DECIMAL(2,1))
RETURNS DECIMAL(2,1)
RETURN (notaObtida1 + notaObtida2) / 2;
```
&nbsp;
&nbsp;    
**Invocando a função**
```mysql
SELECT nomeAluno, notaObtida1, notaObtida2, fn_calculoMedia(notaObtida1,notaobtida2) AS mediaObtida
FROM tb_aluno;
```
###### * Output:  
| nomeAluno         | notaObtida1   | notaObtida2 | mediaObtida |
| :---              | :---          | :---        | :---        |
| Carla Santana	    | 5.5	        | 7.1         | 6.3			|
| Cátia Marcondes   | 6.8	        | 7.4         | 7.1			|
| Enzo Marques	    | 7.8	        | 8.7         | 8.3			|
| Luana Borba	    | 7.5	        | 8.5         | 8.0			|
| Marcos Góes	    | 8.9	        | 9.8         | 9.4			|
| Mariana Fernandes | 5.4	        | 6.2         | 5.8			|

&nbsp;
&nbsp;    
**Excluindo esta função**
```mysql
DROP FUNCTION fn_calculoMedia;
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>