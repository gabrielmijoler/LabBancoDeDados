
# EXERCICIO 10


CREATE DATABASE Compras

USE Compras

CREATE TABLE Cliente(
 IdCliente int identity primary key,
 Nome varchar(50) NOT NULL,
 Endereco varchar(50) NOT NULL,
 Cidade varchar(50) NOT NULL,
 Estado char(2) NOT NULL
)
CREATE TABLE Produto(
 IdProduto INT IDENTITY PRIMARY KEY,
Descricao VARCHAR(50) NOT NULL,
 Preco DECIMAL(5,2) NOT NULL,
 Qtde INT NOT NULL
)

CREATE TABLE Compram (
 IdCompra INT IDENTITY(1000,2),
 IdCliente INT,
 IdProduto INT,
 Data DATETIME NOT NULL,
 Qtde INT,
 Valor DECIMAL(5,2),
PRIMARY KEY(IdCompra,IdCliente,IdProduto)
)
 
ALTER TABLE Cliente 
ADD sexo CHAR(1) NOT NULL

INSERT INTO Cliente
(Nome,Endereco,Cidade,Estado,Sexo)
VALUES('José de Oliveira','Av. Jatobá,34','Jundiaí','SP','F')

INSERT INTO Cliente
(Nome,Endereco,Cidade,Estado,Sexo)
VALUES('Maria da Silva','Av. Presidente,12','Itatiba','MG','F')

INSERT INTO Cliente
(Nome,Endereco,Cidade,Estado,Sexo)
VALUES('Antonio Carlos','R. Florença,5','Jundiaí','SP','M')

INSERT INTO Cliente
(Nome,Endereco,Cidade,Estado,Sexo)
VALUES('Luisa de Souza','Av. Jatobá,45','Jundiaí','MG','F')

INSERT INTO Cliente
(Nome,Endereco,Cidade,Estado,Sexo)
VALUES('Calos de Souza','Av. Jatobá,45','Jundiaí','SP','M')


INSERT INTO Produto(Descricao,Preco,Qtde)
VALUES('Lápis',1.50,20)

INSERT INTO Produto(Descricao,Preco,Qtde)
VALUES('Borracha',1.00,15)

INSERT INTO Produto(Descricao,Preco,Qtde)
VALUES('Caneta',1.75,35)

INSERT INTO Produto (Descricao,Preco,Qtde)
VALUES('Compasso',5.20,10)

INSERT INTO Produto (Descricao,Preco,Qtde)
VALUES('Régua',0.75,16)

INSERT INTO Produto (Descricao,Preco,Qtde)
VALUES('Papel Sulfi te',10.50,5)

 
INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (1,1,'2010-12-01',2,1.50)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (2,1,'2010-12-03',5,1.50)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (1,3,'2011-01-05',13,1.75)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (1,4,'2011-01-11',1,5.20)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (3,2,'2011-03-16',7,1.00)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (4,5,'2011-05-21',10,0.75)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (2,6,'2011-06-07',2,10.50)

INSERT INTO Compram (IdCliente,IdProduto,Data,Qtde,Valor)
VALUES (5,3,'2011-06-07',2,1.75)

UPDATE Cliente 
SET Estado = 'SP'

SELECT Nome, Estado 
FROM Cliente
 
UPDATE Cliente 
SET Sexo = 'M' 
WHERE Nome = 'José de Oliveira'

SELECT Descricao, Preco 
FROM Produto
 
DELETE FROM Produto 
WHERE Descricao = 'Papel Sulfi te'

UPDATE Produto 
SET Qtde = 15 
WHERE Descricao = 'Lápis'

SELECT TOP 2 LOWER(Descricao)
FROM Produto

SELECT SUM(Valor)
FROM Compram 
WHERE IdProduto = 1

SELECT AVG(valor)
FROM Compram 
WHERE IdCliente = 1

SELECT Nome 
FROM Cliente 
WHERE Cidade = 'Jundiaí'

SELECT IdCliente, UPPER(Nome)
FROM Cliente 
WHERE Nome LIKE '%Carlos%'

SELECT Descricao, Preco, Qtde 
FROM Produto 
WHERE Preco > 1 AND Qtde >= 10
 
SELECT *
FROM Cliente 
ORDER BY Nome
 
SELECT DISTINCT cidade, COUNT(*)
FROM Cliente 
GROUP BY Cidade 
ORDER BY COUNT(*)

SELECT SUM(Preco) AS SomaPreco, AVG(Preco) AS MediaPreco 
FROM Produto

SELECT MAX(Preco) AS PrecoMaisCaro, MIN(Preco) AS PrecoMaisBarato 
FROM Produto

SELECT SUM(Valor)
FROM Compram 
WHERE YEAR(Data) = '2010'
 
SELECT TOP 1 Valor 
FROM Compram 
WHERE YEAR(Data) = '2011' 
ORDER BY Data

SELECT Nome 
FROM Cliente 
WHERE Sexo = 'F'
 
SELECT *
FROM Compram 
WHERE DAY(Data) IN ('1','11')

SELECT Descricao, Preco, (Preco + (Preco*0.1)) AS
PrecoAcrescido10porCento
FROM Produto
 
SELECT IdCliente, COUNT(*) AS QuantidadeCompra 
FROM Compram 
GROUP BY IdCliente
 
UPDATE Produto 
SET Preco = (Preco - (Preco*0.1))
WHERE Qtde < 15
 
SELECT IdProduto, DAY(Data)
FROM Compram

SELECT DISTINCT Sexo, COUNT(*)
FROM Cliente 
GROUP BY Sexo 

DELETE FROM Compram 
WHERE IdCompra = 1000

SELECT Descricao, POWER(Qtde,2) AS QtdeAoQuadrado 
FROM Produto 
WHERE Qtde > 15 AND Qtde < 25
 
SELECT SQRT(Qtde) AS RaizDaQuantidade 
FROM Produto 
WHERE Descricao LIKE 'C%'
 
SELECT Nome 
FROM Cliente 
WHERE Endereco LIKE 'Av. Jatobá%'

SELECT Nome, LEN(Nome) AS QuantidadeDeCaractere 
FROM Cliente

SELECT IdCompra, Valor, (Valor-(Valor*0.2)) AS
Valor20PorCentoDesconto
FROM Compram 
WHERE IdCliente = 2

SELECT YEAR(Data), COUNT(*)
FROM Compram 
GROUP BY YEAR(Data)
 
SELECT IdCompra, DAY(Data) AS DiaDaCompra, DATENAME(MONTH,Data)
AS MesDaCompra, YEAR(Data) AS AnoDasCompras 
FROM Compram

SELECT IdProduto, SUM(Valor*Qtde)
FROM Compram 
GROUP BY IdProduto 
HAVING SUM(Valor*Qtde) > 7

DELETE FROM Compram 
WHERE IdCliente BETWEEN 3 AND 5

DROP TABLE Produto

USE MASTER
DROP DATABASE Compras