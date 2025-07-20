-- Q1: Which countries have the most Invoices?
SELECT Top 1 BillingCountry, COUNT(*) AS Invoices
FROM Invoice
GROUP BY BillingCountry
ORDER BY Invoices DESC;

-- Q2: Which city has the best customers?
SELECT TOP 1 BillingCity, SUM(Total) AS TotalSpent
FROM Invoice
GROUP BY BillingCity
ORDER BY TotalSpent DESC;

-- Q3: Who is the best customer?
SELECT Top 1 CustomerId, SUM(Total) AS TotalSpent
FROM Invoice
GROUP BY CustomerId
ORDER BY TotalSpent DESC;
-- Q4: Another solution with displaying the name of the best customer
SELECT TOP 1
    c.CustomerId,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    SUM(i.Total) AS TotalSpent
FROM Customer c
JOIN Invoice i 
ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

--Q5: Make a query to return the email, first name, last name, and Genre of all Rock Music listeners and order them alphabetically by email address starting with A

SELECT C.FirstName,
C.LastName,
C.Email,
COUNT(G.Name) AS NO_ROCK
FROM Customer C
JOIN Invoice I
ON C.CustomerId=I.CustomerId
JOIN InvoiceLine L
ON I.InvoiceId= L.InvoiceId
JOIN Track T
ON L.TrackId=T.TrackId
JOIN Genre G
ON T.GenreId= G.GenreId
WHERE G.Name = 'Rock'
GROUP BY FirstName,C.LastName,C.Email
ORDER BY C.Email;

--Q6: Who is writing the rock music?
SELECT DISTINCT R.Name,G.Name
FROM Genre G
JOIN Track T
ON T.GenreId=G.GenreId
JOIN Album A
ON A.AlbumId=T.AlbumId
JOIN Artist R
ON R.ArtistId= A.ArtistId
WHERE G.Name = 'Rock';


--Q7: Find which artist has earned the most according to the InvoiceLines?

SELECT R.Name,SUM(L.Quantity*L.UnitPrice)AS SALES
FROM Artist R
JOIN Album A
ON A.ArtistId=R.ArtistId
JOIN Track T
ON A.AlbumId=T.AlbumId
JOIN InvoiceLine L
ON L.TrackId= T.TrackId
GROUP BY R.Name;






