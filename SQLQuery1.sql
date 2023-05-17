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