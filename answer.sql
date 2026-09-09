-- Week 1 Assignment: MySQL Database Creation
-- Student: Jirimano Lokangm
-- Database Topic: Library Management System
-- Description: This database manages books, members, and borrowing records

-- 1. Create the database
DROP DATABASE IF EXISTS library_management_db;
CREATE DATABASE library_management_db;
USE library_management_db;

-- 2. Create Tables

-- Table for Authors
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);

-- Table for Books
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    published_year INT,
    quantity_available INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Table for Members
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    join_date DATE
);

-- Table for Borrowing Records
CREATE TABLE BorrowRecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'borrowed',
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- 3. Insert sample data

INSERT INTO Authors (author_name, nationality) VALUES
('Chinua Achebe', 'Nigerian'),
('Ngugi wa Thiong\'o', 'Kenyan'),
('Chimamanda Ngozi Adichie', 'Nigerian');

INSERT INTO Books (title, author_id, category, published_year, quantity_available) VALUES
('Things Fall Apart', 1, 'Fiction', 1958, 5),
('Weep Not, Child', 2, 'Fiction', 1964, 3),
('Half of a Yellow Sun', 3, 'History', 2006, 4);

INSERT INTO Members (full_name, email, phone, join_date) VALUES
('Jirimano Lokangm', 'jirimano@example.com', '0700000000', '2026-09-01'),
('John Doe', 'john@example.com', '0711000000', '2026-09-02');

INSERT INTO BorrowRecords (book_id, member_id, borrow_date, status) VALUES
(1, 1, '2026-09-09', 'borrowed'),
(2, 2, '2026-09-08', 'returned');

-- 4. Verify data
SELECT * FROM Books;
SELECT * FROM Members;
