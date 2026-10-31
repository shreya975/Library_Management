-- =====================================================
-- SQL Project
-- Library Management System
-- =====================================================


-- =====================================================
-- Create and Select the Database
-- =====================================================
create database LibraryDB;
use LibraryDB;


-- Step: Create Books Table
CREATE TABLE Books(
BookID int primary key,
Title varchar(100) Not null,
Author varchar(50),
Genre varchar(50),
PublishedYear int,
CopiesAvailable int);

-- Step: Create Members Table
CREATE TABLE Members(
MemberID int primary key,
Name varchar(75),
MembershipDate date,
Email varchar(75),
PhoneNumber varchar(20));

-- Step: Create Borrowing Table
CREATE TABLE Borrowing(
BorrowID int primary key,
BookID int,
MemberID int,
BorrowDate date,
ReturnDate date);

-- Step: Insert Sample Data into Books
INSERT INTO Books (BookID, Title, Author, Genre, PublishedYear, CopiesAvailable) VALUES 
(1, 'To Kill a Mockingbird', 'Harper Lee', 'FicƟ on', 1960, 5),
(2, '1984', 'George Orwell', 'Dystopian', 1949, 3), 
(3, 'Moby Dick', 'Herman Melville', 'Adventure', 1851, 4), 
(4, 'The Great Gatsby', 'F. ScoƩ Fitzgerald', 'Classic', 1925, 2),
(5, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813, 6), 
(6, 'The Catcher in the Rye', 'J.D. Salinger', 'FicƟ on', 1951, 4),
(7, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 1937, 7), 
(8, 'The Da Vinci Code', 'Dan Brown', 'Thriller', 2003, 5), 
(9, 'The Alchemist', 'Paulo Coelho', 'Philosophy', 1988, 6), 
(10, 'War and Peace', 'Leo Tolstoy', 'Historical FicƟ on', 1869, 3);

-- Step: Insert Sample Data into Members
INSERT INTO Members (MemberID, Name, MembershipDate, Email, PhoneNumber) VALUES 
(1, 'Alice Johnson', '2022-01-15', 'alice@example.com', '123-456-7890'), 
(2, 'Bob Smith', '2023-03-10', 'bob@example.com', '234-567-8901'), 
(3, 'Charlie Brown', '2021-11-25', 'charlie@example.com', '345-678-9012'), 
(4, 'Diana Prince', '2020-07-05', 'diana@example.com', '456-789-0123'), 
(5, 'Evan Parker', '2022-06-30', 'evan@example.com', '567-890-1234'), 
(6, 'Frank Castle', '2023-01-01', 'frank@example.com', '678-890-2345'), 
(7, 'Grace Hopper', '2022-11-30', 'grace@example.com', '789-012-3456'), 
(8, 'Hannah Baker', '2021-09-15', 'hannah@example.com', '890-123-4567'), 
(9, 'Isaac Newton', '2023-04-05', 'isaac@example.com', '901-234-5678'), 
(10, 'Jack Ryan', '2022-03-22', 'jack@example.com', '012-345-6789');

-- Step: Insert Sample Data into Borrowing
INSERT INTO Borrowing (BorrowID, BookID, MemberID, BorrowDate, ReturnDate) VALUES 
(1, 1, 1, '2023-01-10', '2023-01-20'), 
(2, 2, 2, '2023-02-15', '2023-02-25'), 
(3, 3, 3, '2023-03-05', NULL), 
(4, 4, 4, '2023-04-01', '2023-04-15'), 
(5, 5, 5, '2023-05-20', NULL), 
(6, 6, 6, '2023-01-10', '2023-01-20'), 
(7, 7, 7, '2023-02-05', '2023-02-15'), 
(8, 8, 8, '2023-03-10', NULL), 
(9, 9, 9, '2023-04-20', '2023-05-01'), 
(10, 10, 10, '2023-05-25', NULL);






-- =====================================================
-- SQL Tasks
-- =====================================================

-- Task 1: Retrieve all book details.
SELECT * FROM Books;

-- Task 2: Find members who joined after January 1, 2022.
SELECT * FROM Members WHERE MembershipDate > '2022-01-01';

-- Task 3: List books with fewer than 3 copies available.
SELECT * FROM Books WHERE CopiesAvailable < 3;

-- Task 4: Show borrowing history with member names and book titles.
SELECT b.BorrowID, m.Name, bk.Title, b.BorrowDate, b.ReturnDate FROM Borrowing b
JOIN Members m ON b.MemberID = m.MemberID
JOIN Books bk ON b.BookID = bk.BookID;

-- Task 5: Identify overdue books that have not been returned.
SELECT b.BorrowID, bk.Title, m.Name, b.BorrowDate FROM Borrowing b
JOIN Books bk ON b.BookID = bk.BookID
JOIN Members m ON b.MemberID = m.MemberID
WHERE b.ReturnDate IS NULL AND b.BorrowDate < CURDATE();

-- Task 6: Find members who borrowed books from at least three different genres.
SELECT m.MemberID, m.Name FROM Members m
JOIN Borrowing b ON m.MemberID = b.MemberID
JOIN Books bk ON b.BookID = bk.BookID
GROUP BY m.MemberID, m.Name
HAVING COUNT(DISTINCT bk.Genre) >= 3;

-- Task 7: Display the top three most borrowed books.
SELECT bk.BookID, bk.Title, COUNT(*) AS TimesBorrowed FROM Borrowing b
JOIN Books bk ON b.BookID = bk.BookID
GROUP BY bk.BookID, bk.Title
ORDER BY TimesBorrowed DESC
LIMIT 3;

-- Task 8: Display the total number of books in each genre.
SELECT Genre, COUNT(*) AS TotalBooks FROM Books GROUP BY Genre;

-- Task 9: Retrieve borrowing history for Member ID = 3.
SELECT b.BorrowID, bk.Title, b.BorrowDate, b.ReturnDate FROM Borrowing b
JOIN Books bk ON b.BookID = bk.BookID WHERE b.MemberID = 3;

-- Task 10: List books borrowed during the last 30 days.
SELECT bk.BookID, bk.Title, m.Name, b.BorrowDate FROM Borrowing b
JOIN Books bk ON b.BookID = bk.BookID
JOIN Members m ON b.MemberID = m.MemberID
WHERE b.BorrowDate >= CURDATE() - INTERVAL 30 DAY;

-- Task 11: Calculate the average borrowing duration.
SELECT AVG(DATEDIFF(ReturnDate, BorrowDate)) AS AverageBorrowDays
FROM Borrowing WHERE ReturnDate IS NOT NULL;

-- Task 12: Find the least borrowed book.
SELECT bk.BookID, bk.Title, COUNT(b.BorrowID) AS TimesBorrowed FROM Books bk
LEFT JOIN Borrowing b ON bk.BookID = b.BookID
GROUP BY bk.BookID, bk.Title
ORDER BY TimesBorrowed ASC
LIMIT 1;