> **Atualizando valores em uma tabela (comando UPDATE)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**UPDATE**  
- Atualiza/altera dados pré-cadastrados em uma tabela do banco de dados;
- Deve ser utilizado juntamente com a cláusula `SET`, que tem a função de determinar qual o campo será atualizado;
&nbsp;
     
&nbsp;  
**1. A tabela de exemplo:**  
| idAluno  | nomeAluno         | cidadeAluno    | estadoAluno |
| :---     | :---              | :---           | :---        |
| 1        | Luana Borba       | Curitiba       | PR          |
| 2        | Mariana Fernandes | Rio de Janeiro | RJ          |
| 3        | Cátia Marcondes   | Santo André    | SP          |
| 4        | Marcos Góes       | Florianópolis  | SC          |

&nbsp;

&nbsp;
**2. Atualizando um registro da tabela:**  
- Deve ser utilizado juntamente com a cláusula `WHERE`, quando for necessária a especificação de qual registro terá seus dados atualizados.
```mysql
UPDATE tb_aluno 
SET nomeAluno = 'Marcos Góes Filho' 
WHERE idAluno = 4;  -- foi retificado o nome do aluno
```
###### * Output:  
| idAluno  | nomeAluno         | cidadeAluno    | estadoAluno |
| :---     | :---              | :---           | :---        |
| 1        | Luana Borba       | Curitiba       | PR          |
| 2        | Mariana Fernandes | Rio de Janeiro | RJ          |
| 3        | Cátia Marcondes   | Santo André    | SP          |
| 4        | Marcos Góes Filho | Florianópolis  | SC          |

&nbsp;
&nbsp;  
* Para  atualização de mais de um campo:
```mysql
UPDATE tb_aluno 
SET cidadeAluno = 'Porto Alegre', estadoAluno='RS' 
WHERE idAluno = 4; 
```
###### * Output:  
| idAluno  | nomeAluno         | cidadeAluno    | estadoAluno |
| :---     | :---              | :---           | :---        |
| 1        | Luana Borba       | Curitiba       | PR          |
| 2        | Mariana Fernandes | Rio de Janeiro | RJ          |
| 3        | Cátia Marcondes   | Santo André    | SP          |
| 4        | Marcos Góes Filho | Porto Alegre   | RS          |

&nbsp;
&nbsp;  
* ATT: Caso não seja utilizada a cláusula WHERE, todos os registros da tabela serão atualizados com a mesma informação!
```mysql
UPDATE tb_aluno 
SET cidadeAluno = 'Curitiba', estadoAluno="PR";
```
###### * Output:  
| idAluno  | nomeAluno          | cidadeAluno | estadoAluno |
| :---     | :---               | :---        | :---        |
| 1        | Luana Borba        | Curitiba    | PR          |
| 2        | Mariana Fernandes  | Curitiba    | PR          |
| 3        | Cátia Marcondes    | Curitiba    | PR          |
| 4        | Marcos Góes Filho	| Curitiba    | PR          |