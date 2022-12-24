> **Estruturas condicionais IF e CASE**  
> Repositório: Banco de Dados MySQL - Fundamentos  
> GitHub: @michelelozada
&nbsp;
     
&nbsp;  
**Estrutura condicionais IF e CASE**  
- As estruturas `IF` e `CASE`, em procedimentos armazenados e funções, implementam construções condicionais.  
&nbsp;
     
&nbsp;  
**EXEMPLO 1 - Utilizando a estrutura IF**  
&nbsp;  
**Objetivo:** Criar uma função que informe o valor do desconto a ser concedido (ou não) para uma compra, de acordo com as faixas de valor abaixo estipuladas.   
&nbsp;  
**A. Declarando a função**
```mysql
DELIMITER //
CREATE FUNCTION informaDesconto(total_compra DEC(5,2))
RETURNS DEC(5,2)
BEGIN
	DECLARE valor_desconto DEC(5,2);
	IF total_compra > 590.00 THEN
		SET valor_desconto = 100.00;
	ELSEIF total_compra > 390.00 THEN
		SET valor_desconto = 50.00;
	ELSEIF total_compra > 190.00 THEN
		SET valor_desconto = 20.00;
	ELSE
		SET valor_desconto = 0.00;
	END IF;
	RETURN valor_desconto;
END//
DELIMITER ;
```

&nbsp;  
**B. Chamadas da função**
```mysql
SELECT informaDesconto(150.00) AS 'Valor do desconto (R$)';  -- Retorna => Valor do desconto (R$): 0.00
```
```mysql
SELECT informaDesconto(210.00) AS 'Valor do desconto (R$)';  -- Retorna => Valor do desconto (R$): 20.00
```
```mysql
SELECT informaDesconto(400.00) AS 'Valor do desconto (R$)';  -- Retorna => Valor do desconto (R$): 50.00
```
```mysql
SELECT informaDesconto(650.00) AS 'Valor do desconto (R$)';  -- Retorna => Valor do desconto (R$): 100.00
```
&nbsp;
     
&nbsp;  
**EXEMPLO 2 - Utilizando a estrutura CASE**  
&nbsp;  
**Objetivo:** Criar uma função que informe o valor final de uma compra, após cálculo do desconto (aplicado por faixa de valores).  
&nbsp;  
**A. Declarando a função**
```mysql
DELIMITER //
CREATE FUNCTION aplicaDesconto(total_compra DEC(5,2))
RETURNS DEC(5,2)
BEGIN
    DECLARE valor_desconto DEC(5,2);
    CASE
	    WHEN total_compra > 590.00 THEN
		    SET valor_desconto = total_compra - 100.00;
	    WHEN total_compra > 390.00 THEN
		    SET valor_desconto = total_compra - 50.00;
	    WHEN total_compra > 190.00 THEN
		    SET valor_desconto = total_compra - 20.00;
	    ELSE
		    SET valor_desconto = total_compra ;
    END CASE;
    RETURN valor_desconto;
END//
DELIMITER ;
```
&nbsp;  
**B. Chamadas da função**
```mysql
SELECT aplicaDesconto(180.00) AS 'Valor final da compra (R$)'; -- Retorna => Valor final da compra (R$): 180.00
```
```mysql
SELECT aplicaDesconto(210.00) AS 'Valor final da compra (R$)'; -- Retorna => Valor final da compra (R$): 190.00
```
```mysql
SELECT aplicaDesconto(400.00) AS 'Valor final da compra (R$)'; -- Retorna => Valor final da compra (R$): 350.00
```
```mysql
SELECT aplicaDesconto(650.00) AS 'Valor final da compra (R$)'; -- Retorna => Valor final da compra (R$): 550.00
```

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/Banco-de-Dados-MySQL-Fundamentos">[Voltar à tela inicial do repositório]</a>
</div>