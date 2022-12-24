> **Delimitando funções e procedimentos armazenados (bloco BEGIN ... END)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**BLOCO BEGIN ... END**  
- Utilizado para conter instruções a serem executadas pelos procedimentos e funções armazenados.
- Estas instruções devem estar dispostas entre as palavras-chave `BEGIN` e `END`, além de serem envolvidas pelo comando `DELIMITER` seguido de caracteres especiais como `$$` ou `//`, conforme exemplos que seguem abaixo.
&nbsp;
     
&nbsp;  
**Ex. 1 - A tabela de exemplo:**  
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
**Declarando uma função, dentro do bloco BEGIN ... END**
```mysql
DELIMITER $$ 
CREATE FUNCTION calcularMedia(notaObtida1 DECIMAL(2,1), notaObtida2 DECIMAL(2,1))
RETURNS DECIMAL(2,1)
BEGIN   
	RETURN (notaObtida1 + notaObtida2) / 2;
END $$
DELIMITER ;
```
&nbsp;
&nbsp;  
**Invocando a função**
```mysql
SELECT nomeAluno, notaObtida1, notaObtida2, calcularMedia(notaObtida1,notaobtida2) AS mediaObtida
FROM tb_aluno;
````
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
**Ex. 2 - A tabela de exemplo:**  
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
**Incluindo duas cláusulas SELECT em um mesmo procedimento dentro do bloco BEGIN ... END**
```mysql
DELIMITER //  
CREATE PROCEDURE consultarMensalidade(pesquisaCurso varchar(50))
BEGIN
	SELECT CONCAT('O valor da mensalidade do curso ' , nomeCurso , ' (turno ' , turnoCurso , ') é R$ ', mensalidadeCurso , '.') AS Consulta_mensalidade
	FROM tb_curso
	WHERE nomeCurso = pesquisaCurso;
	SELECT 'Consulta gerada com sucesso!' AS 'Status_consulta';
END //
DELIMITER ;  
```
&nbsp;
&nbsp;  
**Invocando o procedimento**
```mysql
CALL consultarMensalidade('Direito');
```
###### * Output:  
| Status_consulta              |
| :---                         |
| Consulta gerada com sucesso! |

| Consulta_mensalidade                                           |
| :---                                                           |
| O valor da mensalidade do curso Direito (turno M) é R$ 876.28. |
| O valor da mensalidade do curso Direito (turno N) é R$ 950.28. |

&nbsp;
&nbsp;  
**Invocando o procedimento novamente, usando outro argumento**
```mysql
CALL consultaMensalidade('Design Gráfico');
```
###### * Output:  
| Status_consulta              |
| :---                         |
| Consulta gerada com sucesso! |

| Consulta_mensalidade                                                  |
| :---                                                                  |
| O valor da mensalidade do curso Design Gráfico (turno M) é R$ 622.05. |
| O valor da mensalidade do curso Design Gráfico (turno N) é R$ 670.10. |

&nbsp;
&nbsp;    
**Excluindo o procedimento acima**
```mysql
DROP PROCEDURE consultaMensalidade;
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/Banco-de-Dados-MySQL-Fundamentos">[Voltar à tela inicial do repositório]</a>
</div>