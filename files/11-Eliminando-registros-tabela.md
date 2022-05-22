> **Eliminando registros de uma tabela (comandos DELETE e TRUNCATE)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**DELETE e TRUNCATE**  
- Comandos que removem linhas de dados de uma tabela no banco de dados.
&nbsp;
     
&nbsp;  
**1. A tabela de exemplo:**  
| ID Aluno | Nome aluno | Cidade   | Estado |
| ------   | -----      | -----    | -----  |
| 1        | Luana Borba       | Curitiba       | PR |
| 2        | Mariana Fernandes | Rio de Janeiro | RJ |
| 3        | Cátia Marcondes   | Santo André    | SP |
| 4        | Marcos Góes Filho | Florianópolis  | SC |

&nbsp;
     
&nbsp;  
**2. O comando DELETE**  
* Permite apagar os registros de uma tabela.  
* Se utilizado *com* a cláusula WHERE, removerá dados apenas da tupla especificada.  
```
DELETE FROM tb_aluno WHERE idAluno = '4'; -- apagará registros apenas da aluna Cátia
```
* Se utilizado *sem* o filtro WHERE, apagará todos os registros da tabela.  
```
DELETE FROM tb_aluno; -- irá apagar os dados de todos os alunos  
```
&nbsp;
     
&nbsp;  
**3. O comando TRUNCATE **  
* Elimina completamente os registros de uma tabela.  
* Não utiliza a cláusula WHERE, portanto atuará sobre todos os registros ali inseridos.  
```
TRUNCATE TABLE tb_aluno; -- removerá os dados de todos os alunos   
```
&nbsp;
     
&nbsp;  
**4. Qual a diferença entre DELETE e TRUNCATE?**    
Há várias diferenças entre os dois comandos, sendo que uma delas se refere ao que acontece a campos
definidos com AUTO_INCREMENT, depois que DELETE ou TRUNCATE são aplicados.  
Depois de todos os registros de uma tabela terem sido apagados com **DELETE**, veja o que acontece 
no campo *idAluno* quando novos dados são inseridos na tabela: 
| ID Aluno | Nome aluno | Cidade   | Estado  |
| ------   | -----      | -----    | -----   |
| 5	| Enzo Marques	    | Pato Branco   | PR |
| 6 | Carla Santana     | Maricá	    | RJ |
| 7 | Sandra de Paula   | Riberão Preto	| SP |
| 8 | Paulo Figueiredo	| Erechim	    | RS |

&nbsp;
     
&nbsp; 
Agora veja o que acontece com a tabela que teve seus dados eliminados com **TRUNCATE** e agora recebe novos 
dados: 
| ID Aluno | Nome aluno | Cidade   | Estado  |
| ------   | -----      | -----    | -----   |
| 1	| Enzo Marques	    | Pato Branco   | PR |
| 2 | Carla Santana     | Maricá	    | RJ |
| 3 | Sandra de Paula   | Riberão Preto	| SP |
| 4 | Paulo Figueiredo	| Erechim	    | RS |

&nbsp;
     
&nbsp; 
**Portanto:**  
* Com o DELETE, a tabela não é ‘resetada’ e novos dados têm seus novos índices contados a partir do último 
índice anteriormente em vigor.  
* Com TRUNCATE, a tabela é apagada e recriada, sendo que seus novos dados têm o valor de seu índice inicial 
começando em 1, por dafault.