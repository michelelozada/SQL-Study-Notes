> **Utilizando os operadores AND, OR, NOT, IN e NOT IN**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;   
**A tabela para exemplo:** 
| idAluno | nomeAluno         |	sexoAluno | cidadeAluno    | estado Aluno |
| ------  | ------            | ------    | ------  	   | ------       |
| 1       | Luana Borba       |	F         |	Curitiba       | PR           |
| 2	      | Mariana Fernandes | F         | Rio de Janeiro | RJ           |
| 3	      | Cátia Marcondes   |	F         |	Pato Branco    | PR           |
| 4	      | Marcos Góes       |	M         |	Florianópolis  | SC           |
| 5	      | Enzo Marques      | M         | Curitiba       | PR           |
| 6	      | Carla Santana     | F         | Santo André    | SP           |
| 7	      | Sandra de Paula   | F         |	Curitiba       | PR           |
| 8	      | Paulo Figueiredo  | M         | Erechim        | RS           |
| 9	      | Larissa Torres    | F         | Paranaguá      | PR           |
| 10      |	Vinícius Motta    | M         | Porto Alegre   | RS           |

&nbsp;

&nbsp;  
**1. Operadores AND, OR e NOT**  
São operadores lógicos que - utilizados juntamente com a cláusula WHERE - filtram registros, através da comparação de duas ou mais condições.
&nbsp;
     
&nbsp;      
**1.1. Operador AND ('E' lógico)**  
Retorna registro(s), apenas se ambas as condições comparadas forem verdadeiras
```mysql
SELECT idAluno, nomeAluno, sexoAluno, estadoAluno FROM tb_aluno 
WHERE idAluno > 2 AND sexoAluno = 'F' AND estadoAluno='PR';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | estado Aluno |
| ------  | ------            | ------    | ------       |
| 3	      | Cátia Marcondes   |	F         |	PR           |
| 7	      | Sandra de Paula   | F         |	PR           |
| 9	      | Larissa Torres    | F         | PR           |

&nbsp;
     
&nbsp;     
**1.2. Operador OR ('OU' lógico)**
Retorna registro(s), desde que alguma das condições comparadas seja verdadeira
```mysql
SELECT idAluno, nomeAluno, sexoAluno, estadoAluno FROM tb_aluno 
WHERE estadoAluno='PR' OR sexoAluno = 'F';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | estado Aluno |
| ------  | ------            | ------    | ------       |
| 1       | Luana Borba       |	F         |	PR           |
| 2	      | Mariana Fernandes | F         | RJ           |
| 3	      | Cátia Marcondes   |	F         |	PR           |
| 5	      | Enzo Marques      | M         | PR           |
| 6	      | Carla Santana     | F         | SP           |
| 7	      | Sandra de Paula   | F         |	PR           |
| 9	      | Larissa Torres    | F         | PR           |

&nbsp;
     
&nbsp;    
**1.3. Operador NOT (Negação lógica)**
Nega o filtro aplicado, conforme demonstrado no exemplo abaixo.
```mysql
SELECT * FROM tb_aluno 
WHERE idAluno > 2 AND NOT sexoAluno = 'F';
```
###### * Output:  
| idAluno | nomeAluno         |	sexoAluno | cidadeAluno    | estado Aluno |
| ------  | ------            | ------    | ------  	   | ------       |
| 4	      | Marcos Góes       |	M         |	Florianópolis  | SC           |
| 5	      | Enzo Marques      | M         | Curitiba       | PR           |
| 8	      | Paulo Figueiredo  | M         | Erechim        | RS           |
| 10      |	Vinícius Motta    | M         | Porto Alegre   | RS           |

&nbsp;
     
&nbsp;     
**2. Operadores IN e NOT IN**  
São operadores - utilizados juntamente com a cláusula WHERE - que retornam (ou não) elementos contidos em um determinado conjunto de dados.
&nbsp;
     
&nbsp;    
**2.1. OPERADOR IN**  
- Retorna um valor (ou conjunto de valores) pertencente(s) ao conjunto de dados. 
- Neste exemplo, desejo filtrar alunos cadastrados que sejam de apenas duas cidades parananeses abaixo informadas.
```mysql
SELECT nomeAluno, cidadeAluno FROM tb_aluno
WHERE cidadeAluno IN ('Curitiba','Pato Branco');
```
###### * Output:  
| nomeAluno         | cidadeAluno    |
| ------            | ------    	 |
| Luana Borba       | Curitiba       |
| Cátia Marcondes   | Pato Branco    |
| Enzo Marques      | Curitiba       |
| Sandra de Paula   | Curitiba       |

&nbsp;
     
&nbsp;    
**2.2. OPERADOR NOT IN**  
- Retorna um valor (ou conjunto de valores) *não* pertencente(s) ao conjunto de dados.
- Neste exemplo, desejo filtrar alunos cadastrados que *não* estejam baseados em nenhum dos três estados do sul do Brasil.
```mysql
SELECT nomeAluno, estadoAluno FROM tb_aluno
WHERE estadoAluno NOT IN ('PR','RS','SC');
```
###### * Output:  
| nomeAluno         | estado Aluno |
| ------            | ------       |
| Mariana Fernandes | RJ           |
| Carla Santana     | SP           |