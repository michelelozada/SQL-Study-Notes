> **Tipos de dados no MySQL**  
> Repositório: Banco de Dados MySQL - Fundamentos   
> GitHub: @michelelozada
&nbsp;
     
&nbsp;   
A lista completa abrange vários tipos; seguem abaixo apenas os básicos/mais utilizados.    
&nbsp;
&nbsp;   
**Tipos alfanuméricos:**  

Nome 		| Observação  	| Exemplo
:--- 		| :---			| :---	
VARCHAR	 	| Tipo de dado string de comprimento variável | nomeCliente VARCHAR(50)
CHAR	 	| Tipo de dado string de comprimento fixo | estado CHAR(2)

&nbsp;
&nbsp;   
**Tipos numéricos:**    

Nome 		| Observação  	| Exemplo
:--- 		| :---			| :---	
INT		 	| Números inteiros | idProduto INT(11)
FLOAT	 	| Números reais - trabalha com arredondamento de valores | estimativaValores FLOAT(4,2)
DECIMAL	  	| Númros reais - para precisão/exatidão de valores | precoProduto DECIMAL(4,2)

&nbsp;
&nbsp;   
**Tipos com data e hora:**  

Nome 		| Observação  	| Exemplo
:--- 		| :---			| :---	
DATE	 	| Formato: YYYY-MM-DD		| dataNascimento DATE
DATETIME 	| Formato: YYYY-MM-DD HH:MM:SS	| dataProtocolada DATETIME
TIMESTAMP 	| Formato: YYYY-MM-DD HH:MM:SS | ultimoLogin TIMESTAMP
TIME		| Formato: HH:MM:SS	| horaEntrada TIME 
YEAR		| Formato: YYYY | anoNascimento YEAR