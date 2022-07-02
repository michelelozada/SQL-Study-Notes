> **Funções de agregação (COUNT, MAX, MIN, SUM e AVG)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**FUNÇÕES DE AGREGAÇÃO**  
- Agregam em uma única linha valores dos registros, tais como contagem, média, soma, mínimo ou máximo. 
- São utilizadas junto às cláusulas `SELECT`.
&nbsp;
     
&nbsp;  
**A tabela de exemplo:**  
| ID Curso | Nome curso 							| Turno | Mensalidade |
| :---     | :---      							    | :---  | :---        |
| 1        | Direito                               	| M     | 876.28      |
| 2	       | Direito	                            | N     | 950.28      |
| 3	       | Análise e Desenvolvimento de Sistemas 	| M     | 503.20      |
| 4	       | Análise e Desenvolvimento de Sistemas 	| N     | 550.20      |
| 5	       | Administração	                     	| M     | 654.16      |
| 6	       | Administração	                        | N     | 680.00      |
| 7	       | Farmácia	                            | M     | 814.64      |
| 8	       | Sistemas de Informação                 | M     | 560.32      |
| 9	       | Gestao de TI	                        | M     | 477.36      |
| 10       | Gestao de TI	                        | N     | 500.00      |
| 11       | Pedagogia	                         	| M     | 249.50      |
| 12       | Pedagogia	                         	| N     | 278.50      |
| 13       | Nutrição                              	| M     | 495.00      |
| 14       | Ciência de Dados                      	| M     | 514.00      |
| 15       | Design Gráfico                        	| M     | 622.05      |
| 16       | Design Gráfico                        	| N     | 670.10      |

&nbsp;
     
&nbsp;  
**1- Função COUNT**  
Retorna a quantidade de registros de uma tabela.  
&nbsp;  
Fazendo a contagem dos cursos regitrados na tabela:
```mysql
SELECT COUNT(ALL nomeCurso) AS Numero_de_Cursos  
FROM tb_curso;  
# retorna: 16 (Tabela tem 16 registros ao todo)
# O uso de ALL é opcional. Também poderia ter sido usado SELECT (*) FROM tb_curso; 
```
Fazendo a contagem dos cursos, porém agora sem contar o nome dos cursos que se repetem na tabela:
```mysql
SELECT COUNT(DISTINCT nomeCurso) AS Numero_de_Cursos 
FROM tb_curso;  
# retorna: 10 (Tabela tem apenas 10 cursos)
```
Fazendo a contagem de cursos, baseada em uma condição especificada:
```mysql
SELECT COUNT(nomeCurso) 
FROM tb_curso 
WHERE mensalidadeCurso < 300.00;  
# retorna: 2  (Tabela só tem dois cursos com mensalidade inferior a R$ 300,00)
```
Fazendo a contagem dos turnos dos cursos:
```mysql
SELECT COUNT(DISTINCT turnoCurso) AS Turnos_escola 
FROM tb_curso;
# retorna: 2  (Manhã e Tarde)
```
&nbsp;
     
&nbsp;  
**2 - Função MAX**  
Retorna o maior valor dentre os elementos de uma coluna:
```mysql
SELECT MAX(mensalidadeCurso) 
FROM tb_curso; 
# retorna 950.28  (mensalidade do curso de Direito - N)
```
Retornando o maior valor de mensalidade dentre uma faixa estipulada:
```mysql
SELECT MAX(mensalidadeCurso) 
FROM tb_curso 
WHERE mensalidadeCurso> 600.00 AND mensalidadeCurso< 700.00;  
-- retorna 680.00 (mensalidade do curso de Administração - N)
```
&nbsp;
     
&nbsp;  
**3 - Função MIN**  
Retorna o menor valor dentre os elementos de uma coluna.
```mysql
SELECT MIN(mensalidadeCurso) 
FROM tb_curso; 
# retorna 249.50 (mensalidade do curso de Pedagogia - M)
```
Retornando o menor valor de mensalidade dentre uma faixa estipulada:
```mysql
SELECT MIN(mensalidadeCurso)
FROM tb_curso 
WHERE mensalidadeCurso> 600.00 AND mensalidadeCurso< 700.00;  
# retorna 622.05 (mensalidade do curso de Design Gráfico - N)
```
Consulta com o retorno dos dois valores:
```mysql
SELECT MAX(mensalidadeCurso), MIN(mensalidadeCurso) 
FROM tb_curso;   
# Retorna 950.28 (MAX) e 249.50 (MIN)
```
&nbsp;
     
&nbsp;  
**4- Função SUM**  
Retona a soma dos valores de uma coluna
```mysql
SELECT SUM(mensalidadeCurso) 
FROM tb_curso; 
# retona 9395,59 (soma de todas as mensalidades)
```
No exemplo abaixo, realizando a soma apenas dos cursos com ID menor ou igual a 5:
```mysql
SELECT SUM(mensalidadeCurso) 
FROM tb_curso 
WHERE idCurso <= 5;
# retona 3534.12 (soma das 5 primeiras mensalidades da tabela)
```
&nbsp;
     
&nbsp;  
**5 - Função AVG**  
Retona a média aritmética dos valores de uma coluna
```mysql
SELECT AVG(mensalidadeCurso) 
FROM tb_curso; 
# retorna 587.224375 (média das mensalidades dos cursos)
```