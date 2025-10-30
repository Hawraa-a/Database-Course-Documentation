SELECT Book_ID, Title, Publication_Year
FROM Books
WHERE Publication_Year > 2020;

SELECT Member_ID, Name, Expiry_Date
FROM Members
WHERE Expiry_Date BETWEEN GETDATE() AND DATEADD(DAY, 30, GETDATE());

SELECT BorrowID, MemberID, BookID, DueDate
FROM Borrowing
WHERE ReturnDate IS NULL 
  AND DueDate < CAST(GETDATE() AS DATE)
  AND Status = 'Overdue';

SELECT Book_ID, Title
FROM Books
WHERE Book_ID NOT IN (SELECT BookID FROM Borrowing);

SELECT m.Member_ID, m.Name, SUM(f.FineAmount - f.PaidAmount) AS PendingAmount
FROM Members m
JOIN Borrowing br ON m.Member_ID = br.MemberID
JOIN Fines f ON br.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY m.Member_ID, m.Name
HAVING SUM(f.FineAmount - f.PaidAmount) > 10;

SELECT b.Book_ID, b.Title, c.Category_Name
FROM Books b
JOIN BookCategories bc ON b.Book_ID = bc.BookID
JOIN Categories c ON bc.CategoryID = c.Category_ID
WHERE c.Category_Name = 'Fiction';

SELECT Book_ID, Title, Available_Copies, Total_Copies
FROM Books
WHERE Available_Copies < 2;

SELECT Author_ID, Name, Nationality
FROM Authors
WHERE Nationality IN ('USA', 'UK');

SELECT b.Book_ID, b.Title, p.Name AS Publisher
FROM Books b
JOIN Publishers p ON b.Publisher_ID = p.Publisher_ID
WHERE p.Name = 'Penguin Random House';

SELECT BorrowID, MemberID, BookID, BorrowDate
FROM Borrowing
WHERE BorrowDate BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE();