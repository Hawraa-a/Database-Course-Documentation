---INNER JOIN:
SELECT 
br.BorrowID,
m.Name AS MemberName,
b.Title AS BookTitle,
br.Status
FROM Borrowing br
INNER JOIN Members m ON br.MemberID = m.Member_ID
INNER JOIN Books b ON br.BookID = b.Book_ID;

SELECT 
b.Book_ID,
b.Title,
a.Name AS AuthorName
FROM Books b
INNER JOIN BookAuthors ba ON b.Book_ID = ba.BookID
INNER JOIN Authors a ON ba.AuthorID = a.Author_ID
ORDER BY b.Book_ID;

SELECT 
br.BorrowID,
m.Name AS MemberName,
b.Title AS BookTitle,
br.BorrowDate,
br.DueDate,
br.Status,
brn.Branch_Name,
brn.Address AS BranchAddress
FROM Borrowing br
INNER JOIN Members m ON br.MemberID = m.Member_ID
INNER JOIN Books b ON br.BookID = b.Book_ID
INNER JOIN Branches brn ON br.BranchID = brn.Branch_ID
WHERE br.Status = 'Borrowed' AND br.ReturnDate IS NUll;

---LEFT JOIN:
SELECT 
b.Book_ID,
b.Title,
br.BorrowID,
br.Status AS BorrowStatus
FROM Books b
LEFT JOIN Borrowing br ON b.Book_ID = br.BookID AND br.Status = 'Borrowed'
ORDER BY b.Title;

SELECT 
m.Member_ID,
m.Name AS MemberName,
b.Title,
br.BorrowID,
br.Status
FROM Members m
LEFT JOIN Borrowing br ON m.Member_ID = br.MemberID AND br.Status = 'Borrowed'
LEFT JOIN Books b ON br.BookID = b.Book_ID;

---RIGHT JOIN / FULL OUTER JOIN (if supported):
SELECT 
c.Category_Name,
COUNT(bc.BookID) AS TotalBooks
FROM Categories c
FULL OUTER JOIN BookCategories bc ON c.Category_ID = bc.CategoryID
GROUP BY c.Category_Name;