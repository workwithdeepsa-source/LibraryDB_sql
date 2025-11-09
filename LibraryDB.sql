CREATE DATABASE LibraryDB;
USE LibraryDB;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Quantity INT CHECK (Quantity >= 0)
);

CREATE TABLE Members (
    Member_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Issued_Books (
    Issue_ID INT PRIMARY KEY AUTO_INCREMENT,
    Book_ID INT,
    Member_ID INT,
    Issue_Date DATE,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);
INSERT INTO Books (Title, Author, Genre, Quantity)
VALUES ('The Alchemist', 'Paulo Coelho', 'Fiction', 5),
       ('Python Basics', 'Mark Lutz', 'Education', 3),
       ('Data Structures', 'Narasimha Karumanchi', 'Education', 2);

INSERT INTO Members (Name, Email, Phone)
VALUES ('Ananya Sharma', 'ananya@gmail.com', '9876543210'),
       ('Rohit Mehra', 'rohit@gmail.com', '9876123456');
INSERT INTO Issued_Books (Book_ID, Member_ID, Issue_Date, Return_Date)
VALUES (1, 1, '2025-11-01', '2025-11-15');
-- List all books
SELECT * FROM Books;

-- Find which member has issued which book
SELECT m.Name, b.Title, i.Issue_Date, i.Return_Date
FROM Issued_Books i
JOIN Members m ON i.Member_ID = m.Member_ID
JOIN Books b ON i.Book_ID = b.Book_ID;

-- Count number of issued books
SELECT COUNT(*) AS Total_Issued_Books FROM Issued_Books;
