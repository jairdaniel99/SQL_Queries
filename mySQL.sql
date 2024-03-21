-- create a new database
CREATE DATABASE shopping;

USE shopping;

-- create product_categories table
CREATE TABLE product_categories (
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(45)
);

-- create products table
CREATE TABLE products (
id INT PRIMARY KEY AUTO_INCREMENT ,
title VARCHAR(45),
description MEDIUMTEXT,
product_category_id INT,
FOREIGN KEY (product_category_id) REFERENCES product_categories(id),
price DOUBLE,
quantity int
);

-- create orders table
CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
`name` VARCHAR(45),
email VARCHAR(45),
order_date DATETIME,
FOREIGN KEY (product_id) REFERENCES products(id)
);

-- insert data in product_categories
INSERT INTO product_categories (title) VALUES ("phones"),("computers"),("headphones"),("keyboards");
-- insert data in products
INSERT INTO products (title, DESCRIPTION, product_category_id, price, quantity) VALUES ("iphone", "phone device", 1, 1299.99, 2),
("mac", "computer", 2, 5299.99, 1), ("Beats", "Headphones", 3, 299.99, 4), ("logitech razer", "keyboards", 4, 99.99, 1);
-- insert data in orders
INSERT INTO orders (product_id, `name`, email, order_date) VALUES (2, "Jair", "myemail@hotmail.com", "2023-12-11"), (1, "David", "david@hotmail.com", "2020-12-1"),
(4, "Daniel", "daniel@hotmail.com", "2022-2-5"), (4, "Daniel", "daniel@hotmail.com", "2022-2-5"), (4, "Daniel", "daniel@hotmail.com", "2022-2-5"), (4, "Daniel", "daniel@hotmail.com", "2022-2-5");

-- get all orders from the most recent to the oldest
SELECT * FROM orders ORDER BY order_date DESC;
-- Get all products belonging to a particular category
SELECT * FROM products WHERE product_category_id = 2;
-- Get the top three most expensive products in the products table
SELECT * FROM products ORDER BY price DESC LIMIT 3;
-- Get the total number of products under each product category.
SELECT pc.title,COUNT(p.id) AS totalProducts FROM product_categories pc
JOIN products p ON pc.id = p.product_category_id
GROUP BY pc.title;

-- Get the top three selling products based on the number of orders.
SELECT p.title, count(o.id) AS totalOrders FROM products p
JOIN orders o ON p.id = o.product_id
GROUP BY p.title
ORDER BY totalOrders DESC
LIMIT 3;


SELECT *,COUNT(p.id) FROM product_categories pc
JOIN products p ON pc.id = p.product_category_id
GROUP BY pc.title;

SELECT * FROM product_categories;
SELECT * FROM products;
SELECT * FROM orders;