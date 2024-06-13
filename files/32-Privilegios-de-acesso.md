> **Gerenciando privilégios de acesso (comandos GRANT e REVOKE)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Comandos GRANT e REVOKE
```
- Para fins de segurança, os SGBDs oferecem recursos para conceder ou limitar direitos dos usuários
junto a tabelas e visões de um banco de dados  
  
- Para isso são utilizados dois comandos principais: o GRANT para atribuição de permissões e o REVOKE 
para a revogação destes priviégios  
  
- Para criar usuários para a posterior atribuição de privilégios, seguir os rocedimentos que estão 
descritos no arquivo 'Gerenciando usuários do sistema', deste repositório  
```
     
&nbsp;  

**1- Visualizando os privilégios atuais de um usuário já cadastrado no sistema**
```mysql

SHOW GRANTS FOR 'michele'@'localhost';
SHOW GRANTS FOR 'enzo'; -- sem @'localhost' significa que usuário também pode acessar o sistema remotamente
```
&nbsp;   

**2 - Criando um usuário com privilégios globais** 
```mysql

GRANT ALL PRIVILEGES -- ou seja, representa todos os direitos
ON *.*     -- notação *.* representa todas as bases de dados e todas as suas tabelas/visões
TO 'daniel'@'localhost'; 
```
```mysql

GRANT ALL PRIVILEGES
ON *.* 
TO 'murilo'@'localhost' 
WITH GRANT OPTION;  -- permite que este usuário conceda ou revogue privilégios de outros usuários (iguais aos usuário root)
```
```mysql

GRANT ALL PRIVILEGES
ON bd_empresa.tb_clientes 
TO 'marcos'@'localhost' ;  -- todos os privilégios, porém relacionados tão somente à tabela especificada
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
ON bd_empresa.tb_clientes  -- significa que apenas a tabela especificada poderá ser visualizada e ter dados inseridos, atualizados e removidos
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

REVOKE ALL PRIVILEGES
on bd_empresa.tb_clientes  -- revogando privégios apenas em uma tabela da base de dados
FROM 'marcos'@'localhost';
```
```mysql

REVOKE ALL PRIVILEGES, GRANT OPTION  -- use esta opção para usuários a quem foi concedido o privilégio WITH GRANT OPTION
FROM 'murilo'@'localhost';
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>