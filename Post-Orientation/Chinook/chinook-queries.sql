-- 1.Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
-- SELECT (FirstName ||" "|| LastName)AS CustomerName, CustomerId, Country 
-- FROM customer 
-- WHERE NOT Country = 'USA'


-- 2. Provide a query only showing the Customers from Brazil.
-- SELECT * FROM customer WHERE Country = 'Brazil'


-- 3. Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
-- SELECT (Customer.FirstName ||" "|| Customer.LastName)AS CustomerName, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.BillingCountry 
-- FROM Customer 
-- INNER JOIN Invoice ON Invoice.CustomerId=Customer.CustomerId 
-- WHERE Country = 'Brazil'


-- 4. Provide a query showing only the Employees who are Sales Agents.
-- SELECT * From Employee WHERE Title='Sales Support Agent'


-- 5. Provide a query showing a unique list of billing countries from the Invoice table.
-- SELECT DISTINCT BillingCountry FROM Invoice


-- 6. Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
-- SELECT (Employee.FirstName ||" "|| Employee.LastName)AS EmployeeName, Invoice.InvoiceId 
-- From Employee 
-- LEFT JOIN Customer 
-- ON Customer.SupportRepId=Employee.EmployeeId 
-- LEFT Join Invoice 
-- On Invoice.CustomerId=Customer.CustomerId


-- 7. Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
-- SELECT Invoice.Total, (Customer.FirstName ||" "|| Customer.LastName)AS CustomerName, Customer.Country, (Employee.FirstName ||" "|| Employee.LastName) AS EmployeeName 
-- FROM Invoice 
-- LEFT Join Customer ON Customer.CustomerId=Invoice.CustomerId 
-- JOIN Employee ON Employee.EmployeeId=Customer.SupportRepId


-- 8. How many Invoices were there in 2009 and 2011? What are the respective total sales for each of those years?
-- SELECT strftime("%Y", Invoice.InvoiceDate)AS Years, 
-- SUM(Invoice.Total) AS Totals, 
-- COUNT (Invoice.InvoiceDate) AS Total_Invoices
-- FROM Invoice 
-- WHERE strftime("%Y", Invoice.InvoiceDate)="2009" 
-- OR strftime("%Y", Invoice.InvoiceDate)="2011"
-- GROUP BY strftime("%Y", Invoice.InvoiceDate)


-- 9. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
-- SELECT COUNT (InvoiceLine.InvoiceId) 
-- AS NumberofItems 
-- FROM InvoiceLine
-- WHERE InvoiceLine.InvoiceId=37


-- 10. Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
-- SELECT InvoiceLine.InvoiceId,
-- COUNT (InvoiceLine.InvoiceId)
-- AS TotalLineItems
-- FROM InvoiceLine
-- GROUP BY InvoiceLine.InvoiceId


-- 11. Provide a query that includes the track name with each invoice line item.
-- SELECT InvoiceLine.InvoiceId, InvoiceLine.InvoiceLineId, InvoiceLine.Quantity, InvoiceLine.TrackId, InvoiceLine.UnitPrice, Track.Name
-- FROM InvoiceLine
-- JOIN Track ON Track.TrackId=InvoiceLine.TrackId


-- 12. Provide a query that includes the purchased track name AND artist name with each invoice line item.
-- SELECT InvoiceLine.InvoiceId, InvoiceLine.InvoiceLineId, InvoiceLine.Quantity, InvoiceLine.TrackId, InvoiceLine.UnitPrice, Track.Name AS TrackName, Artist.Name AS ArtistName
-- FROM InvoiceLine
-- JOIN Track ON Track.TrackId=InvoiceLine.TrackId
-- LEFT JOIN Album ON Album.AlbumId=Track.AlbumId
-- LEFT JOIN Artist ON Artist.ArtistId=Album.ArtistId


-- 13. Provide a query that shows the # of invoices per country. HINT: GROUP BY
-- SELECT BillingCountry, COUNT(InvoiceId)
-- AS TotalInvoices
-- FROM Invoice
-- GROUP BY BillingCountry


-- 14. Provide a query that shows the total number of tracks in each playlist. The Playlist name should be included on the resultant table.
-- SELECT Playlist.Name,
-- COUNT(PlaylistTrack.TrackId)
-- AS TotalTracks
-- FROM PlaylistTrack
-- LEFT JOIN Playlist
-- ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
-- GROUP BY Playlist.PlaylistId


-- 15. Provide a query that shows all the Tracks, but displays no IDs. The resultant table should include the Album name, Media type and Genre.
-- SELECT t.Name "Track Name", a.Title "Album Title", t.Composer, t.Bytes "Size", t.Milliseconds "Length", t.UnitPrice "Price", m.Name "Media Type", g.Name "Genre"
-- FROM Track t
-- JOIN Album a
-- ON a.AlbumId = t.AlbumId
-- JOIN MediaType m
-- ON m.MediaTypeId = t.MediaTypeId
-- JOIN Genre g
-- ON g.GenreId = t.GenreId


-- 16. Provide a query that shows all Invoices but includes the # of invoice line items.
-- SELECT i.*, COUNT(L.InvoiceId)
-- FROM Invoice i
-- JOIN InvoiceLine L
-- ON L.InvoiceId=i.InvoiceId
-- GROUP BY L.InvoiceId


-- 17. Provide a query that shows total sales made by each sales agent.
-- SELECT (e.FirstName ||" "|| e.LastName) AS Employee,
-- ROUND(SUM(i.Total), 2) AS "Total Sales"
-- FROM Employee e
-- JOIN Customer c
-- ON c.SupportRepId=e.EmployeeId
-- JOIN Invoice i
-- ON i.CustomerId=c.CustomerId
-- GROUP BY e.EmployeeId


-- 18. Which sales agent made the most in sales in 2009?
-- SELECT (e.FirstName ||" "|| e.LastName) AS Employee,
-- ROUND(SUM(i.Total), 2) AS "Total Sales",
-- strftime("%Y", i.InvoiceDate)AS "Year"
-- FROM Employee e
-- JOIN Customer c 
-- ON c.SupportRepId=e.EmployeeId
-- JOIN Invoice i
-- ON i.CustomerId=c.CustomerId
-- WHERE strftime("%Y", i.InvoiceDate)="2009"
-- GROUP BY e.EmployeeId
-- ORDER BY ROUND(SUM(i.Total), 2) DESC
-- LIMIT 1


-- 19. Which sales agent made the most in sales in 2010?
-- SELECT (e.FirstName ||" "|| e.LastName) AS Employee,
-- ROUND(SUM(i.Total), 2) AS "Total Sales",
-- strftime("%Y", i.InvoiceDate)AS "Year"
-- FROM Employee e
-- JOIN Customer c 
-- ON c.SupportRepId=e.EmployeeId
-- JOIN Invoice i
-- ON i.CustomerId=c.CustomerId
-- WHERE strftime("%Y", i.InvoiceDate)="2010"
-- GROUP BY e.EmployeeId
-- ORDER BY ROUND(SUM(i.Total), 2) DESC
-- LIMIT 1


-- 20. Which sales agent made the most in sales over all?
-- SELECT (e.FirstName ||" "|| e.LastName) AS Employee,
-- ROUND(SUM(i.Total), 2) AS "Total Sales"
-- FROM Employee e
-- JOIN Customer c 
-- ON c.SupportRepId=e.EmployeeId
-- JOIN Invoice i
-- ON i.CustomerId=c.CustomerId
-- GROUP BY e.EmployeeId
-- ORDER BY ROUND(SUM(i.Total), 2) DESC
-- LIMIT 1


-- 21. Provide a query that shows the # of customers assigned to each sales agent.
-- SELECT (e.FirstName ||" "||e.LastName) AS Employee,
-- COUNT (c.CustomerId) AS "# of Customers"
-- FROM Employee e
-- JOIN Customer c
-- ON c.SupportRepId=e.EmployeeId
-- GROUP BY e.EmployeeId


--22. Provide a query that shows the total sales per country. Which country's customers spent the most?
-- SELECT SUM(i.Total), 
-- i.BillingCountry
-- FROM Invoice i
-- GROUP BY i.BillingCountry
-- ORDER BY SUM(i.Total) DESC

-- 23. Provide a query that shows the most purchased track of 2013.
-- SELECT t.Name AS Song,
-- strftime("%Y", i.InvoiceDate)AS "Year",
-- SUM(L.Quantity) AS Units
-- FROM Track t
-- JOIN InvoiceLine L
-- ON L.TrackId=t.TrackId
-- JOIN Invoice i
-- ON i.InvoiceId=L.InvoiceId
-- WHERE strftime("%Y", i.InvoiceDate)="2013"
-- GROUP BY t.Name
-- ORDER BY SUM(L.Quantity) DESC
-- Limit 1

-- 24. Provide a query that shows the top 5 most purchased tracks over all.
-- SELECT t.Name AS Song,
-- SUM(L.Quantity) AS Units
-- FROM Track t
-- JOIN InvoiceLine L
-- ON L.TrackId=t.TrackId
-- JOIN Invoice i
-- ON i.InvoiceId=L.InvoiceId
-- GROUP BY t.Name
-- ORDER BY SUM(L.Quantity) DESC
-- Limit 5

-- 25. Provide a query that shows the top 3 best selling artists.
-- SELECT a.Name AS Artist,
-- SUM(L.Quantity) AS Units
-- FROM Artist a
-- JOIN Album al
-- ON al.ArtistId=a.ArtistId
-- JOIN Track t
-- ON t.AlbumId=al.AlbumId
-- JOIN InvoiceLine L
-- ON L.TrackId=t.TrackId
-- JOIN Invoice i
-- ON i.InvoiceId=L.InvoiceId
-- GROUP BY a.Name
-- ORDER BY SUM(L.Quantity) DESC
-- Limit 3

-- 26. Provide a query that shows the most purchased Media Type.
-- SELECT m.Name AS Format,
-- SUM(L.Quantity) AS Units
-- FROM MediaType m
-- JOIN Track t
-- ON t.MediaTypeId=m.MediaTypeId
-- JOIN InvoiceLine L
-- ON L.TrackId=t.TrackId
-- JOIN Invoice i
-- ON i.InvoiceId=L.InvoiceId
-- GROUP BY m.Name
-- ORDER BY SUM(L.Quantity) DESC
-- Limit 1

27. Provide a query that shows the number tracks purchased in all invoices that contain more than one genre.

