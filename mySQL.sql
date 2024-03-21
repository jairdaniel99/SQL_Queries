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

INSERT INTO products (