-- Product name and quantity/unit
SELECT 
	productname,
    quantityperunit AS qts_per_unit
FROM 
	products;
    
-- current Product list (Product ID and name)
SELECT 
	*
FROM
	products;
    
SELECT
	productID,
    productname
FROM
	products
WHERE 
	discontinued = 0;
    
-- discontinued Product list (Product ID and name)
SELECT
	productID,
    productname
FROM
	products
WHERE 
	discontinued = 1;
    
-- list of most expense and least expensive Product list (name and unit price)    
SELECT 
	productname,
    unitprice
FROM 
	products
ORDER BY 
	UnitPrice DESC;

-- Product list (id, name, unit price) where current products cost less than $20
SELECT 
	productID,
    productname,
    unitprice
FROM 
	products
WHERE 
	Discontinued = 0
AND 
	UnitPrice < 20;
    
-- Product list (id, name, unit price) where products cost between $15 and $25
SELECT 
	productID,
    productname,
    unitprice
FROM 
	products
WHERE 
	UnitPrice BETWEEN 15 AND 25;
    
-- Product list (name, unit price) of above average price
SELECT 
	productID,
    productname,
    unitprice
FROM 
	products
WHERE 
	UnitPrice > (SELECT AVG(UnitPrice) FROM products);
    
-- Product list (name, unit price) of ten most expensive products
SELECT 
	productID,
    productname,
    unitprice
FROM 
	products
ORDER BY 
	UnitPrice DESC
LIMIT 10;

-- count current and discontinued products
-- 0 current, 1 discontinued
SELECT 
	Discontinued AS status,
	COUNT(productname)
FROM
	products
GROUP BY 
	Discontinued;

-- OR
SELECT 
	COUNT(CASE WHEN discontinued = 1 THEN 1 ELSE NULL END) AS 'discontinued',
	COUNT(CASE WHEN discontinued = 0 THEN 1 ELSE NULL END) AS 'current'
FROM
	products;
    
-- Product list (name, units on order , units in stock) 
-- of stock is less than the quantity on order
SELECT 
	productname,
    unitsonorder AS on_order,
    unitsinstock AS in_stock
FROM
	products
WHERE 
	unitsonorder > unitsinstock;
    