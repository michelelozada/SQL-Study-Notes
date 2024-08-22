> **Funções de agregação (COUNT, MAX, MIN, SUM e AVG)**  
> Repositório: Banco de Dados SQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
## Funções de agregação
```
- Agregam em uma única linha valores dos registros, tais como contagem, média, soma, mínimo ou máximo 

- São utilizadas junto às cláusulas `SELECT`
```
     
&nbsp;  

↳ A tabela a ser utilizada para os exemplos abaixo:
```
+----------+---------------------------------------+-------+-------------+
| ID Curso |              Nome curso               | Turno | Mensalidade |
+----------+---------------------------------------+-------+-------------+
|        1 | Direito                               | M     |      876.28 |
|        2 | Direito                               | N     |      950.28 |
|        3 | Análise e Desenvolvimento de Sistemas | M     |      503.20 |
|        4 | Análise e Desenvolvimento de Sistemas | N     |      550.20 |
|        5 | Administração                         | M     |      654.16 |
|        6 | Administração                         | N     |      680.00 |
|        7 | Farmácia                              | M     |      814.64 |
|        8 | Sistemas de Informação                | M     |      560.32 |
|        9 | Gestao de TI                          | M     |      477.36 |
|       10 | Gestao de TI                          | N     |      500.00 |
|       11 | Pedagogia                             | M     |      249.50 |
|       12 | Pedagogia                             | N     |      278.50 |
|       13 | Nutrição                              | M     |      495.00 |
|       14 | Ciência de Dados                      | M     |      514.00 |
|       15 | Design Gráfico                        | M     |      622.05 |
|       16 | Design Gráfico                        | N     |      670.10 |
+----------+---------------------------------------+-------+-------------+
```

&nbsp;
     
### • Função COUNT
Retorna a quantidade de registros de uma tabela.  

&nbsp;  

Fazendo a contagem dos cursos registrados na tabela (o uso de ALL é opcional, também poderia ter sido usada acima a seguinte sintaxe: SELECT COUNT(*) AS 'Número de Cursos'):  
```mysql

SELECT COUNT(ALL nomeCurso) AS 'Número de Cursos'  
FROM tb_curso;  

-- Retorna: 16 (Há 16 cursos registrados na tabela)
```

&nbsp;  

Fazendo a contagem dos cursos, porém agora sem contar o nome dos cursos que se repetem na tabela:
```mysql

SELECT COUNT(DISTINCT nomeCurso) AS 'Nomes dos Cursos'
FROM tb_curso;  

-- Retorna: 10 (Há 10 cursos registrados na tabela - sem repetições)
```

&nbsp;  

Fazendo a contagem de cursos, baseada em uma condição especificada:
```mysql

SELECT COUNT(nomeCurso) AS 'Número de Cursos' 
FROM tb_curso 
WHERE mensalidadeCurso < 300.00;  

-- Retorna: 2  (Há 2 cursos com mensalidade inferior a R$ 300,00)
```

&nbsp;  

Fazendo a contagem dos turnos dos cursos:
```mysql

SELECT COUNT(DISTINCT turnoCurso) AS 'Turnos da escola' 
FROM tb_curso;

-- Retorna: 2  (Há dois turnos de cursos: Manhã e Tarde)
```

&nbsp;
     
### • Função MAX
Retorna o maior valor dentre os elementos de uma coluna:

```mysql

SELECT MAX(mensalidadeCurso) AS 'Maior valor de mensalidade'
FROM tb_curso; 

-- Retorna: 950.28 (mensalidade do curso de Direito - N)
```

&nbsp;

Retornando o maior valor de mensalidade dentre uma faixa estipulada:
```mysql

SELECT MAX(mensalidadeCurso) AS 'Maior valor de mensalidade'
FROM tb_curso 
WHERE mensalidadeCurso> 600.00 AND mensalidadeCurso< 700.00;  

-- Retorna: 680.00 (mensalidade do curso de Administração - N)
```

&nbsp;
     
### • Função MIN
Retorna o menor valor dentre os elementos de uma coluna.
```mysql

SELECT MIN(mensalidadeCurso) AS 'Menor valor de mensalidade'
FROM tb_curso; 

-- Retorna: 249.50 (mensalidade do curso de Pedagogia - M)
```

&nbsp;

Retornando o menor valor de mensalidade dentre uma faixa estipulada:
```mysql

SELECT MIN(mensalidadeCurso) AS 'Menor valor de mensalidade'
FROM tb_curso 
WHERE mensalidadeCurso> 600.00 AND mensalidadeCurso< 700.00;  

-- Retorna: 622.05 (mensalidade do curso de Design Gráfico - N)
```

&nbsp;

Consulta com o retorno dos dois valores:
```mysql

SELECT MAX(mensalidadeCurso) AS 'Maior valor de mensalidade', MIN(mensalidadeCurso) AS 'Menor valor de mensalidade'
FROM tb_curso;   

-- Retorna: 950.28 (Maior_valor_mensalidade) e 249.50 (Menor_valor_mensalidade)
```

&nbsp;
     
### • Função SUM
Retorna a soma dos valores de uma coluna
```mysql

SELECT SUM(mensalidadeCurso) AS 'Soma das mensalidades'
FROM tb_curso; 

-- Retorna: 9395.59 (soma de todas as mensalidades)
```

&nbsp;  

No exemplo abaixo, realizando a soma apenas dos cursos com ID menor ou igual a 5:
```mysql

SELECT SUM(mensalidadeCurso) AS 'Soma das mensalidades'
FROM tb_curso 
WHERE idCurso <= 5;

-- Retorna: 3534.12 (soma das 5 primeiras mensalidades da tabela)
```

&nbsp;
     
### • Função AVG
Retorna a média aritmética dos valores de uma coluna

```mysql

SELECT AVG(mensalidadeCurso) AS Media
FROM tb_curso; 

-- Retorna: 587.224375 (média das mensalidades dos cursos)
```

&nbsp;

```mysql

# Usando a função ROUND() para retornar número com duas casas decimais
SELECT ROUND(AVG(mensalidadeCurso),2) AS Media
FROM tb_curso;  

-- Retorna: 587.22 
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/SQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>