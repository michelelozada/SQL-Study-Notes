> **Operações e funções matemáticas**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;      
**1. Operações matemáticas**
     
&nbsp;           

**1.1. Operações básicas**  
```mysql
SELECT (5 + 2) * (6 - 4) / 2;  -- Retorna: 7.0000
```
```mysql
# módulo (retorna o resto de um número dividido por outro)
SELECT 14 MOD 3;  -- Retorna:  2
```
```mysql
# divisão de inteiros
SELECT 14 DIV 2;  -- Retorna: 7
```

&nbsp;
   
**1.2. Também é possível realizar operações aritméticas com os dados dos campos de uma tabela, conforme exemplo abaixo:**  

A tabela de exemplo:
| idAluno | nomeAluno         | notaObtida1 | notaObtida2 |
| :---    | :---              | :---        | :---        |
| 1	      | Luana Borba	      | 75          | 85          | 
| 2	      | Mariana Fernandes |	54          | 62          |
| 3	      | Cátia Marcondes	  | 68          | 74          |
| 4	      | Marcos Góes	      | 89          | 98          |
| 5	      | Enzo Marques	  | 78	        | 87          |
| 6	      | Carla Santana	  | 55          | 71          |

&nbsp;
       
Abaixo, a criação de uma consulta que calcula o valor da média final dos alunos com base nas notas previamente obtidas:  
```mysql
SELECT nomeAluno, (notaObtida1 + notaObtida2) DIV 2 AS mediaFinal 
FROM tb_aluno 
ORDER BY mediaFinal DESC;
```
###### * Output:  
| nomeAluno  	    | mediaFinal |
| :---              | :---       |
| Marcos Góes	    | 93         |
| Enzo Marques	    | 82         |
| Luana Borba	    | 80         |
| Cátia Marcondes   | 71         |
| Carla Santana	    | 63         |
| Mariana Fernandes | 58         |

&nbsp;
      
**2 - Funções matemáticas:**
     
&nbsp;      

**Função ABS():**  
Retorna o valor absoluto de um número
```mysql
SELECT abs(-3);  -- Retorna: 3
```

&nbsp;
      
**Função CEILING() ou CEIL():**  
'Arredonda' um número para cima | Retorna o próximo valor inteiro mais alto 
```mysql
SELECT CEILING(5.4);  -- Retorna: 6
SELECT CEIL(2.00005);  -- Retorna: 3
```

&nbsp;
       
**Função FLOOR():**  
'Arredonda' um número para baixo | Retorna o menor valor inteiro
```mysql
SELECT FLOOR(4.6);  -- Retorna: 4
SELECT FLOOR(2.9);  -- Retorna: 2 
```

&nbsp;
      
**Função MOD():**  
Retorna o resto da divisão de dois números
```mysql
SELECT MOD(10,2); -- Retorna: 0
SELECT MOD(24,5); -- Retorna: 4
```

&nbsp;       

**Função PI():**  
Retorna o valor do número PI
```mysql
SELECT PI(); -- Retorna: 3.141593
```

&nbsp;       

**Função POW() ou POWER():**  
Retorna o valor de um número elevado a outro
```mysql
SELECT POW (2,3); -- Retorna: 8
SELECT POWER(4,2); -- Retorna: 16
```

&nbsp;       

**Função RAND():**    
Retorna um valor decimal aleatório  ente 0 e 1
```mysql
SELECT RAND(); -- Retorna: 1ª execução: 0.535259797736313  2ª execução: 0.596689887900548
```

&nbsp;       

**Função ROUND():**  
Retorna um número decimal (passado como primeiro argumento) com o número de casas decimais (passado como segundo argumento). Será sempre arrendondado. *(Consultar também função TRUNCATE())* 
```mysql
SELECT ROUND(2564.2354,2);  -- Retorna: 2564.24
```
```mysql
-- Caso não se indique o número de casas decimais:
SELECT ROUND(1.6548,0);  -- Retorna: 2
```

&nbsp;       

**Função SQRT():**    
Retorna a raiz quadrada do número informado. 
```mysql
SELECT SQRT(25);  -- Retorna: 5
```

&nbsp;        

**Função TRUNCATE():**     
Retorna um número decimal (passado como primeiro argumento) com o número de casas decimais (passado como segundo argumento). Não há arrendondamento. *(Consultar também função ROUND())*
```mysql
SELECT TRUNCATE(2564.2354,2); -- Retorna: 2564.23
SELECT TRUNCATE(PI(),2);  -- Retorna: 3.14
```
```mysql
-- Caso não se indique o número de casas decimais:
SELECT TRUNCATE(1.6548,0); -- Retorna: 1
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>