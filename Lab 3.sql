
SELECT ordno, dollars
FROM orders;

SELECT name, city
FROM agents 
WHERE name = 'Smith';

SELECT pid, name, priceUSD, quantity
FROM products
WHERE quantity > 208000;

SELECT name, city
FROM customers
WHERE city = 'Dallas';

SELECT name, city
FROM agents
WHERE city != 'New York' AND city != 'Tokyo';

SELECT *
FROM products
WHERE priceusd >= 1.00 AND city != 'Dallas' AND city != 'Duluth';

SELECT *
FROM orders
WHERE mon = 'jan' OR mon = 'mar';

SELECT *
FROM orders
WHERE mon = 'feb' AND dollars < 500;

SELECT *
FROM customers
WHERE cid = 'c005';