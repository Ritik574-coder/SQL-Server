/*===========================================================================
Project 1.1: Library Database
Description: Create a simple library management system

Tasks:

==>> Create all three tables with proper constraints
==>> Insert sample data (10+ books, 5+ members)
==>> Write queries to:
        List all books
        Find books by author
        Show available books only
        List members who joined this year

Author : Ritik__
=============================================================================*/
-- TASKS 1 
-----------------------------------------------------------------------------
-- Books table
CREATE TABLE books (
    book_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    isbn VARCHAR(13) UNIQUE,
    publication_year INT,
    genre VARCHAR(50),
    available_copies INT DEFAULT 1,
    created_at DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME()
);

-- Members table
CREATE TABLE members (
    member_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    join_date DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
    membership_type VARCHAR(20) DEFAULT 'basic'
);

-- Borrowings table
CREATE TABLE borrowings (
    borrowing_id INT IDENTITY(1,1) PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    member_id INT REFERENCES members(member_id),
    borrow_date DATETIME2(3) NOT NULL DEFAULT SYSUTCDATETIME(),
    due_date DATE,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'borrowed'
);
-----------------------------------------------------------------------------
-- TASK 2 

-- BOOK 
INSERT INTO books (title, author, isbn, publication_year, genre, available_copies)
VALUES
    ('Atomic Habits', 'James Clear', '9780735211292', 2018, 'Self-Help', 5),
    ('The Pragmatic Programmer', 'Andrew Hunt', '9780201616224', 1999, 'Programming', 3),
    ('Clean Code', 'Robert C. Martin', '9780132350884', 2008, 'Programming', 4),
    ('Deep Work', 'Cal Newport', '9781455586691', 2016, 'Productivity', 2),
    ('Zero to One', 'Peter Thiel', '9780804139298', 2014, 'Business', 6);

-- MEMBERS
INSERT INTO members (first_name, last_name, email, phone, membership_type)
VALUES
    ('Ritik', 'Sharma', 'ritik1@email.com', '9876543210', 'premium'),
    ('Aman', 'Verma', 'aman@email.com', '9123456780', 'basic'),
    ('Priya', 'Singh', 'priya@email.com', '9988776655', 'basic'),
    ('Karan', 'Mehta', 'karan@email.com', '9012345678', 'premium'),
    ('Neha', 'Gupta', 'neha@email.com', '9090909090', 'basic');

--BORROWING
INSERT INTO borrowings (book_id, member_id, due_date, status)
VALUES
    (1, 1, '2026-02-20', 'borrowed'),
    (2, 2, '2026-02-18', 'borrowed'),
    (3, 3, '2026-02-25', 'returned'),
    (4, 4, '2026-02-22', 'borrowed'),
    (5, 5, '2026-02-28', 'borrowed');
-------------------------------------------------------------------------------------
-- TASK 3

--List all books
SELECT * FROM books ; 

--Find books by author
SELECT title, author
FROM books ;

--Show available books only
SELECT * FROM books 
WHERE available_copies > 0 ;

--List members who joined this year
SELECT * FROM members
WHERE YEAR(join_date) = YEAR(GETDATE()) ;
