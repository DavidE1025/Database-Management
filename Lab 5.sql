--David Emory
--Lab 5
--2/24/2016

--1.) Show the cities of agents booking an order for a customer whose id is 'c002'. Use joins; no sub queries
SELECT a.city
FROM agents a
JOIN orders o ON a.aid = o.aid
WHERE cid = 'c002'; 
--2.) Show the ids of products ordered through any agent who makes at least one order for a customer in Dallas, sorted by pid from highest to lowest. Use joins; no subqueries
SELECT pid
FROM orders o
JOIN customers c ON o.cid = c.cid
WHERE city = 'Dallas'
ORDER BY pid DESC;
--3.) Show the names of customers who have never placed an order. Use a subquery
SELECT name
FROM customers
WHERE cid IN (SELECT cid
	      FROM orders
	      WHERE ordno is NULL);
--4.) Show the names of customers who have never placed an order. Use an outer join
SELECT name
FROM customers c
OUTER JOIN 
--5.) Show the names of customers who placed at least one order through an agent in their own city, along with those agent(s') names.
--6.) Show the names of customers and agents living in the same city, along with the name of the shared city, regardless of whether or not the customer has ever placed an order with that agent
SELECT c.name, a.name, c.city
FROM customers c,agents a
WHERE c.city = a.city;
--7.) Show the name of customers who live in the city thet makes the fewest different kinds of products.

SELECT *
FROM customers;

SELECT *
FROM agents;

SELECT *
FROM orders;

SELECT *
FROM products;