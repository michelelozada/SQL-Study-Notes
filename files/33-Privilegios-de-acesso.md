> **Atribuindo e revogando privilégios de acesso (comandos GRANT e REVOKE)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
Para fins de segurança, SGBDs oferecem recursos para conceder acesso parcial ou mesmo limitar o acesso ao mesmo.  
&nbsp;  
Para isso são utilizados dois comandos principais: o **`GRANT`** para atribuição de privilégios e o **`REVOKE`** para a revogação
dos mesmos.  
&nbsp;
     
&nbsp;  
**1- Visualizando os privilégios atuais de um usuário já cadastrado no sistema**
```mysql

SHOW GRANTS FOR 'michele'@'localhost';
SHOW GRANTS FOR 'enzo'; -- sem @'localhost' significa que usuário também pode acessar sistema remotamente
```
     
&nbsp;   
**2 - Criando um usuário com privilégios globais** 
```mysql

GRANT ALL 
ON *.* -- notação *.* representa todos os bancos de dados e todas as tabelas. 
TO 'daniel'@'localhost'; 
```
```mysql

GRANT ALL 
ON *.* 
TO 'murilo'@'localhost' 
WITH GRANT OPTION; -- com esta adição, usuário tem tb. privilégio de conceder privilégios a outros usuários
```
     
&nbsp;     
**3 - Atribuindo privilégios específicos para um usuário**
```mysql

GRANT SELECT, UPDATE
ON bd_empresa.*  -- notação * significa que todas as tabelas deste banco de dados poderão ser visualizadas e atualizadas pelo usuário
TO 'rogerio';
```
```mysql

GRANT SELECT, INSERT, UPDATE, DELETE
ON bd_empresa.tb_clientes  -- significa que apenas a tabela especificada poderá ser visualizadas e ter dados inseridos, atualizados e removidos
TO 'rogerio';
```
     
&nbsp;    
**4 - Atribuindo privilégios específicos para um usuário em apenas determinados campos de uma tabela**
```mysql

GRANT SELECT(nome_cliente, telefone_cliente), UPDATE(telefone_cliente)
ON bd_empresa.tb_clientes 
TO 'rogerio';
```
     
&nbsp;    
**5 - Revogando apenas determinados privilégios de um usuário *(ver exemplo acima, onde quero revogar apenas a permissão para UPDATE)***
```mysql

REVOKE UPDATE
ON bd_empresa.tb_clientes
FROM 'rogerio';
```
     
&nbsp;    
**6 - Revogando todos os privilégios concedidos**
```mysql

REVOKE ALL
FROM 'daniel'@'localhost';
```
```mysql

REVOKE ALL, GRANT OPTION  -- use esta opção para usuários a quem foi concedido o privilégio WITH GRANT OPTION
FROM 'murilo'@'localhost';
```