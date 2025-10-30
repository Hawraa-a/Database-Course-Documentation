---COUNT: 
SELECT 
m.Member_ID,
m.Name,
COUNT(br.BorrowID) AS TotalBorrowings
FROM Members m
LEFT JOIN Borrowing br ON m.Member_ID = br.MemberID
GROUP BY m.Member_ID, m.Name;

SELECT 
c.Category_Name,
COUNT(bc.BookID) AS BookCount
FROM Categories c
LEFT JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_Name;

SELECT 
brn.Branch_Name,
COUNT(b.BorrowID) AS OverdueCount
FROM Borrowing b
JOIN Branches brn ON b.BranchID = brn.Branch_ID
WHERE b.Status = 'Overdue'
GROUP BY brn.Branch_Name;

---SUM: 
SELECT 
MONTH(PaymentDate) AS Month,
SUM (PaidAmount) AS TotalFines
From Fines
WHERE Status = 'Paid'
GROUP BY MONTH(PaymentDate);

SELECT 
m.Member_ID,
m.Name,
SUM(f.FineAmount - f.PaidAmount) AS PendingFines
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY m.Member_ID, m.Name;

SELECT 
p.Name AS Publisher,
SUM(b.Available_Copies) AS TotalAvailableCopies
FROM Publishers p
JOIN Books b ON p.Publisher_ID = b.Publisher_ID
GROUP BY p.Name;

---AVG: 
SELECT 
AVG(DATEDIFF(DAY, BorrowDate, ISNULL(ReturnDate, GETDATE()))) AS AvgBorrowDays
FROM Borrowing
WHERE ReturnDate IS NOT NULL;

SELECT 
m.Name,
AVG(f.FineAmount) AS AvgFine
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
GROUP BY m.Name;

SELECT 
    br.Branch_Name,
    AVG(BorrowCount) AS AvgBooksBorrowed
FROM Branches br
JOIN (
    SELECT BranchID, COUNT(*) AS BorrowCount
    FROM Borrowing
    GROUP BY BranchID
) b ON br.Branch_ID = b.BranchID
GROUP BY br.Branch_Name;

---MIN/MAX:
SELECT 
MIN(Publication_Year) AS OldestPublication,
MAX(Publication_Year) AS NewestPublication
FROM Books;

SELECT TOP 1 m.Name, COUNT(b.BorrowID) AS TotalBorrowings
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
GROUP BY m.Name
ORDER BY TotalBorrowings DESC;

SELECT TOP 1 m.Name, COUNT(b.BorrowID) AS TotalBorrowings
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
GROUP BY m.Name
ORDER BY TotalBorrowings ASC;

SELECT MAX(FineAmount) AS HighestFine
FROM Fines;

---Complex Aggregations with HAVING: 
SELECT 
c.Category_Name,
COUNT(bc.BookID) AS BookCount
FROM Categories c
JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_Name
HAVING COUNT(bc.BookID) > 5;

SELECT 
m.Name,
COUNT(b.BorrowID) AS BorrowCount
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
WHERE b.BorrowDate BETWEEN DATEADD(MONTH, -1, GETDATE()) AND GETDATE()
GROUP BY m.Name
HAVING COUNT(b.BorrowID) > 3;

SELECT 
a.Name,
COUNT(ba.BookID) AS BookCount
FROM Authors a
JOIN BookAuthors ba ON a.Author_ID = ba.AuthorID
GROUP BY a.Name
HAVING COUNT(ba.BookID) > 2;

SELECT 
brn.Branch_Name,
SUM(f.FineAmount - f.PaidAmount) AS TotalPending
FROM Branches brn
JOIN Borrowing b ON brn.Branch_ID = b.BranchID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Pending'
GROUP BY brn.Branch_Name
HAVING SUM(f.FineAmount - f.PaidAmount) > 100;

---GROUP BY with Multiple Columns: 
SELECT
brn.Branch_Name,
YEAR(b.BorrowDate) AS [Year],
MONTH(b.BorrowDate) AS [Month],
COUNT(b.BorrowID) AS TotalBorrowings
FROM Borrowing b
JOIN Branches brn ON b.BranchID = brn.Branch_ID
GROUP BY brn.Branch_Name, YEAR(b.BorrowDate), MONTH(b.BorrowDate)
ORDER BY [Year], [Month];

SELECT 
m.Name AS MemberName,
YEAR(f.PaymentDate) AS [Year],
SUM(f.PaidAmount) AS TotalPaid
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Paid'
GROUP BY m.Name, YEAR(f.PaymentDate)
ORDER BY m.Name, [Year];

---Subqueries with Aggregation:
SELECT  
b.Title,  
COUNT(br.BorrowID) AS BorrowCount  
FROM Books b  
JOIN Borrowing br ON b.Book_ID = br.BookID  
GROUP BY b.Title  
HAVING COUNT(br.BorrowID) > (  
SELECT AVG(BorrowCount)  
FROM (  
SELECT COUNT(BorrowID) AS BorrowCount  
FROM Borrowing  
GROUP BY BookID) AS BorrowStats  
);

SELECT
m.Name,
SUM(f.PaidAmount) AS TotalPaid
FROM Members m
JOIN Borrowing b ON m.Member_ID = b.MemberID
JOIN Fines f ON b.BorrowID = f.BorrowID
WHERE f.Status = 'Paid'
GROUP BY m.Name
HAVING SUM(f.PaidAmount) > (
SELECT AVG(TotalPaid) ---Subquery
FROM (
SELECT SUM(PaidAmount) AS TotalPaid
FROM Fines
WHERE Status = 'Paid'
GROUP BY BorrowID) AS FineTotals
);
