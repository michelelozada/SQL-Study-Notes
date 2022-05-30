> **Atualizando valores em uma tabela (comando UPDATE)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**UPDATE**  
- Atualiza os dados pré-cadastrados em uma tabela do banco de dados;
- Deve ser utilizado juntamente com a cláusula SET, que tem a função de determinar qual o campo será atualizado;
&nbsp;
     
&nbsp;  
**1. A tabela de exemplo:**  
```mysql
CREATE TABLE tb_aluno(
    idAluno int(11) PRIMARY KEY NOT NULL,
    nomeAluno varchar(50) NOT NULL,
    cidadeAluno varchar(40) NOT NULL,
	estadoAluno char(2) NOT NULL
);

INSERT INTO tb_aluno(idAluno,nomeAluno,cidadeAluno,estadoAluno) 
VALUES 
(01, 'Luana Borba', 'Curitiba','PR'),
(02, 'Mariana Fernandes', 'Rio de Janeiro','RJ'),
(03, 'Cátia Marcondes', 'Santo André','SP'),
(04, 'Marcos Góes', 'Florianópolis','SC')
```
&nbsp;

&nbsp;
**1. Atualizando um dos registros:**  
- Deve ser utilizado juntamente com a cláusula WHERE, quando for necessária a especificação de qual registro terá seus dados atualizados.
```mysql
UPDATE tb_aluno SET nomeAluno = 'Marcos Góes Filho' WHERE idAluno = '4';
```
###### * Output:  
| ID Aluno | Nome aluno | Cidade   | Estado |
| ------   | -----      | -----    | -----  |
| 1	| Luana Borba | Curitiba | PR |
| 2	| Mariana Fernandes | Rio de Janeiro | RJ |
| 3	| Cátia Marcondes | Santo André | SP |
| 4	| Marcos Góes Filho	| Florianópolis | SC |

&nbsp;
&nbsp;  
* ATT: Caso não seja utilizada a cláusula WHERE, todos os registros da tabela serão atualizados com a mesma informação!
```mysql
UPDATE tb_aluno SET cidadeAluno = 'Curitiba', estadoAluno="PR";
```
###### * Output:  
| ID Aluno | Nome aluno | Cidade   | Estado |
| ------   | -----      | -----    | -----  |
| 1	| Luana Borba | Curitiba | PR |
| 2	| Mariana Fernandes | Curitiba | PR |
| 3	| Cátia Marcondes | Curitiba | PR |
| 4	| Marcos Góes Filho	| Curitiba | PR |