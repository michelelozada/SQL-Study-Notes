> **Alterando estruturas de tabelas (comando ALTER TABLE)**    
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
## Comando ALTER TABLE
```
- Comando utilizado para modificar as características de uma tabela já existente, através da:  
  . Inclusão ou exclusão de colunas desta tabela  
  . Adição, alteração ou remoção de restrições (ex: PRIMARY KEY, UNIQUE, NOT NULL, etc.) de uma
  coluna - ver mais no arquivo sobre constraits deste repositório  
  . Alteração do tipo de dado ou tamanho definidos para uma coluna  
  . Alteração do nome de tabelas ou colunas já existentes no banco de dados
```	

&nbsp;
     
> As tabelas para os exemplos:

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
  CONSTRAINT idAluno FOREIGN KEY (idAluno_fk),
  PRIMARY KEY(idContrato)
);
```

&nbsp;
     
> 'Dropando' uma das colunas da tabela:
```mysql

ALTER TABLE tb_aluno
DROP COLUMN foneAluno;
```

&nbsp;

> Adicionando uma coluna à tabela
```mysql

ALTER TABLE tb_aluno
ADD COLUMN foneAluno varchar(11) 
AFTER emailAluno;
```
     
&nbsp;

> Modificando o tipo de dado ou tamanho de uma coluna
```mysql

ALTER TABLE tb_aluno
MODIFY COLUMN foneAluno int(11); -- aqui alterei o tipo de dado de varchar para int
```
```mysql

ALTER TABLE tb_aluno
MODIFY COLUMN nomeAluno varchar(60); -- aqui aumentei o tamano da coluna
```

&nbsp;

> Alterando o nome de uma tabela
```mysql

ALTER TABLE tb_aluno RENAME TO tbAluno; 
```

> Ou alternativamente:
```mysql

RENAME TABLE tb_aluno TO tbAluno;
```

> Para alterar vários nomes de tabelas ao mesmo tempo:
```mysql

RENAME TABLE 
  tb_aluno TO tbAluno, 
  tb_professor TO tbProfessor, 
  tb_departamento TO tbDepartamento; 
```
     
&nbsp;  

> Alterando o nome da coluna de uma tabela
```mysql

ALTER TABLE tb_aluno
RENAME COLUMN nomeAluno TO nome_aluno; 
```
> Ou alternativamente:
```mysql 

ALTER TABLE tb_alunos
CHANGE nomeAluno nome_aluno varchar(50);
```
Obs: Após o CHANGE, colocar nome atual da tabela, seguindo ao novo nome com a definição do tipos dos dados  

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>