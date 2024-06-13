> **Adicionando filtros às consultas (operadores AND, OR, NOT, IN, NOT IN e BETWEEN)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;   
**A tabela para exemplo:** 
| idAluno | nomeAluno         |	sexoAluno | dNascimentoAluno | cidadeAluno    | estado Aluno |
| :---    | :---              | :---      | :---             | :---  	      | :---         |
| 1       | Luana Borba       |	F         | 2004-02-10		 | Curitiba       | PR           |
| 2	      | Mariana Fernandes | F         | 1991-03-23		 | Rio de Janeiro | RJ           |
| 3	      | Cátia Marcondes   |	F         |	2000-01-05		 | Pato Branco    | PR           |
| 4	      | Marcos Góes       |	M         |	1987-03-18		 | Florianópolis  | SC           |
| 5	      | Enzo Marques      | M         | 2002-05-14 		 | Curitiba       | PR           |
| 6	      | Carla Santana     | F         | 1986-01-24 		 | Santo André    | SP           |
| 7	      | Sandra de Paula   | F         | 1997-02-12		 | Curitiba       | PR           |
| 8	      | Paulo Figueiredo  | M         | 1999-06-02  	 | Erechim        | RS           |
| 9	      | Larissa Torres    | F         |	2003-04-07		 | Paranaguá      | PR           |
| 10      |	Vinícius Motta    | M         | 1994-02-13		 | Porto Alegre   | RS           |

&nbsp;

## Operadores AND, OR e NOT
```
São operadores lógicos que - utilizados juntamente com a cláusula `WHERE` - filtram registros, através da comparação de duas ou mais condições.
```

&nbsp;
     
**1.1. Operador AND ('E' lógico)**  
Retorna registro(s), apenas se ambas as condições comparadas forem verdadeiras
```mysql
SELECT idAluno, nomeAluno, sexoAluno, estadoAluno 
FROM tb_aluno 
WHERE idAluno > 2 AND sexoAluno = 'F' AND estadoAluno='PR';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | estado Aluno |
| :---    | :---              | :---      | :---         |
| 3	      | Cátia Marcondes   |	F         |	PR           |
| 7	      | Sandra de Paula   | F         |	PR           |
| 9	      | Larissa Torres    | F         | PR           |

&nbsp;
     
## Operador OR ('OU' lógico)
```
Retorna registro(s), desde que alguma das condições comparadas seja verdadeira
```

```mysql
SELECT idAluno, nomeAluno, sexoAluno, estadoAluno 
FROM tb_aluno 
WHERE estadoAluno='PR' OR sexoAluno = 'F';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | estado Aluno |
| :---    | :---              | :---      | :---         |
| 1       | Luana Borba       |	F         |	PR           |
| 2	      | Mariana Fernandes | F         | RJ           |
| 3	      | Cátia Marcondes   |	F         |	PR           |
| 5	      | Enzo Marques      | M         | PR           |
| 6	      | Carla Santana     | F         | SP           |
| 7	      | Sandra de Paula   | F         |	PR           |
| 9	      | Larissa Torres    | F         | PR           |

&nbsp;
     
## Operador NOT (Negação lógica)
```
Nega o filtro aplicado, conforme demonstrado no exemplo abaixo.
```

```mysql
SELECT nomeAluno, sexoAluno 
FROM tb_aluno 
WHERE idAluno > 2 AND NOT sexoAluno = 'F';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | 
| :---    | :---              | :---      |
| 4	      | Marcos Góes       |	M         |	
| 5	      | Enzo Marques      | M         | 
| 8	      | Paulo Figueiredo  | M         | 
| 10      |	Vinícius Motta    | M         | 

&nbsp;
     
**2. Operadores IN e NOT IN**  
São operadores - utilizados juntamente com a cláusula `WHERE` - que retornam (ou não) elementos contidos em um determinado conjunto de dados.

&nbsp;     
    
**2.1. OPERADOR IN**  
- Retorna um valor (ou conjunto de valores) pertencente(s) ao conjunto de dados. 
- Neste exemplo, desejo filtrar alunos cadastrados que sejam de apenas duas cidades parananeses abaixo informadas.
```mysql
SELECT nomeAluno, cidadeAluno 
FROM tb_aluno
WHERE cidadeAluno IN ('Curitiba','Pato Branco');
```
###### * Output:  
| nomeAluno         | cidadeAluno    |
| :---              | :---    	     |
| Luana Borba       | Curitiba       |
| Cátia Marcondes   | Pato Branco    |
| Enzo Marques      | Curitiba       |
| Sandra de Paula   | Curitiba       |

&nbsp;
     
**2.2. OPERADOR NOT IN**  
- Retorna um valor (ou conjunto de valores) *não* pertencente(s) ao conjunto de dados.
- Neste exemplo, desejo filtrar alunos cadastrados que *não* estejam baseados em nenhum dos três estados do sul do Brasil.
```mysql
SELECT nomeAluno, estadoAluno 
FROM tb_aluno
WHERE estadoAluno NOT IN ('PR','RS','SC');
```
###### * Output:  
| nomeAluno         | estado Aluno |
| :---              | :---         |
| Mariana Fernandes | RJ           |
| Carla Santana     | SP           |

&nbsp;
     
**3. OPERADOR BETWEEN**  
- Especifica uma faixa de valores a serem retornados.
```mysql
SELECT nomeAluno, dNascimentoAluno 
FROM tb_aluno
WHERE dNascimentoAluno BETWEEN '2000-01-01' AND '2004-12-31' 
ORDER BY dNascimentoAluno DESC; 
```
###### * Output: 
| nomeAluno         | dNascimentoAluno | 
| :---              | :---             |  
| Luana Borba		| 2004-02-10       |
| Larissa Torres	| 2003-04-07       |
| Enzo Marques		| 2002-05-14       |
| Cátia Marcondes	| 2000-01-05       |

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>