> **Tipos de dados no MySQL**  
> Repositório: Banco de Dados MySQL - Fundamentos   
> GitHub: @michelelozada
&nbsp;
     
&nbsp;   
A lista completa abrange vários tipos; seguem abaixo apenas os básicos/mais utilizados:    

&nbsp;   

**1. Tipos alfanuméricos:**  

Nome 		| Observação  	| Exemplo |
:--- 		| :---			    | :---    |
VARCHAR	| Tipo de dado string de comprimento variável | nomeCliente VARCHAR(50) |
CHAR	 	| Tipo de dado string de comprimento fixo | estado CHAR(2) |

*Obs: CHAR tem tamamho fixo e armazena também os espaços vazios; já o VARCHAR armazena apenas os espaços da cadeia de carcteres realmente utilizados.*  

&nbsp;   

**2. Tipos numéricos:**  

Nome 		| Observação  	| Exemplo |
:--- 		| :---			| :---	|
INT		 	| Números inteiros | idProduto INT(11) |
FLOAT	 	| Números reais - trabalha com arredondamento de valores | estimativaValores FLOAT(10,2) |
DECIMAL	| Númros reais - para precisão/exatidão de valores | precoProduto DECIMAL(10,2) |

*Obs: FLOAT(10,2) ou DECIMAL(10,2) significa que dos 10 dígitos, 2 serão reservados para a fração.*    

&nbsp;
   
**3. Tipos com data e hora:**  

Nome 		| Observação  	| Exemplo |
:--- 		| :---			| :--- |
DATE	 	| Armazena a data. Formato: YYYY-MM-DD		| dataNascimento DATE |
DATETIME 	| Armazena data e hora. Formato: YYYY-MM-DD HH:MM:SS	| dataProtocolada DATETIME |
TIMESTAMP | Armazena data e hora, inclui fuso horário. Formato: YYYY-MM-DD HH:MM:SS | ultimoLogin TIMESTAMP |
TIME		| Armazena hora. Formato: HH:MM:SS	| horaEntrada TIME |
YEAR		| Armazena anos. Formato: YYYY | anoNascimento YEAR |

*Obs: DATETIME armazena datas; TIMESTAMP faz um 'carimbo digital', registrando um ponto específico no tempo.*  

&nbsp;

<div align="center">
<a href="https://github.com/michelelozada/MySQL-Study-Notes">[Voltar à tela inicial do repositório]</a>
</div>