> **Gerenciando usuários do sistema**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**1 - Consultando os usuários existentes no sistema**
```mysql
SELECT User FROM mysql.user;
```
&nbsp;  
**2 - Consultando os usuários existentes, junto à informação dos hosts com os quais eles podem se conectar ao sistema**
```mysql
SELECT User, Host FROM mysql.user;
```
&nbsp;  
**3 - Criando um usuário para o banco de dados**  
&nbsp;  
*Sintaxe básica*
```mysql
CREATE USER 'nome_do_usuario'@'host_do_usuario' IDENTIFIED BY 'senha_do_usuario';
```
&nbsp;  
*Para acessar o banco de dados apenas via localhost*
```mysql
CREATE USER 'laura'@'localhost' IDENTIFIED BY '1234';
```
&nbsp;  
*Para acessar o banco de dados via localhost ou remotamente* 
```mysql
CREATE USER 'davi' IDENTIFIED BY '1234';
```
&nbsp;  
**4 - Para gerar um usuário sem uma senha no momento da sua criação**
```mysql
CREATE USER 'enzo'@'localhost';
```
&nbsp;  
**5 - Atribuindo uma senha para um usuário previamente criado**
```mysql
SET PASSWORD FOR 'enzo'@'localhost' = PASSWORD('4321');
```
&nbsp;  
**6 - Renomeando um usuário**
```mysql
RENAME USER 'laura'@'localhost' TO 'luana'@'localhost'; 
```
&nbsp;  
**7- Excluindo um usuário**
```mysql
DROP USER 'laura'@'localhost';
```
```mysql
DROP USER 'davi';
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>