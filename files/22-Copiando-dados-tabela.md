> **Copiando dados de uma tabela para outra (comando INSERT ... SELECT)**     
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;     
## Comando INSERT ... SELECT  
```
Permite copiar dados provenientes de uma tabela para outra, armazenando-os no banco de dados
```

&nbsp;
     
A tabela para exemplo, a ***tb_curso:***

| idCurso | nomeCurso | turnoCurso | valorCurso  |
| :---    | :--       | :--        | :---        |
| 01      | Direito   | M          | 876.28      |
| 02      | Direito   | N          | 950.28      |
| 03      | Pedagogia | M          | 249.50      |
| 04      | Pedagogia | N          | 278.50      |
| 05      | Design    | M          | 622.05      |
| 06      | Design    | N          | 670.10      |

&nbsp;

1 - Primeiro é preciso criar a tabela de destino - vou chamá-la de ***tb_curso_new*** - baseada na tabela original:
```mysql
CREATE TABLE tb_curso_new LIKE tb_curso;
```

&nbsp;    

2 - Feito isso, utiliza-se a sintaxe a seguir para determinar que haja a cópia dos dados de ***tb_curso*** para ***tb_curso_new***. Criei um filtro para que elas fiquem diferentes.
```mysql
INSERT INTO tb_curso_new
SELECT * FROM tb_curso
WHERE nomeCurso='Direito' OR nomeCurso='Pedagogia';
```

&nbsp;  

3 - Tendo sido executada a instrução acima, este será output de ***tb_curso_new***, que já está armazenada no banco de dados da tabela original:

| idCurso | nomeCurso | turnoCurso | valorCurso  |
| :---    | :--       | :--        | :---        |
| 01      | Direito   | M          | 876.28      |
| 02      | Direito   | N          | 950.28      |
| 03      | Pedagogia | M          | 249.50      |
| 04      | Pedagogia | N          | 278.50      |

&nbsp;
 
Obs: Caso seja necessário copiar os dados para uma nova tabela, só que a ser armazenada em um outro banco de dados, basta fazer a seguinte adaptação no momento da criação da nova tabela:
```mysql
CREATE TABLE nome_da_database_destino.tb_curso_new 
LIKE nome_da_database_original.tb_curso;
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>