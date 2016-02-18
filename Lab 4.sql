--David Emory
--2/17/2016
--Lab 4 Sub-Queries

--1. Get the cities of agents booking an order for a customer whos cid is 'c002'
SELECT city
FROM agents
WHERE  aid IN (SELECT aid
	       FROM orders
	       WHERE cid IN (SELECT cid
			     FROM customers
			     WHERE cid = 'c002'));
--2. Get the ids of products ordered through any agent who takes atleast one order from a customer in Dallas, sorted by pid from highest to lowest 
SELECT pid
FROM products
WHERE pid IN (SELECT pid
	      FROM orders
	      WHERE cid IN (SELECT cid 
			     FROM customers
			     WHERE city = 'Dallas'))
ORDER BY pid DESC;
--3. Get the ids and names of customers who did not place an order through agent a01
SELECT cid, name
FROM customers
WHERE cid IN (SELECT cid
	      FROM orders
	      WHERE aid IN (SELECT aid
			    FROM agents
			    WHERE aid != 'a01'));
--4. Get the ids of customers who ordered both product p01 and p07
SELECT cid
FROM customers
WHERE cid IN (SELECT cid
	      FROM orders
	      WHERE pid IN (SELECT pid
			    FROM products
			    WHERE pid = 'p01' AND pid = 'p07'));
--5. Get the ids of products not ordered by any customers who placed any order through agent a07 in pid order from highest to lowest 
SELECT pid
FROM products
WHERE pid IN (SELECT pid
	      FROM orders
	      WHERE aid IN (SELECT aid
			    FROM agents
			    WHERE aid != 'a07'))
ORDER BY pid DESC;
--6. Get the name, discounts, and city for all customers who placed orders through agents in London or new York.
--7. Get all customers who have the same discount as that of any customers in Dallas or London 
--8. Lot of typing (Dave is cool) 