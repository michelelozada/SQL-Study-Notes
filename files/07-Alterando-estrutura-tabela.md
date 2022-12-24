> **Alterando a estrutura de uma tabela (comando ALTER TABLE)**    
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
**ALTER TABLE**  
Comando utilizado para modificar as características de uma tabela já existente, através da:  
	- Inclusão ou exclusão de colunas desta tabela;  
	- Adição, alteração ou remoção de restrições (ex: `PRIMARY KEY`, `UNIQUE`, `NOT NULL`, etc.) de uma coluna;  
	- Alteração do tipo de dado definido para uma coluna.  
&nbsp;
     
&nbsp;
**As tabelas para o exemplo:**   

```mysql
CREATE TABLE tb_aluno(
   idAluno int(11) AUTO_INCREMENT NOT NULL,
   nomeAluno varchar(40),
   cpfAluno varchar(15),
   foneAluno varchar(11),
   emailAluno varchar(50),
   PRIMARY KEY(idAluno)
);
```
```mysql
CREATE TABLE tb_contrato(
   idContrato int(11) AUTO_INCREMENT NOT NULL,
   idAluno int(11) NOT NULL,
   PRIMARY KEY(idContrato)
);
```
&nbsp;
     
&nbsp;
**1. 'Dropando' uma das colunas da tabela**  
```mysql
ALTER TABLE tb_aluno
DROP COLUMN foneAluno;
```
&nbsp;

&nbsp;
**2. Adicionando uma coluna à tabela**  
```mysql
ALTER TABLE tb_aluno
ADD COLUMN foneAluno varchar(11) 
AFTER emailAluno;
```
&nbsp;
     
&nbsp;
**3. Removendo uma chave primária**  
```mysql
ALTER TABLE tb_aluno
DROP PRIMARY KEY;
```
&nbsp;
     
&nbsp;
**4. Adicionando uma chave primária**  
```mysql
ALTER TABLE tb_aluno
ADD PRIMARY KEY (idAluno);
```
&nbsp;
     
&nbsp;
**5. Adicionando uma chave estrangeira**  
```mysql
ALTER TABLE tb_contrato
ADD CONSTRAINT fk_idAluno
FOREIGN KEY (idAluno)
REFERENCES tb_aluno(idAluno);
```
&nbsp;
     
&nbsp;
**6. Removendo uma chave estrangeira**  
```mysql
ALTER TABLE tb_contrato
DROP CONSTRAINT fk_idAluno;
```
&nbsp;
     
&nbsp;
**7. Modificando o tipo de dado, tamanho ou a restrição de uma coluna**  
```mysql
ALTER TABLE tb_ALUNO
MODIFY COLUMN foneAluno int(11); -- aqui quis alterar o tipo de dado de varchar para int
```
```mysql
ALTER TABLE tb_ALUNO
MODIFY COLUMN nomeAluno varchar(60); -- aqui aumentei o tamano da coluna
```
```mysql
ALTER TABLE tb_ALUNO
MODIFY COLUMN cpfAluno varchar(15) UNIQUE; -- aqui foi adicionada uma constraint à coluna
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>