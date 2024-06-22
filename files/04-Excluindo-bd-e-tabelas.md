> **Excluindo banco de dados e tabelas (comando DROP)**     
> Repositório: Banco de Dados MySQL - Fundamentos    
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Comando DROP    
```
Permite a exclusão de bancos de dados e tabelas
```

&nbsp;

### • Para a exclusão de um banco de dados
Utilize o comando `DROP DATABASE` para remover o banco de dados especificado, apagando toda a estrutura,
tabelas e dados existentes nelas.

```mysql

DROP DATABASE nome_do_banco_de_dados;
````
**Obs:** Podem ser inclusas as palavras-chave `IF EXISTS` (porém é opcional).  

&nbsp;

````mysql

DROP DATABASE IF EXISTS nome_do_banco_de_dados;
````

&nbsp;
     
### • Para a exclusão de uma tabela
Utilize o comando `DROP TABLE` para excluir a estrutura da tabela especificada, juntamente com todas as 
restrições e dados existentes nela.

```mysql

DROP TABLE nome_da_tabela;
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>