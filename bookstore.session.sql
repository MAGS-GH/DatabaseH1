-- Her ser i et eksemple på hvordan en boghandlers database kunne se ud - i en forsimplet udgave
-- @block Create the 'bookstore' database
CREATE DATABASE bookstore;

-- @block Use the 'bookstore' database - denne kommando er lidt ligegyldig når vi bruger SQLTools
USE bookstore;

-- @block Create the 'authors' table
CREATE TABLE authors (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  bio TEXT
);

-- @block Create the 'books' table
CREATE TABLE books (
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author_id INT NOT NULL,
  publication_date DATE,
  isbn VARCHAR(13),
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (author_id) REFERENCES authors(id)
);

-- @block Create the 'customers' table
CREATE TABLE customers (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  address VARCHAR(255),
  phone VARCHAR(20)
);

-- @block Create the 'orders' table
CREATE TABLE orders (
  id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  total_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- @block Create the 'order_items' table
CREATE TABLE order_items (
  id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity INT NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);

-- @block Insert data into the 'authors' table
INSERT INTO authors (name, bio) VALUES
  ('J.K. Rowling', 'Author of the Harry Potter series.'),
  ('Stephen King', 'Author of horror, supernatural fiction, suspense, and fantasy novels.');

-- @block Insert data into the 'books' table
INSERT INTO books (title, author_id, publication_date, isbn, price) VALUES
  ('Harry Potter and the Philosopher''s Stone', 1, '1997-06-26', '9780747532743', 9.99),
  ('Harry Potter and the Chamber of Secrets', 1, '1998-07-02', '9780747538486', 10.99),
  ('Harry Potter and the Prisoner of Azkaban', 1, '1999-07-08', '9780747542155', 11.99),
  ('The Shining', 2, '1977-01-28', '9780385121675', 8.99),
  ('It', 2, '1986-09-15', '9780450411434', 12.99);

-- @block Insert data into the 'customers' table
INSERT INTO customers (name, email, address, phone) VALUES
  ('John Smith', 'john.smith@example.com', '123 Main St, Anytown, USA', '+1 555-555-5555'),
  ('Jane Doe', 'jane.doe@example.com', '456 Oak St, Anytown, USA', '+1 555-555-5555');

-- @block Insert data into the 'orders' table
INSERT INTO orders (customer_id, total_price) VALUES
  (1, 21.98),
  (2, 10.99);

-- @block Insert data into the 'order_items' table
INSERT INTO order_items (order_id, book_id, quantity, price) VALUES
  (1, 1, 2, 9.99),
  (1, 2, 1, 10.99),
  (2, 5, 1, 12.99);

-- @block INNER Join 
SELECT c.name, b.title
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_items oi ON o.id = oi.order_id
INNER JOIN books b ON oi.book_id = b.id;

-- @block Left Join
SELECT c.name, o.id
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- @block Right Join
SELECT a.name, b.title
FROM authors a
RIGHT JOIN books b ON a.id = b.author_id;
