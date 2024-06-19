> **Tipos de parâmetros em procedimentos armazenados (IN, OUT e INOUT)**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Tipos de parâmetros em procedimentos armazenados  

```
O programa chamador passa seus argumentos para os parâmetros do procedimento armazenado, sendo que estes
podem ser de três tipos:

Procedimentos com parâmetro IN
  . Este é o tipo de parâmetro default para os procedimentos armazenados, portanto sua identificação IN
	pode permanecer implicita  
  . Aqui, ao ser feita a chamada, será passado o valor do argumento ao parâmetro, sendo que não haverá 
	nenhuma alteração deste valor dentro do procedimento
  
  
Procedimentos com parâmetro OUT
  . Aqui, o parâmetro é inicialmente passado como NULL, sendo o valor passado ao longo do procedimento
  . Portanto, o valor passado ao parâmetro será diferente ao fim da execução do procedimento

Procedimentos com parâmetro INOUT
  . É uma combinação dos parâmetros do tipo IN e OUT
  . Aqui, ao ser feita a chamada, será passado o valor do argumento ao parâmetro do procedimento (não será 
	passado valor NULL, como em parâmetros do tipo `OUT`)
  . Ao fim, este valor pasado ao parâmetro será retornado processado/computado (diferente do que acontece 
	em parâmetros do tipo IN)
```

&nbsp;

> A tabela a ser utilizada para os exemplos abaixo:
```
+---------+-----------+------------+------------------+
| idCurso | nomeCurso | turnoCurso | mensalidadeCurso |
+---------+-----------+------------+------------------+
|       1 | Direito   | M          |           876.28 |
|       2 | Direito   | N          |           950.28 |
|       3 | Pedagogia | M          |           249.50 |
|       4 | Pedagogia | N          |           278.50 |
+---------+-----------+------------+------------------+
```

&nbsp;
    
### • Aplicação de parâmetro do tipo IN
Objetivo: Criar um procedimento para reduzir o valor da mensalidade de qualquer curso, de acordo com uma taxa informada

> A. Declarando o procedimento:
```mysql

DELIMITER //  
CREATE PROCEDURE reduzirMensalidade(IN nome varchar(50), IN turno char(1), IN taxaDesconto DECIMAL (10,2))
BEGIN
  UPDATE tb_curso
  SET mensalidadeCurso = mensalidadeCurso - mensalidadeCurso * taxaDesconto/100
  WHERE nomeCurso = nome AND turnoCurso = turno; 
END //
DELIMITER ; 
```

&nbsp;

> B. Criando as variáveis e atribuindo valores a elas:
```mysql

SET @nome = 'Direito';
SET @turno = 'M';
SET @taxa = 10;
```

&nbsp;

> C. Chamando o procedimento:
```mysql

CALL reduzirMensalidade(@nome,@turno,@taxa);
```

&nbsp;

> D. Realizando a consulta:
```mysql

SELECT * from tb_curso
WHERE nomeCurso = 'Direito' AND turnoCurso='M';
```

Saída gerada:  
```
+---------+-----------+------------+------------------+
| idCurso | nomeCurso | turnoCurso | mensalidadeCurso |
+---------+-----------+------------+------------------+
|       1 | Direito   | M          |           788.65 |
+---------+-----------+------------+------------------+
```

&nbsp;
     
### • Aplicação de parâmetro do tipo OUT
Objetivo: Criar um procedimento para, tendo sido informada a id do curso, serem retornados seu nome e turno

&nbsp;

> A. Declarando o procedimento:
```mysql

DELIMITER //  
CREATE PROCEDURE informarCurso(IN id int(11), OUT curso varchar(50),OUT turno char(1))
BEGIN
  SELECT nomeCurso, turnoCurso -- campos da tabela
  INTO curso, turno -- nomes das variáveis
  FROM tb_curso
  WHERE idCurso = id;
END //
DELIMITER ; 
```

&nbsp;

> B. Chamando o procedimento:
```mysql

CALL informarCurso(3,@curso,@turno);
```

&nbsp;

> C. Realizando a consulta:
```mysql

SELECT @curso AS Curso,@turno AS Turno;
```

Saída gerada:  
```
+-------------+
| Curso Turno |
+-------------+
| Pedagogia M |
+-------------+
```

&nbsp; 

### • Aplicação de parâmetro do tipo INOUT
Objetivo: Criar procedimento para, tendo sido informada a mensalidade, esta ser reduzida de acordo com taxa também informada

&nbsp;

> A. Declarando o procedimento:
```mysql

DELIMITER //  
CREATE PROCEDURE aplicarDesconto(INOUT valor DECIMAL (10,2), IN taxaDesconto DECIMAL (10,2))
BEGIN
  SET valor = valor - valor * taxaDesconto/100;
END //
DELIMITER ; 
```

&nbsp; 

> B. Criando a variável com o valor da mensalidade (a ser reduzida) e atribuindo valores a ela:
```mysql

SET @valor = 278.50;
```

&nbsp; 

> C. Chamando o procedimento:
```mysql

CALL aplicarDesconto(@valor,10.00); -- quero reduzir o valor em 10%
```

&nbsp; 

> D. Realizando a consulta:
```mysql

SELECT @valor AS 'Mensalidade com desconto';
```

Saída gerada:  
```
+--------------------------+
| Mensalidade com desconto |
+--------------------------+
|                   250.65 |
+--------------------------+
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>