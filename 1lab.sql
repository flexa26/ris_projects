sql
create table categories(
category_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL UNIQUE
);
sql
CREATE TABLE products(
product_id INT AUTO_INCREMENT PRIMARY KEY,
category_id INT,
name VARCHAR(100) NOT NULL,
description TEXT,
price DECIMAL(10,2) CHECK(price>=0),
FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
sql
CREATE TABLE customers(
customer_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
phone_number VARCHAR(20)
);
sql
create table orders(
order_id int auto_increment primary key,
customer_id int,
total_amount decimal(10,2) default 0,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
FOREIGN KEY (customer_id) references customers(customer_id)
);
sql
create table order_details(
detail_id int auto_increment primary key,
order_id int,
product_id int,
quantity int default 1 check(quantity>0),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);
sql
create index idx_products_category on customers(first_name, last_name);
create index idx_products_category on products(category_id);
sql
insert into categories(name) values ('Электроника'),('Одежда');
insert into products(category_id, name, description, price) values(
1,'Смартфон','Современный смартфон с мощным аккумулятором.',499.99),
(2,'Джинсы','Классические джинсы темно-синего цвета', 59.99);
insert into customers(first_name, last_name, email, phone_number) values(
'Иван','Иванов','ivan@example.com','+79991234567'),
('Анна', 'Петрова', 'anna@example.com', '+79997654321');
INSERT INTO orders (customer_id, total_amount) VALUES
(1, 499.99); -- Первый покупатель сделал покупку смартфона
INSERT INTO order_details (order_id, product_id, quantity) VALUES
(1, 1, 1); -- Смартфон в количестве одной штуки