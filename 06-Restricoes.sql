/*
 *  Restrições (aka Constraints)
 *  Repositório: Banco de Dados MySQL - Fundamentos
 *  GitHub: @michelelozada
 */
   
   
   
-- 1 . PRIMARY KEY (aka Chave Primária)
-- Define o atributo (ou conjunto de atributos) que indentificará de forma única cada registro/linha de uma tabela de um banco de dados.
-- Só pode haver uma chave primária por tabela.
-- Quando aplicada, não podem ocorer valores duplicados.
-- Necessário ser declarada em conjunto com a cláusula NOT NULL, já que uma chave primária não pode receber valores nulos.
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY NOT NULL,
	nomeAluno varchar(40)
);

   
   
-- 2. FOREIGN KEY (aka Chave Estrangeira)
-- Campo de uma tabela que aponta para o campo primário de uma outra tabela que contém a chave primária.
-- Imaginando uma tabela chamada Contrato, cujo campo idAluno estará vinculado ao campo primário da tabela Aluno, seria assim criada uma chave estrangeira:
CREATE TABLE tb_contrato(
	idContrato int(11) PRIMARY KEY NOT NULL,
	idAluno int(11),
	CONSTRAINT fk_idAluno FOREIGN KEY (idAluno) REFERENCES tb_aluno(idAluno)
);

-- Alteração para aplicar a chave estrangeira numa tabela já criada:
ALTER TABLE tb_contrato ADD CONSTRAINT fk_idAluno FOREIGN KEY (idAluno) REFERENCES tb_aluno(idAluno);

-- Exclusão de uma chave estrangeira:
ALTER TABLE tb_contrato DROP CONSTRAINT fk_idAluno;



-- 3. UNIQUE
-- Define que valores em uma dada coluna não pdoerão se repetir.
CREATE TABLE tb_aluno(
	idAluno int(11),
	cpfAluno varchar(15) UNIQUE
);
	

     
-- 4. NOT NULL
-- Define que não serão admitidos valores nulos/dados vazios na coluna (lembrando que o valor default é NULL).
CREATE TABLE tb_aluno(
	idAluno int(11) PRIMARY KEY NOT NULL,
	nomeAluno varchar(40) NOT NULL
);
-- Caso a restrição não tenha sido definida no momento da criação da tabela:
ALTER TABLE tb_aluno MODIFY nomeAluno varchar(40) NOT NULL;
-- Caso seja necessária a reversão:
ALTER TABLE tb_aluno MODIFY nomeAluno varchar(40) NULL;



-- 5. DEFAULT
-- Define que - caso não seja especificado um valor pelo usuário - será associado um valor pré-definido à coluna.
CREATE TABLE tb_aluno(
	idAluno int(11),
	cidadeAluno varchar(40) DEFAULT 'Curitiba',
	estadoAluno char(2) DEFAULT 'PR'
);
-- Caso a restrição não tenha sido definida no momento da criação da tabela:
ALTER TABLE tb_aluno ALTER cidadeAluno SET DEFAULT 'Curitiba';