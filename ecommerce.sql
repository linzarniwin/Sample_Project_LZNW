DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE product_items 
(
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT
);

INSERT INTO product_items (product_name, category, price, stock) VALUES
('Floral Dress', 'Women Clothing', 24.99, 100),
('Denim Jacket', 'Women Clothing', 29.99, 50),
('Summer Top', 'Women Clothing', 19.99, 75),
('Skirt', 'Women Clothing', 29.99, 60),
('Leather Jacket', 'Women Clothing', 49.99, 30),
('Casual Shirt', 'Men Clothing', 19.99, 120),
('Jeans', 'Men Clothing', 49.99, 60),
('Casual Trousers', 'Men Clothing', 34.99, 90),
('Polo Shirt', 'Men Clothing', 24.99, 100),
('Hoodie', 'Men Clothing', 44.99, 50),
('Sports Jacket', 'Men Clothing', 69.99, 40);


CREATE TABLE customers 
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    age INT,
    gender VARCHAR(10),
    email VARCHAR(100),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);


INSERT INTO customers (first_name, last_name, date_of_birth, age, gender, email, address, city, state, country) VALUES
('Jane', 'Doe', '1985-05-15', 39, 'Female', 'jane.doe@example.com', '123 Maple St', 'Springfield', 'IL', 'USA'),
('Mary', 'Smith', '1990-10-30', 33, 'Female', 'mary.smith@example.com', '456 Oak St', 'Springfield', 'IL', 'USA'),
('Susan', 'Lee', '1975-07-07', 49, 'Female', 'susan.lee@example.com', '789 Pine St', 'Springfield', 'IL', 'USA'),
('Patricia', 'Johnson', '1980-01-22', 44, 'Female', 'patricia.johnson@example.com', '321 Birch St', 'Chicago', 'IL', 'USA'),
('Elizabeth', 'Williams', '1995-12-05', 28, 'Female', 'elizabeth.williams@example.com', '654 Cedar St', 'Naperville', 'IL', 'USA'),
('Jennifer', 'Brown', '1983-08-17', 41, 'Female', 'jennifer.brown@example.com', '987 Elm St', 'Peoria', 'IL', 'USA'),
('Linda', 'Davis', '1988-03-23', 36, 'Female', 'linda.davis@example.com', '432 Walnut St', 'Joliet', 'IL', 'USA'),
('Emily', 'Miller', '1993-11-14', 30, 'Female', 'emily.miller@example.com', '876 Spruce St', 'Evanston', 'IL', 'USA'),
('Sarah', 'Wilson', '1978-09-01', 46, 'Female', 'sarah.wilson@example.com', '543 Maple St', 'Aurora', 'IL', 'USA'),
('Ashley', 'Moore', '1992-04-18', 32, 'Female', 'ashley.moore@example.com', '210 Chestnut St', 'Springfield', 'IL', 'USA'),
('Marina', 'Smith', '1990-01-27', 34, 'Female', 'marina.smith@example.com', '322 Birch St', 'Chicago', 'IL', 'USA'),
('Martin', 'Taylor', '2000-01-25', 24, 'Male',  'm.taylor@example.com', '323 Birch St', 'Chicago', 'IL', 'USA'),
('John', 'Doe', '1985-05-15', 39, 'Male', 'john.doe@example.com', '123 Oak St', 'Springfield', 'IL', 'USA'),
('Michael', 'Smith', '1990-10-30', 33, 'Male', 'michael.smith@example.com', '456 Pine St', 'Chicago', 'IL', 'USA'),
('Alice', 'Walker', '1987-06-18', 27, 'Female', 'alice_walker@example.com', '321 Maple St', 'Chicago', 'IL', 'USA'),
('Robert', 'Harris', '1992-08-15', 32, 'Male', 'robert.harris@example.com', '123 Willow St', 'Springfield', 'IL', 'USA'),
('David', 'Clark', '1989-02-28', 35, 'Male', 'david.clark@example.com', '456 Sycamore St', 'Chicago', 'IL', 'USA'),
('James', 'Young', '1995-12-12', 28, 'Male', 'james.young@example.com', '789 Aspen St', 'Peoria', 'IL', 'USA');


CREATE TABLE orders 
(
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10, 2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES product_items(product_id)
);

INSERT INTO orders (customer_id, product_id, quantity, total_amount, order_date) VALUES
(1, 1, 7, 174.93, '2024-01-10'),
(2, 2, 12, 359.88, '2024-02-15'),
(3, 3, 8, 159.92, '2024-03-20'),
(4, 1, 15, 374.85, '2024-04-25'),
(5, 2, 9, 269.91, '2024-05-30'),
(6, 3, 20, 399.80, '2024-06-04'),
(7, 4, 11, 329.89, '2024-07-09'),
(8, 5, 13, 649.87, '2024-08-14'),
(9, 2, 10, 299.90, '2024-09-19'),
(10, 1, 5, 124.95, '2024-10-24'),
(1, 3, 5, 99.95, '2024-10-25'),
(1, 2, 6, 179.94, '2024-11-27'),
(2, 5, 4, 199.96, '2024-11-28'), 
(2, 3, 14, 279.86, '2024-12-02'),
(2, 1, 6, 149.94, '2024-12-08'), 
(3, 2, 7, 209.93, '2024-12-08'),
(3, 5, 2, 99.98, '2024-12-12'), 
(3, 4, 18, 539.82, '2024-12-18'),
(8, 2, 9, 269.91, '2024-12-10'),
(4, 5, 17, 849.83, '2025-01-05'),
(5, 4, 6, 179.94, '2025-1-7'),
(12, 11, 4, 159.96, '2025-01-10'),
(5, 1, 4, 99.96, '2025-02-10'),
(13, 7, 5, 249.95, '2025-02-15'),
(6, 2, 8, 239.92, '2025-03-15'),
(14, 8, 3, 104.97, '2025-03-20'),
(7, 3, 20, 399.80, '2025-04-20'),
(16, 9, 6, 149.94, '2025-04-25'),
(17, 10, 2, 89.98, '2025-04-27'),
(8, 4, 9, 269.91, '2025-05-25'),
(5, 3, 8, 159.92, '2025-06-05'),
(9, 5, 7, 349.93, '2025-06-30'),
(10, 1, 12, 299.88, '2025-07-05'),
(8, 4, 4, 119.96, '2025-07-30'),
(8, 3, 12, 239.88, '2024-08-18'),
(12, 10, 1, 44.99, '2025-09-05'),
(13, 8, 9, 314.91, '2025-09-10'),
(14, 6, 18, 359.82, '2025-09-15'),
(16, 7, 5, 249.95, '2025-09-20'),
(17, 8, 9, 314.91, '2025-09-25'),
(12, 9, 4, 99.96, '2025-09-30'),
(13, 6, 3, 59.97, '2025-10-05');