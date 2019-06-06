
--PRACT JOINS
-- 1
SELECT unit_price FROM invoice_line WHERE unit_price > 0.99

--2
SELECT invoice_date, customer.first_name, customer.last_name FROM invoice
INNER JOIN customer 
ON invoice.customer_id = customer.customer_id

--3
SELECT c.first_name, c.last_name, e.first_name, e.last_name FROM customer AS c
JOIN employee AS e
ON c.support_rep_id = e.employee_id

--4
SELECT al.title, ar.name FROM ALBUM AS al
JOIN artist AS ar
ON al.artist_id = ar.artis_id

--5
SELECT pl.playlist_track_id, tr.track_id FROM playlist_track AS pl
JOIN track AS tr
ON pl.track_id = tr.track_id WHERE tr.name = 'Music'

--6
SELECT tr.name FROM track AS tr
JOIN playlist_track as pl
ON tr.track_id = pl.track_id WHERE pl.playlist_id = 5

--7
SELECT tr.name FROM track AS tr
JOIN playlist_track AS pt ON tr.track_id = pt.track_id
JOIN playlist AS p ON pt.playlist_id = p.playlist_id

--8
SELECT tr.name FROM track AS tr
JOIN album AS a ON tr.album_id = a.album_id
JOIN genre AS g on tr.genre_id = g.genre_id WHERE g.name = 'Alternative & Punk'


-- NESTED QUERIES
-- 1
SELECT * FROM invoice WHERE invoice_id IN (SELECT invoice_id FROM invoice_id WHERE unit_price > 0.99);

-- 2
SELECT * FROM playlist_track
WHERE playlist_id IN (SELECT playlist_id FROM playlist WHERE name = 'Music')

--3
SELECT name FROM track
WHERE track_id IN (SELECT track_id FROM playlist_track WHERE playlist_id = 5)

--4
SELECT * FROM track
WHERE genre_id IN (SELECT genre_id FROM genre WHERE name = 'Comedy')

--5
SELECT * FROM track
WHERE album_id IN (SELECT album_id FROM album WHERE title = 'Fireball')

--6
SELECT * FROM track
WHERE album_id IN (
    SELECT album_id FROM album WHERE artist_id IN (
        SELECT artist_id FROM artist WHERE name = 'Queen'
    )
)

------- UPDATING ROWS
--1
UPDATE customer
SET fax = null

--2
UPDATE customer 
SET company = 'Self'
WHERE company = null

--3
UPDATE customer
SET last_name = 'Thompson'
WHERE first_name = 'Julia' AND last_name = ' Barnett';

--4
UPDATE customer
SET support_rep_id = 4
WHERE email = 'luisrojaas@yahoo.cl'

--5
UPDATE track
SET composer = 'The darkness around us'
WHERE genre_id = (SELECT genre_id FROM genre WHERE name = 'Metal')
AND composer IS null;

