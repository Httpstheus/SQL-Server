SELECT * 
	FROM person.Person;

SELECT Title
	FROM person.Person;

SELECT FirstName
      ,LastName		
	FROM person.Person;

SELECT FirstName	
	FROM person.Person;

	-- DISTINCT serve para não trazer dados duplicados do banco

SELECT DISTINCT FirstName	
	FROM person.Person;

SELECT * 
	FROM person.Person WHERE LastName = 'Miller';

	/*
	    OPERADOR   -   DESCRIÇÃO
	        =            IGUAL
	        >            MAIOR
	        <            MENOR
	        >=           MAIOR OU IGUAL
	        <=           MENOR OU IGUAL
	        <>           DIFERENTE DE
	        AND          E
	        OR          OU
	
	*/

SELECT *
	FROM production.Product
		WHERE
		color = 'blue' OR color = 'red' 
		AND weight >= 2.24 AND Weight <= 3.50
		AND ListPrice >= 1000	
		AND Size <> NULL;


-- DESAFIO 1 -> A equipe de produção de produtos precisa do nome de 
-- todas as peças que pesam mais de 500kg mas não mais que 700 kg para inspeção
SELECT * 
	FROM Production.Product  
		WHERE Weight >= 500 AND Weight <= 700;

-- DESAFIO 2 -> Foi pedido pelo marketing uma relação de todos os empregados que são casados
-- e são assalariados
SELECT * 
	FROM HumanResources.Employee 
		WHERE MaritalStatus = 'M' AND SalariedFlag = 1;

-- DESASFIO 3 -> Um usuário Peter Krebs está devendo um pagamento, consiga o email dele.
-- Usar Id para localizar na tabela.
SELECT * 
	FROM person.Person
		WHERE FirstName = 'Peter' AND LastName = 'Krebs';

SELECT * 
	FROM person.EmailAddress 
		WHERE BusinessEntityID = 26;

--              COUNT                   --

SELECT COUNT(*) 
	FROM person.Person;

SELECT COUNT(title)
	FROM person.Person;

SELECT COUNT(DISTINCT title)
	FROM person.Person;

-- DESAFIO 4 -> QUANTOS PRODUTOS TEMOS CADASTRADOS 

SELECT COUNT(*)
	FROM Production.Product;

-- DESAFIO 5 -> QNT. TAMANHO DE PRODUTOS
SELECT COUNT(Size)
	FROM Production.Product;

-- DESAFIO 6 -> TAMANOS DIFERENTES DE PRODUTOS
SELECT COUNT(DISTINCT Size)
	FROM Production.Product;

-- TOP (listar no topo)

SELECT TOP 10 *
	FROM person.Person;

-- ORDER BY (ordenar por ordem crescente ou decrescente)

SELECT *
	FROM person.Person
		ORDER BY FirstName asc -- ASC -> Ordem Crescente

		
SELECT *
	FROM person.Person
		ORDER BY FirstName desc -- ASC -> Ordem Decrescente

SELECT *
	FROM person.Person
		ORDER BY FirstName asc, LastName desc -- ASC -> Ordem Crescente Decrescente

-- DESAFIO 7 -> Obter o ProducID dos 10 produtos mais caros cadastrados no sistema
-- listando do mais caro para o mais barato

SELECT *
	FROM Production.Product;

SELECT TOP 10 *	
	FROM Production.Product
		ORDER BY ListPrice asc;

-- BETWEEN (usado para encontrar um valor entre o valor minimo e o valor maximo)

SELECT * 
	FROM Production.Product 
		WHERE ListPrice 
			BETWEEN 1000 AND 1500;

SELECT * 
	FROM Production.Product 
		WHERE ListPrice 
			NOT BETWEEN 1000 AND 1500; -- NOT BETWEEN -> Não estão entre.

SELECT *
	FROM HumanResources.Employee
		WHERE HireDate
			BETWEEN '2009/01/01' AND '2010/01/01';

-- IN (usamos o IN junto com o WHERE)
-- para verificar se um valor correspondem com qualquer valor passado na lista
-- de valores e EXECUTA MAIS RÁPIDO

SELECT* 
	FROM Production.Product
		WHERE Color IN ('BLUE','RED');

SELECT* 
	FROM Production.Product
		WHERE Color NOT IN ('BLUE','RED');

-- LIKE (vamos dizer que você quer encontrar uma pessoa no banco de dados que vocêr sabe que o
-- nome dela era ovi...... alguma coisa (COMEÇA COM...)

SELECT *
	FROM Person.Person
		WHERE FirstName
			LIKE 'ovi%'; -- O % significa que não importa o que vem depois, apenas o antes.

SELECT *
	FROM Person.Person
		WHERE FirstName
			LIKE '%to'; -- O % significa que não importa o que vem antes, apenas o depois.


SELECT *
	FROM Person.Person
		WHERE FirstName
			LIKE '%essa%'; -- O % significa que não importa o que vem antes ou depois, apenas o meio.

-- DESAFIO 8 ->  Quantos produtos temos cadastrados no sistema que custam mais que 1500 dolares?

SELECT COUNT(ListPrice) 
	FROM Production.Product
		WHERE ListPrice > '1500';

SELECT COUNT(DISTINCT ListPrice) 
	FROM Production.Product
		WHERE ListPrice > '1500';

-- DESAFIO 9 -> Quantas pessoas temos com o sobrenome que inicia com a letra P?

SELECT COUNT(LastName)
	FROM Person.Person	
		WHERE LastName
			LIKE '%p';

-- DESAFIO 10 -> Em Quantas cidades únicas estão cadastrados nossos clientes?

SELECT COUNT(DISTINCT City) 
	FROM person.Address;

-- DESAFIO 11 -> Quais são as cidades únicas que temos cadastradas em nosso sistema?

SELECT DISTINCT(City) 
	FROM person.Address;

-- DESAFIO 12 -> Quantos produtos tem preco entre 500 a 1000 dolares?

SELECT *
	FROM Production.Product
		WHERE Color = 'red'AND
			ListPrice BETWEEN 500 AND 1000;

-- DEAFIO 13 -> Quantos produtos cadastros tem a palavra 'road' no nome deles?

SELECT COUNT(*)
	FROM Production.Product
		WHERE Name 
			LIKE '%road%'
	
-- SUM -> Soma
-- AS -> Colocar Apelido em alguma coluna

SELECT TOP 10  sum(linetotal) AS SomaTotal
	FROM Sales.SalesOrderDetail;

-- MIN -> Menor Valor
-- AS -> Colocar Apelido em alguma coluna

SELECT TOP 10  MIN (linetotal) AS MenorValor
	FROM Sales.SalesOrderDetail;

-- MAX -> Maior Valor
-- AS -> Colocar Apelido em alguma coluna

SELECT TOP 10  MAX (linetotal) AS MaiorValor
	FROM Sales.SalesOrderDetail;

-- AVG (Avagere) -> Média
-- AS -> Colocar Apelido em alguma coluna

SELECT TOP 10  AVG (linetotal) AS MédiaValor
	FROM Sales.SalesOrderDetail;

-- GROUP BY -> Divide o resultado da pesquisa em grupos e agrupa os dados

SELECT * 
	FROM Sales.SalesOrderDetail;

SELECT SpecialOfferID
	, SUM (UnitPrice) AS Soma
		FROM Sales.SalesOrderDetail
			GROUP BY SpecialOfferID;

SELECT ProductID
, COUNT (ProductID) AS ContagemVendas
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID;

-- DESAFIO 14 -> Saber quantas pessoas tem o mesmo MiddleName

SELECT *
	FROM Person.Person;

SELECT MiddleName
	 , COUNT(MiddleName)
	 FROM Person.Person
	 GROUP BY MiddleName

-- DESAFIO 15 -> Eu preciso saber em média qual é a quantidade de cada produto 
-- vendido na loja.

SELECT ProductID	
	  , AVG (OrderQty) AS MediaQtdProduct
	FROM Sales.SalesOrderDetail
	GROUP BY ProductID;
		
