/*EXERCICIO 1*/
CREATE DATABASE Concessionariagabriel

USE Concessionariagabriel	

	CREATE TABLE Veiculo (
	 chassi CHAR(17) PRIMARY KEY,
	 marca VARCHAR(10),
	 modelo VARCHAR(20),
	 anoFabricacao INT,
	 anoModelo INT,
	 combustivel CHAR(1)
	)

ALTER TABLE Veiculo
ADD valor money, motor VARCHAR(20)

ALTER TABLE Veiculo
DROP COLUMN motor

CREATE INDEX VeiculoMarcaModelo
ON Veiculo (marca, modelo)

CREATE INDEX VeiculoAnoFabricacao
ON Veiculo (anoFabricacao DESC) 

DROP TABLE Veiculo

USE master
DROP DATABASE Concessionariagabriel





# EXERCICIO 2.

ALTER TABLE Funcionario
DROP COLUMN email;
ALTER TABLE Funcionario
ADD email VARCHAR(40);

ALTER TABLE Funcionario
DROP COLUMN nome;
ALTER TABLE Funcionario
ADD nome VARCHAR(40);

DELETE FROM Funcionario WHERE idFuncionario=12;

select * from funcionario

DELETE FROM funcionario

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(5, 'Carlos Dias', 'Av. Lapa, 121', 'Itu', 'SP', 'carlao@gmail.com',
'1990-03-31');

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(6, 'Ana Maria da Cunha', 'Av. São Paulo, 388', 'Itu', 'SP','aninhacunha@gmail.com', '1988-04-12');

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(7, 'Cláudia Regina Martins', 'Rua Holanda, 89', 'Campinas', 'SP','cregina@gmail.com', '1988-12-04');

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(8, 'Marcela Tatho', 'Rua Bélgica, 43', 'Campinas', 'SP',
'marctatho@hotmail.com', '1987-11-09');


INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(9, 'Jorge Luis Rodrigues','Av. da Saudade, 1989', 'São Paulo',
'SP', 'jorgeluis@yahoo.com.br', '1990-05-05');


INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(10, 'Ana Paulo Camargo', 'Rua Costa e Silva', 'Jundiaí', 'SP',
'apcamargo@gmail.com', '1991-06-30');


INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(11, 'Ivo Cunha', 'Av. Raio de Luz, 100', 'Campinas', 'SP', 'ivo@
bol.com.br', '1987-04-11');

INSERT INTO Funcionario
(idFuncionario, nome, endereco, cidade, estado, email, dataNascto)
VALUES
(12, 'Carlos Luis de Souza', 'Rua Nicolau Coelho, 22', 'São Paulo',
'SP', 'cls@bol.com.br', '1988-04-30');	


UPDATE Funcionario SET
cidade = 'Valinhos'
WHERE cidade = 'Itu'

ALTER TABLE Funcionario
Begin
ADD salario INT;

select * from funcionario

ALTER TABLE Funcionario;;
Begin
ADD cargo VARCHAR(4);

UPDATE Funcionario SET
cargo = 'AI', salario = 1100 -- auxiliar de informática
WHERE cidade = 'Valinhos'

UPDATE Funcionario SET
cargo = 'PC', salario = 1700 -- programador de computador
WHERE cidade = 'Campinas'

UPDATE Funcionario SET
cargo = 'TI', salario = 750 -- Técnico de informática
WHERE cidade = 'Jundiaí'

UPDATE Funcionario SET
cargo = 'TI', salario = 0 -- Técnico de informática
WHERE cidade = 'São Paulo'

UPDATE Funcionario SET
cargo = 'TI', salario = 0 -- Técnico de informática
WHERE nome = 'Carlos Luis de Souza'

SELECT nome, cargo
FROM Funcionario

SELECT idFuncionario, email
FROM Funcionario
WHERE estado='SP'

DELETE FROM Funcionario 
WHERE idFuncionario = 5

SELECT DISTINCT cidade, estado
FROM Funcionario
WHERE cargo='PC'



--EXERCICIO 3


 
SELECT nome, salario*1.30
FROM Funcionario 
 
SELECT nome, salario, salario*0.80
FROM Funcionario
WHERE cidade = 'Campinas'

SELECT nome, salario
FROM Funcionario
WHERE salario > 1500

SELECT nome, cidade
FROM Funcionario
WHERE NOT cidade='Valinhos'

SELECT idFuncionario, cidade
FROM Funcionario
WHERE cidade='Valinhos' OR cidade='Campinas'

SELECT idFuncionario, cargo
FROM Funcionario
WHERE NOT cidade='São Paulo' AND salario >= 1000

SELECT nome
FROM Funcionario
WHERE cargo IS NOT NULL

SELECT nome, salario
FROM Funcionario
WHERE salario BETWEEN 500 AND 1500

SELECT nome, email
FROM Funcionario 
WHERE email LIKE '%hotmail%'

 
SELECT nome, email
FROM Funcionario 
WHERE email LIKE '%.br'
ORDER BY nome

SELECT nome, email
FROM Funcionario 
WHERE email NOT LIKE '%.com'
ORDER BY nome

SELECT nome, email
FROM Funcionario 
WHERE email LIKE '__r%'	


-- EXERCICIO 4 

SELECT nome, DAY(dataNascto) dia, MONTH(dataNascto) mes,
YEAR(dataNascto) ano
FROM Funcionario

SELECT DISTINCT DATENAME(MONTH,dataNascto) AS nome_mes
FROM Funcionario
ORDER BY nome_mes
 
SELECT idFuncionario, nome
FROM Funcionario
WHERE YEAR(dataNascto)=1987

SELECT nome, DAY(dataNascto)
FROM Funcionario
WHERE MONTH(dataNascto)=4 AND YEAR(dataNascto)=1988
 
SELECT nome, DATEADD(MONTH, 2, dataNascto)
FROM Funcionario

SELECT nome, DATEDIFF(YEAR, dataNascto, GETDATE())
FROM Funcionario

SELECT idFuncionario, nome, YEAR(dataNascto)
FROM Funcionario
WHERE (MONTH(dataNascto) BETWEEN 3 AND 5) AND
YEAR(dataNascto)=1990

SELECT nome, YEAR(dataNascto)
FROM Funcionario
WHERE estado='SP'

SELECT nome
FROM Funcionario
WHERE YEAR(dataNascto) < 1990

SELECT DISTINCT cidade, estado
FROM Funcionario
WHERE YEAR(dataNascto) > 1989

SELECT *
FROM Funcionario
WHERE YEAR(dataNascto) IN (1988, 1990)

SELECT nome
FROM Funcionario
WHERE DAY(dataNascto) = 30


-- EXERCICIO 5

SELECT nome, salario+PI()
FROM Funcionario
 
SELECT SQRT(DAY(dataNascto))
FROM Funcionario
WHERE cidade='Valinhos'
 
SELECT LOG(MONTH(dataNascto))
FROM Funcionario
WHERE YEAR(dataNascto)=1990

SELECT nome, DAY(dataNascto)
FROM Funcionario
WHERE POWER(DAY(dataNascto),3) >= 1000

SELECT ROUND((salario * 1.156),0)
FROM Funcionario
WHERE salario > 1000

SELECT ABS(1500 - salario)
FROM Funcionario

SELECT idFuncionario, SQRT(idFuncionario)
FROM Funcionario
WHERE dataNascto < '1989-04-01'

SELECT nome, ROUND((salario * 0.65),1)
FROM Funcionario

SELECT LOG(idFuncionario)
FROM Funcionario

SELECT SQRT(idFuncionario)
FROM Funcionario
 
SELECT POWER(idFuncionario,2)
FROM Funcionario

SELECT ABS(idFuncionario - 10) AS valor_abs
FROM Funcionario
ORDER BY valor_abs DESC


-- EXERCICIO 6


SELECT UPPER(nome)
FROM Funcionario

SELECT DISTINCT DATENAME(MONTH,dataNascto),
LEN(DATENAME(MONTH,dataNascto))
FROM Funcionario

SELECT REPLACE(nome,' ','-')
FROM Funcionario

SELECT LEFT(nome,3), RIGHT(nome,3)
FROM Funcionario

SELECT SQRT(LEN(nome))
FROM Funcionario
 
SELECT DISTINCT SUBSTRING(cidade,3,5)
FROM Funcionario

SELECT DISTINCT SUBSTRING(cidade,3,5)
FROM Funcionario


SELECT CHAR(idFuncionario)
FROM Funcionario
WHERE cidade='Campinas'
 
SELECT ASCII(nome)
FROM Funcionario
WHERE DAY(dataNascto)> 20

SELECT RTRIM(LEFT(cidade,4))
FROM Funcionario

SELECT LTRIM(RIGHT(cidade,6))
FROM Funcionario

SELECT DISTINCT LOWER(cidade)
FROM Funcionario




--EXERCICIO 7 
SELECT MAX(salario), MIN(salario
)
FROM Funcionario
WHERE estado='SP'
 
SELECT SUM(salario
)
FROM Funcionario
WHERE nome LIKE '%Cunha'

SELECT AVG(salario)
FROM Funcionario
WHERE email LIKE '%yahoo%'
 
SELECT COUNT(*)
FROM Funcionario
WHERE email LIKE '%br'
 
SELECT MIN(dataNascto)
FROM Funcionario

 
SELECT MAX(dataNascto) AS Maior_Nascimento
FROM Funcionario

SELECT COUNT(*) AS Quantidade_de_Valinhos
FROM Funcionario
WHERE cidade='Valinhos'

SELECT SUM(salario)
FROM Funcionario
WHERE cidade='Campinas'

SELECT AVG(salario)
FROM Funcionario
WHERE cidade='São Paulo'

SELECT SUM(salario)
FROM Funcionario
WHERE nome LIKE 'Ana%'

SELECT COUNT(*)
FROM Funcionario
WHERE nome LIKE '%Luis%'

SELECT MIN(salario), MAX(salario)
FROM Funcionario
WHERE endereco LIKE 'Av. São Paulo%'




-- EXERCICIO 8 


SELECT cargo, COUNT(*) AS quantidade
FROM Funcionario
GROUP BY cargo 
ORDER BY quantidade

 
SELECT cargo, COUNT(*)
FROM Funcionario
WHERE NOT cargo IS NULL
GROUP BY cargo 


SELECT cargo, AVG(salario) AS Media_Salarios_Cargo
FROM Funcionario
GROUP BY cargo 

SELECT cargo, SUM(salario)
FROM Funcionario
GROUP BY cargo
HAVING SUM(salario) > 3000

SELECT cargo, SUM(salario)
FROM Funcionario
WHERE estado='SP'
GROUP BY cargo
 

ALTER TABLE Funcionario
ADD ativo char(1);

select * from funcionario

UPDATE Funcionario SET
ativo=1
WHERE (cidade='Jundiaí') OR (cidade='São Paulo')


UPDATE Funcionario SET
ativo=0
WHERE NOT ((cidade='Jundiaí') OR (cidade='São Paulo'))

SELECT ativo, COUNT(*)
FROM Funcionario
GROUP BY ativo

SELECT cidade, SUM(salario)
FROM Funcionario
GROUP BY cidade
 
SELECT cidade, AVG(salario)
FROM Funcionario
GROUP BY cidade
HAVING NOT AVG(salario) IS NULL

SELECT cargo, SUM(salario), AVG(salario)
FROM Funcionario
GROUP BY cargo
HAVING SUM(salario) < 5000

SELECT cidade, cargo, SUM(salario), AVG(salario)
FROM Funcionario
GROUP BY cidade, cargo


-- EXERCICIO 9

SELECT TOP 4 nome
FROM Funcionario

SELECT TOP 2 *
FROM Funcionario
WHERE cidade='Valinhos'
 
SELECT TOP 1 nome, dataNascto
FROM Funcionario
ORDER BY dataNascto ASC

SELECT TOP 2 cidade, COUNT(*)
FROM Funcionario
GROUP BY cidade
 
SELECT TOP 2 cargo, COUNT(*)
FROM Funcionario
GROUP BY cargo

SELECT TOP 30 PERCENT *
FROM Funcionario

SELECT TOP 6 nome, email
FROM Funcionario

SELECT TOP 70 PERCENT idFuncionario, cargo, ativo
FROM Funcionario
 
SELECT TOP 1 idFuncionario, salario
FROM Funcionario
WHERE NOT salario IS NULL
ORDER BY salario ASC

SELECT TOP 1 nome, salario
FROM Funcionario
ORDER BY salario DESC

SELECT TOP 1 nome, endereco
FROM Funcionario
 
SELECT TOP 90 PERCENT *
FROM Funcionario
 
SELECT TOP 1 *
FROM Funcionario
WHERE cidade='São Paulo'
 
SELECT TOP 20 PERCENT nome, endereco, cidade, estado
FROM Funcionario

SELECT TOP 2 *
FROM Funcionario
WHERE YEAR(dataNascto) = 1988


SELECT * FROM cadastro.toraxes;
