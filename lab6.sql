﻿--David Emory 
--Lab 6
--3/1/16

--1. Display the name and city of customers who live in any city that makes the most different kinds of 
--products. (There are two cities that make the most different products. Return the name and city of
--customers from either one of those.)
SELECT c.name , c.city 
FROM customers c
WHERE c.city IN (SELECT p.city
	       FROM products p
	       GROUP BY p.city
	       HAVING COUNT(city) IN ( (SELECT MAX (Num) 
					FROM (SELECT Count(p.city) AS Num 
					      FROM products p 
					      GROUP BY p.city) AS a ) )
	       LIMIT 1);
--2. Display the names of products whose priceUSD is strictly above the average priceUSD, in reverse alphabetical
--order.
SELECT p.name
FROM products p
WHERE p.priceUSD > (SELECT AVG(p.priceUSD) 
		    FROM products p)
ORDER BY p.name DESC;

--3. Display the customer name, pid ordered, and the total for all orders, sorted by total from high to low.
SELECT c.name, o.pid, o.dollars
FROM customers c
JOIN orders o ON o.cid = c.cid
ORDER BY o.dollars DESC; 

--4. Display all customer names (in alphabetical order) and their total ordered, and nothing more. Use
--coalesce to avoid showing NULLs.
SELECT DISTINCT c.name, SUM(COALESCE(o.dollars, 0.00))
FROM customers c
LEFT JOIN orders o ON o.cid = c.cid
GROUP BY c.name
ORDER BY c.name ASC;

--5. Display the names of all customers who bought products from agents based in Tokyo along with the
--names of the products they ordered, and the names of the agents who sold it to them.
SELECT c.name, p.name, a.name
FROM customers c
JOIN orders o ON o.cid = c.cid
JOIN agents a ON o.aid = a.aid
JOIN products p ON o.pid = p.pid
WHERE a.city = 'Tokyo';

--6. Write a query to check the accuracy of the dollars column in the Orders table. This means calculating
--Orders.totalUSD from data in other tables and comparing those values to the values in Orders.totalUSD.
--Display all rows in Orders where Orders.totalUSD is incorrect, if any.
SELECT *
FROM (SELECT o.*, o.qty*p.priceusd*(1-(discount/100)) AS truedollars
      FROM orders o
      INNER JOIN products p ON o.pid = p.pid
      INNER JOIN customers c ON o.cid = c.cid) AS tmptable
WHERE dollars != truedollars;
--7. What is the difference between a LEFT OUTER JOIN and a RIGHT OUTER JOIN? Give example
--queries in SQL to demonstrate. (Feel free to use the CAP2 database to make your points here.)
SELECT *
FROM customers c
LEFT JOIN orders o ON c.cid = o.cid;
--This is an example of a Left outer joins. It selects everything from the customers table. 
--The left join combines the the orders table and customers tables allowing for veiwing of all rows of both tables
--Cid 'c005' has null values for anything in the orders table because there where no orders placed by this customer. 
--If we did a right join this row would not appear because the join would validate with the order table versus the customers table.
SELECT *
FROM customers c
RIGHT JOIN orders o ON c.cid = o.cid;
--This right outer join is to demonstrate the row ith null values not appearing in this query. 