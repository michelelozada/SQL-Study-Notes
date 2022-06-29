> **Implementando procedimentos (comando CREATE PROCEDURE)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**PROCEDIMENTO ARMAZENADO (STORE PROCEDURE)**  
- É um bloco de instruções organizado para receber parâmetros e executar uma ou mais tarefas.  
- Assim como a função, um procedimento também é uma rotina armazenada de maneira persistente no SGBD.  
- O comando `CALL` é utilizado para evocar o procedimento armazenado.  
&nbsp;
     
&nbsp;  
**A. A tabela para exemplo**  
| idCurso | nomeCurso 	   | Turno | Mensalidade |
| :---    | :---      	   | :---  | :---        |
| 1       | Direito        | M     | 876.28      |
| 2       | Direito        | N     | 950.28      |
| 5       | Pedagogia      | M     | 249.50      |
| 6       | Pedagogia      | N     | 278.50      |
| 7       | Design Gráfico | M     | 622.05      |
| 8       | Design Gráfico | N     | 670.10      |

&nbsp;
&nbsp;      
**B. Declarando um procedimento**
```mysql
CREATE PROCEDURE consultaMensalidade(pesquisaCurso varchar(50))
SELECT CONCAT('O valor da mensalidade do curso ' , nomeCurso , ' (turno ' , turnoCurso , ') é R$ ', mensalidadeCurso , '.') AS Consulta_Mensalidade
FROM tb_curso
WHERE nomeCurso = pesquisaCurso;
```
&nbsp;
&nbsp;    
**C. Invocando o procedimento**
```mysql
CALL consultaMensalidade('Direito');
```
###### * Output:  
| Consulta_Mensalidade                                           |
| :---                                                           |
| O valor da mensalidade do curso Direito (turno M) é R$ 876.28. |
| O valor da mensalidade do curso Direito (turno N) é R$ 950.28. |

&nbsp;
&nbsp;  
**D. Invocando o procedimento novamente**
```mysql
CALL consultaMensalidade('Design Gráfico');
```
###### * Output:  
| Consulta_Mensalidade                                                  |
| :---                                                                  |
| O valor da mensalidade do curso Design Gráfico (turno M) é R$ 622.05. |
| O valor da mensalidade do curso Design Gráfico (turno N) é R$ 670.10. |

&nbsp;
&nbsp;    
**E. Excluindo o procedimento acima**
```mysql
DROP PROCEDURE consultaMensalidade;
```