> **Eliminando repetições de linhas em uma seleção (cláusula DISTINCT)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**DISTINCT**  
- O comando `SELECT`, por padrão, é acompanhado do cláusula `ALL`, que apresenta todos os resultados retornados, ainda que contenham repetições.
- Quando se deseja o retono de *apenas* valores únicos de um determinado campo, basta que se utilize o modificador `DISTINCT`, logo após o comando `SELECT`.
&nbsp;
     
&nbsp;

**A tabela de exemplo:**  
| idAula | nomeAula      | turnoAula | modalidadeAula |
| ----   | ----          | ----      | ----           |
| 1		 | Yoga		     | M	     | online         |
| 2	     | Yoga		     | M	     | presencial	  | 	
| 3	     | Yoga		     | N	     | online		  |	
| 4	     | Tai chi chuan | M	     | presencial     |
| 5	     | Tai chi chuan | T	     | presencial     |
| 6	     | Tai chi chuan | T	     | online         | 
| 7	     | Alongamento	 | M	     | presencial     |
| 8	     | Alongamento	 | M	     | online         |
| 9	     | Pilates	     | M	     | presencial     |
| 10     | Pilates	     | T	     | presencial     |

&nbsp;
     
&nbsp;
**Utilizando a cláusula `DISTINCT`:**  
```mysql
SELECT DISTINCT nomeAula AS Aulas_ofertadas
FROM tb_aulas
ORDER BY nomeAula;
```
###### * Output: 
| Aulas_ofertadas |
| ----            |
| Alongamento     |
| Pilates         |
| Tai chi chuan   |
| Yoga            |

&nbsp;
     
&nbsp; 
**Caso haja a necessidade de contar o número dos registros únicos, basta utilizar a função `COUNT()`**
```mysql
SELECT COUNT(DISTINCT nomeAula) AS Número_Aulas_ofertadas
FROM tb_aulas
ORDER BY nomeAula;
```
###### * Output: 
| Número_Aulas_ofertadas | 
| ----                   |
| 4                      |

&nbsp;
     
&nbsp;   
**É possível também informar mais de um campo, conforme demonstrado abaixo:**
```mysql
SELECT DISTINCT nomeAula, modalidadeAula AS Modalidades_das_Aulas
FROM tb_aulas
ORDER BY nomeAula;
```
###### * Output: 
|nomeAula        | modalidadeAula |
| ----           | ----           |
| Alongamento    | online         |
| Alongamento    | presencial     |
| Pilates        | presencial     |
| Tai chi chuan  | online         |
| Tai chi chuan	 | presencial     |
| Yoga	         | online         |
| Yoga	         | presencial     |