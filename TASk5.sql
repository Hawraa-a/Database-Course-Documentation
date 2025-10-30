USE library_db;
GO
--- INSERT minimum: 
INSERT INTO Branches (Branch_Name, Address, Phone, Manager_Name, Opening_Date)
VALUES
('Central', 'Downtown, Muscat', '90000001', 'Fatma', '2018-03-15'),
('North', 'Al Khoud, Muscat', '90000002', 'Ahmed', '2019-06-10'),
('South', 'Al Amerat, Muscat', '90000003', 'Salim', '2020-01-05'),
('East', 'Muttrah, Muscat', '90000004', 'Aisha', '2021-07-22'),
('West', 'Seeb, Muscat', '90000005', 'Mariam', '2022-02-12');


INSERT INTO Members (Name, Email, Phone, Address, Membership_Type, Join_Date, Expiry_Date, Status)
VALUES
('John', 'john@example.com', '90111111', 'Muscat', 'Standard', '2024-01-01', '2025-01-01', 'Active'),
('Sara', 'sara@example.com', '90222222', 'Seeb', 'Premium', '2023-05-12', '2025-05-12', 'Active'),
('Omar', 'omar@example.com', '90333333', 'Barka', 'Standard', '2023-07-20', '2024-07-20', 'Expired'),
('Layla', 'layla@example.com', '90444444', 'Muscat', 'Premium', '2024-09-15', '2025-09-15', 'Active'),
('Nasser', 'nasser@example.com', '90555555', 'Ibri', 'Standard', '2023-02-10', '2024-02-10', 'Expired'),
('Maha', 'maha@example.com', '90666666', 'Rustaq', 'Standard', '2024-04-05', '2025-04-05', 'Active'),
('Hassan', 'hassan@example.com', '90777777', 'Muscat', 'Premium', '2024-06-08', '2025-06-08', 'Active'),
('Aisha', 'aisha@example.com', '90888888', 'Nizwa', 'Standard', '2023-12-12', '2024-12-12', 'Expired'),
('Yousef', 'yousef@example.com', '90999999', 'Sohar', 'Premium', '2023-08-08', '2025-08-08', 'Active'),
('Amal', 'amal@example.com', '91010101', 'Muscat', 'Standard', '2024-01-20', '2025-01-20', 'Active'),
('Khalid', 'khalid@example.com', '91020202', 'Ibri', 'Premium', '2023-03-03', '2025-03-03', 'Active'),
('Fatma', 'fatma@example.com', '91030303', 'Seeb', 'Standard', '2024-04-04', '2025-04-04', 'Active'),
('Rashid', 'rashid@example.com', '91040404', 'Muscat', 'Premium', '2022-05-05', '2024-05-05', 'Expired'),
('Huda', 'huda@example.com', '91050505', 'Sohar', 'Standard', '2024-07-07', '2025-07-07', 'Active'),
('Salim', 'salim@example.com', '91060606', 'Barka', 'Premium', '2023-09-09', '2025-09-09', 'Active'),
('Reem', 'reem@example.com', '91070707', 'Muscat', 'Standard', '2023-10-10', '2024-10-10', 'Expired'),
('Faisal', 'faisal@example.com', '91080808', 'Rustaq', 'Standard', '2024-02-02', '2025-02-02', 'Active'),
('Noor', 'noor@example.com', '91090909', 'Muscat', 'Premium', '2024-08-08', '2025-08-08', 'Active'),
('Hindi', 'hind@example.com', '91101010', 'Muscat', 'Standard', '2023-11-11', '2024-11-11', 'Expired'),
('Talal', 'talal@example.com', '91111111', 'Seeb', 'Premium', '2024-09-01', '2025-09-01', 'Active');

INSERT INTO Authors (Name, Biography, Birth_Year, Nationality)
VALUES
('Alice', 'British novelist', '1975-03-14', 'UK'),
('Bob', 'American writer', '1980-12-21', 'USA'),
('Layla', 'Omani author', '1985-10-03', 'Oman'),
('Hassan', 'Egyptian poet', '1970-09-15', 'Egypt'),
('Noura', 'Emirati writer', '1990-08-16', 'UAE'),
('David', 'Canadian historian', '1965-07-16', 'Canada'),
('Salma', 'Omani researcher', '1988-11-16', 'Oman'),
('Ali', 'Pakistani novelist', '1978-08-07', 'Pakistan'),
('Fatima', 'Moroccan poet', '1984-04-12', 'Morocco'),
('Tom', 'American author', '1992-02-11', 'USA');

ALTER TABLE Publishers
ALTER COLUMN Name NVARCHAR(50) NOT NULL;
ALTER TABLE Publishers
ALTER COLUMN Contact_Email NVARCHAR(50) NOT NULL;

INSERT INTO Publishers (Name, Country, Contact_Email, Established_Year)
VALUES
('ABC Press', 'USA', 'info@abcpress.com', 1995),
('Pearl House', 'UK', 'contact@pearlhouse.co.uk', 2000),
('Al Noor Publications', 'Oman', 'support@alnoor.om', 2010),
('Sunrise Books', 'UAE', 'hello@sunrise.ae', 2005),
('Global Reads', 'Canada', 'info@globalreads.ca', 1998);

INSERT INTO Categories (Category_Name, Description)
VALUES
('Fiction', 'Narrative literary works'),
('Drama', 'Plays and stage works'),
('History', 'Historical literature'),
('Science', 'Scientific topics'),
('Children', 'Books for kids'),
('Poetry', 'Poetic collections'),
('Technology', 'Tech and IT related'),
('Travel', 'Guides and exploration');

INSERT INTO Books (ISBN, Title, Edition, Publication_Year, Total_Copies, Available_Copies, Shelf_Location, Book_Condition, Publisher_ID)
VALUES
('ISBN001', 'The Great Novel', '1st', 2020, 10, 3, 'A1', 'Good', 5),
('ISBN002', 'Desert Dreams', '2nd', 2022, 5, 2, 'A2', 'New', 6),
('ISBN003', 'Modern Poetry', '1st', 2018, 7, 0, 'B1', 'Fair', 7),
('ISBN004', 'Oman Through Time', '3rd', 2021, 4, 1, 'C1', 'Good', 8),
('ISBN005', 'The Tech Age', '1st', 2023, 8, 5, 'T1', 'New', 9),
('ISBN006', 'History of Arabia', '1st', 2019, 6, 2, 'H1', 'Good', 8),
('ISBN007', 'Poems of Life', '2nd', 2017, 3, 0, 'P1', 'Fair', 7),
('ISBN008', 'Child Adventures', '1st', 2020, 5, 3, 'C2', 'New', 6),
('ISBN009', 'Science Today', '1st', 2024, 10, 8, 'S1', 'New', 9),
('ISBN010', 'Travel Oman', '2nd', 2022, 6, 4, 'T2', 'Good', 8),
('ISBN011', 'The Hidden Pearl', '1st', 2023, 4, 2, 'F1', 'Good', 7),
('ISBN012', 'Digital Future', '1st', 2023, 5, 1, 'T3', 'Good', 9),
('ISBN013', 'Lost City', '2nd', 2018, 7, 6, 'A3', 'Good', 5),
('ISBN014', 'Desert Flower', '1st', 2019, 4, 2, 'A4', 'Fair', 6),
('ISBN015', 'World of Science', '3rd', 2020, 9, 9, 'S2', 'New', 9),
('ISBN016', 'Programming Basics', '1st', 2023, 8, 5, 'T4', 'New', 9),
('ISBN017', 'Advanced SQL', '1st', 2021, 10, 7, 'T5', 'Good', 9),
('ISBN018', 'Ocean Tales', '2nd', 2022, 4, 3, 'A5', 'Good', 5),
('ISBN019', 'Cultural Oman', '1st', 2020, 6, 2, 'C3', 'Good', 8),
('ISBN020', 'Desert Legends', '1st', 2024, 3, 0, 'A6', 'Fair', 6),
('ISBN021', 'History Unfolded', '1st', 2021, 7, 6, 'H2', 'Good', 8),
('ISBN022', 'Innovation Age', '1st', 2022, 10, 9, 'T6', 'New', 9),
('ISBN023', 'Journey Beyond', '2nd', 2023, 5, 3, 'T7', 'Good', 5),
('ISBN024', 'Poetry of the Desert', '1st', 2019, 4, 0, 'P2', 'Fair', 7),
('ISBN025', 'Child World', '1st', 2021, 6, 5, 'C4', 'New', 6),
('ISBN026', 'AI Revolution', '1st', 2024, 8, 4, 'T8', 'New', 9),
('ISBN027', 'Muscat Memoirs', '2nd', 2020, 4, 2, 'C5', 'Good', 8),
('ISBN028', 'Desert Journey', '1st', 2021, 5, 2, 'A7', 'Good', 5),
('ISBN029', 'Wonders of Science', '1st', 2023, 6, 5, 'S3', 'New', 9),
('ISBN030', 'Beyond Time', '2nd', 2022, 4, 4, 'A8', 'Good', 5);

UPDATE Books SET Rating = 5 WHERE Book_ID IN (1, 5, 9, 15, 22, 26, 29);
UPDATE Books SET Rating = 4 WHERE Book_ID IN (2, 6, 10, 16, 23, 27, 30);
UPDATE Books SET Rating = 3 WHERE Book_ID IN (3, 7, 11, 17, 24, 28);
UPDATE Books SET Rating = 2 WHERE Book_ID IN (4, 8, 12, 18, 20, 25);
UPDATE Books SET Rating = 1 WHERE Book_ID IN (13, 14, 19, 21, 31);

CREATE TABLE BookAuthors (
BookID INT NOT NULL,
AuthorID INT NOT NULL,
PRIMARY KEY (BookID, AuthorID), 
CONSTRAINT FK_BookAuthors_Book FOREIGN KEY (BookID) REFERENCES Books(Book_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT FK_BookAuthors_Author FOREIGN KEY (AuthorID) REFERENCES Authors(Author_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

CREATE TABLE BookCategories (
BookID INT NOT NULL,
CategoryID INT NOT NULL,
PRIMARY KEY (BookID, CategoryID),
CONSTRAINT FK_BookCategories_Book FOREIGN KEY (BookID) REFERENCES Books(Book_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE,
CONSTRAINT FK_BookCategories_Category FOREIGN KEY (CategoryID)
 REFERENCES Categories(Category_ID)
 ON DELETE CASCADE
 ON UPDATE CASCADE
);

INSERT INTO BookAuthors (BookID, AuthorID)
VALUES
(2,1), (2,2), (3,3), (4,9), (4,10), (5,7), (6,6),
(7,4), (8,9), (9,3), (10,3), (11,6), (12,5), (13,1), (14,2), 
(15,3), (16,8), (17,8), (18,6), (19,1), (20,7), (21,6),
(22,3), (23,4), (24,1), (25,9), (26,5), (27,3), (28,3), (29,1), (30,2), (31,4);


INSERT INTO BookCategories (BookID, CategoryID)
VALUES
(2,1),(2,2),(3,1),(4,6),(5,3),(6,7),(7,3),(8,6),(9,5),(10,4),
(11,8),(12,1),(13,1),(14,1),(15,4),(16,7),(17,7),(18,1),(19,3),(20,1),
(21,3),(22,7),(23,8),(24,6),(25,5),(26,7),(27,3),(28,1),(29,4),(30,1),(31,2);

INSERT INTO Borrowing (MemberID, BookID, BranchID, BorrowDate, DueDate, ReturnDate, Status)
VALUES
(1,2,3,'2025-10-01','2025-10-15',NULL,'Borrowed'),
(2,3,3,'2025-09-10','2025-09-25','2025-09-22','Returned'),
(3,4,4,'2025-08-05','2025-08-20','2025-09-01','Overdue'),
(4,5,3,'2025-09-30','2025-10-14',NULL,'Borrowed'),
(5,7,5,'2025-07-15','2025-07-29','2025-08-01','Overdue'),
(6,2,3,'2025-06-01','2025-06-15','2025-06-10','Returned'),
(7,9,4,'2025-10-10','2025-10-24',NULL,'Borrowed'),
(8,11,3,'2025-08-12','2025-08-26','2025-08-25','Returned'),
(9,13,4,'2025-09-01','2025-09-15',NULL,'Overdue'),
(10,14,3,'2025-10-05','2025-10-19',NULL,'Borrowed'),
(11,15,5,'2025-07-10','2025-07-24','2025-07-23','Returned'),
(12,17,5,'2025-09-01','2025-09-15','2025-09-20','Overdue'),
(13,18,4,'2025-10-01','2025-10-15',NULL,'Borrowed'),
(14,19,3,'2025-08-05','2025-08-19','2025-08-18','Returned'),
(15,20,3,'2025-09-10','2025-09-24','2025-09-30','Overdue'),
(16,21,4,'2025-07-12','2025-07-26','2025-07-25','Returned'),
(17,22,5,'2025-08-02','2025-08-16','2025-08-20','Overdue'),
(18,23,4,'2025-09-11','2025-09-25','2025-09-23','Returned'),
(19,24,5,'2025-10-05','2025-10-19',NULL,'Borrowed'),
(20,25,4,'2025-10-10','2025-10-24',NULL,'Borrowed'),
(1,26,3,'2025-09-01','2025-09-15','2025-09-14','Returned'),
(2,27,4,'2025-08-10','2025-08-24','2025-08-22','Returned'),
(3,28,5,'2025-07-05','2025-07-19','2025-07-18','Returned'),
(4,29,4,'2025-09-12','2025-09-26','2025-09-27','Overdue'),
(5,30,5,'2025-10-01','2025-10-15',NULL,'Borrowed');

INSERT INTO Fines (BorrowID, FineAmount, PaidAmount, PaymentDate, Status)
VALUES
(3,5.00,0.00,NULL,'Pending'),
(5,2.50,2.50,'2025-08-05','Paid'),
(9,3.00,0.00,NULL,'Pending'),
(12,1.50,0.00,NULL,'Pending'),
(15,4.00,4.00,'2025-09-30','Paid'),
(17,2.00,0.00,NULL,'Pending'),
(20,1.00,0.00,NULL,'Pending'),
(23,3.00,3.00,'2025-09-30','Paid');

INSERT INTO Reservations (MemberID, BookID, ReservationDate, ExpiryDate, Status)
VALUES
(2,3,'2025-10-10','2025-10-25','Active'),
(4,7,'2025-09-20','2025-10-05','Fulfilled'),
(6,20,'2025-09-01','2025-09-20','Expired'),
(8,24,'2025-10-01','2025-10-20','Active'),
(10,2,'2025-10-15','2025-10-30','Active');

---UPDATE scenarios:
UPDATE Members
SET Membership_Type = 'Premium'
WHERE Name = 'John'

UPDATE Borrowing
SET ReturnDate = GETDATE(), Status = 'Returned'
WHERE BorrowID IN (1,4,10);

UPDATE Books
SET Available_Copies = Available_Copies + 1
WHERE Book_ID IN (5,14);

UPDATE Fines
SET Status = 'Paid', PaymentDate = GETDATE(), PaidAmount = FineAmount
WHERE FineID = 10;

---DELETE scenarios:
DELETE FROM Reservations
WHERE Status = 'Expired';

DELETE FROM Members
WHERE Member_ID = 1;