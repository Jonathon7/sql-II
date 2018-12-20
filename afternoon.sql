
SELECT *
FROM Invoice i
    JOIN InvoiceLine il ON il.invoiceId = i.invoiceId
WHERE il.UnitPrice > 0.99;

SELECT i.InvoiceDate, c.FirstName, c.LastName, i.Total
FROM Invoice i
    JOIN Customer c ON i.CustomerId = c.CustomerId;

SELECT al.Title, ar.Name
FROM Album al
    JOIN Artist ar ON al.ArtistId = ar.ArtistId;

SELECT pt.TrackId
FROM PlaylistTrack pt
    JOIN Playlist p ON p.PlaylistId = pt.PlaylistId
WHERE p.Name = 'Music';

SELECT t.Name
FROM Track t
    JOIN PlaylistTrack pt ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;

SELECT t.name, p.Name
FROM Track t
    JOIN PlaylistTrack pt ON t.TrackId = pt.TrackId
    JOIN Playlist p ON pt.PlaylistId = p.PlaylistId;

SELECT t.Name, a.title
FROM Track t
    JOIN Album a ON t.AlbumId = a.AlbumId
    JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = "Alternative";

SELECT *
FROM Invoice
WHERE InvoiceId IN ( SELECT InvoiceId
FROM InvoiceLine
WHERE UnitPrice > 0.99 );

SELECT *
FROM PlaylistTrack
WHERE PlaylistId IN ( SELECT PlaylistId
FROM Playlist
WHERE Name = "Music" );

SELECT Name
FROM Track
WHERE TrackId IN ( SELECT TrackId
FROM PlaylistTrack
WHERE PlaylistId = 5 );

SELECT *
FROM Track
WHERE GenreId IN ( SELECT GenreId
FROM Genre
WHERE Name = "Comedy" );

SELECT *
FROM Track
WHERE AlbumId IN ( SELECT AlbumId
FROM Album
WHERE Title = "Fireball" );

SELECT *
FROM Track
WHERE AlbumId IN ( 
  SELECT AlbumId
FROM Album
WHERE ArtistId IN ( 
    SELECT ArtistId
FROM Artist
WHERE Name = "Queen" 
  )
);

UPDATE Customer
SET Fax = null
WHERE Fax IS NOT null;

UPDATE Customer
SET Company = "Self"
WHERE Company IS null;

UPDATE Customer 
SET LastName = "Thompson" 
WHERE FirstName = "Julia" AND LastName = "Barnett";

UPDATE Customer
SET SupportRepId = 4
WHERE Email = "luisrojas@yahoo.cl";

UPDATE Track
SET Composer = "The darkness around us"
WHERE GenreId = ( SELECT GenreId
    FROM Genre
    WHERE Name = "Metal" )
    AND Composer IS null;

SELECT Count(*), g.Name
FROM Track t
    JOIN Genre g ON t.GenreId = g.GenreId

SELECT Count(*), g.Name
FROM Track t
    JOIN Genre g ON g.GenreId = t.GenreId
WHERE g.Name = 'Pop' OR g.Name = 'Rock'
GROUP BY g.Name;

SELECT ar.Name, Count(*)
FROM Artist ar
    JOIN Album al ON ar.ArtistId = al.ArtistId
GROUP BY al.ArtistId;

SELECT DISTINCT Composer
FROM Track;

SELECT DISTINCT BillingPostalCode
FROM Invoice;

SELECT DISTINCT Company
FROM Customer;

DELETE 
FROM practice_delete

DELETE 
FROM practice_delete 
WHERE Type = "silver";

DELETE 
FROM practice_delete 
WHERE Value = 150;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name varchar(20),
    email varchar(20)
);

CREATE TABLE product
(
    id SERIAL PRIMARY KEY,
    name varchar(20),
    price integer
);

CREATE TABLE orders
(
    id SERIAL PRIMARY KEY,
    ref integer
);

INSERT INTO users
    (id, name, email)
VALUES
    ('john', 'john@gmail.com'),
    ('jay', 'jay@gmail.com'),
    ('jordan', 'jordan@gmail.com')

INSERT INTO product
    (id, name, price)
VALUES
    ('socks', 10),
    ('pants', 20),
    ('shirt', 30)

INSERT INTO orders
    (id, name, email)
VALUES
    (3),
    (4),
    (5)