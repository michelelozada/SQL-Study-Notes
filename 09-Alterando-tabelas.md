> Alterando a estrutura de uma tabela (comando ALTER)  
> Repositório: Comandos Markdown  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
**As tabelas para o exemplo**   

```
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY NOT NULL,
	nomeAluno varchar(40),
    cpfAluno varchar(15),
    foneAluno varchar(11),
    emailAluno varchar(50)
);
```
```
CREATE TABLE tb_contrato(
	idContrato int(11) PRIMARY KEY NOT NULL,
	idAluno int(11) NOT NULL
);
```
&nbsp;
     
&nbsp;
**1. 'Dropando' uma coluna da tabela**  
```
ALTER TABLE tb_aluno
DROP COLUMN foneAluno;
```
&nbsp;
     
&nbsp;
**2. Adicionando uma coluna à tabela**  
```
ALTER TABLE tb_aluno
ADD COLUMN foneAluno varchar(11) AFTER emailAluno;
```
&nbsp;
     
&nbsp;
**3. Removendo uma chave primária**  
```
ALTER TABLE tb_aluno
DROP PRIMARY KEY;
```
&nbsp;
     
&nbsp;
**4. Adicionando uma chave primária**  
```
ALTER TABLE tb_aluno
ADD PRIMARY KEY (idAluno);
```
&nbsp;
     
&nbsp;
**5. Adicionando uma chave estrangeira**  
```
ALTER TABLE tb_contrato
ADD CONSTRAINT fk_idAluno
FOREIGN KEY (idAluno)
REFERENCES tb_aluno(idAluno);
```
&nbsp;
     
&nbsp;
**6. Removendo uma chave estrangeira**  
```
ALTER TABLE tb_contrato
DROP CONSTRAINT fk_idAluno;
```
&nbsp;
     
&nbsp;
**7. Modificando o tipo de dado ou restrição de uma coluna**  
```
ALTER TABLE tb_ALUNO
MODIFY COLUMN foneAluno int(11);
```
```
ALTER TABLE tb_ALUNO
MODIFY COLUMN cpfAluno varchar(15) UNIQUE;
```