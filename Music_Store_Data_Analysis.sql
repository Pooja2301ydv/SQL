create database Music_Store_Analysis;		#Creating the database

USE Music_Store_Analysis;		#Using the database

SELECT * FROM album2; 

# Q1. Who is the senior most employee based on job title?
SELECT * FROM employee;		
SELECT first_name, last_name FROM employee ORDER BY levels DESC LIMIT 1;	

# Q2. Which countries have the most Invoice?
SELECT * FROM invoice;
SELECT count(*) as c, billing_country FROM invoice GROUP BY billing_country ORDER BY c DESC;

# Q3. What are top 3 values of total  invoice?
SELECT * FROM invoice ORDER BY total DESC LIMIT 3;

/* Q4. Whic city has the best customers? We would like to throw a promotional Music Festivel in the city
       we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
       Return both city name and sum of all invoice totals. */
SELECT SUM(total) as invoice_total, billing_city FROM invoice GROUP BY billing_city ORDER BY invoice_total DESC LIMIT 1;
       
 /* Q5. Write query to return the email,first name, last name & genre of all Rock Music listeners. 
        Return your list ordered alphabetically by email starting with A. */
SELECT DISTINCT email, first_name, last_name 
FROM customer
JOIN invoice ON customer.customer_id= invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN(
	  SELECT track_id FROM track
      JOIN genre ON track.genre_id = genre.genre_id
      WHERE genre.name LIKE 'Rock'
      )
ORDER BY email;     

/* Q6. Return all the track names that have a song length longer than the average length.
	   Return the name and milliseconds for each track. Order by the song length with the longest songs. */
SELECT name, milliseconds 
FROM track 
WHERE milliseconds>(
	SELECT AVG(milliseconds) 
    FROM track
    ) 
ORDER BY milliseconds DESC;

/* Q7. We want to find out the most popular Genre for each country. We determine the most popular genre as the genre
	   with the highest amount of purchases. Write a query that returns each country along with the top Genre. For
       countries where the maximum number of purchases is shared return all Genres.*/
WITH popular_genre AS(
	SELECT COUNT(invoice_line.quantity) AS purchases, customer.country,genre.name, genre.genre_id,
    ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo
    FROM invoice_line
    JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
    JOIN customer ON customer.customer_id = invoice.customer_id
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN genre ON genre.genre_id = track.genre_id
    GROUP BY 2, 3, 4  
    ORDER BY 2 ASC, 1 DESC
    )
SELECT * FROM popular_genre WHERE RowNo  <= 1;

/* Q8. Write a query that determines the customer that has spent the most on music for each country. Write a query
	   that returns the country along with the top customer and how much they spent. For countries where the top amount
       spent is shared, provide all customers who spent this amount. */
WITH RECURSIVE
		customer_with_country AS (
			SELECT customer.customer_id, first_name, last_name, billing_country, SUM(total) AS total_spending
            FROM invoice
            JOIN customer ON customer.customer_id = invoice.customer_id
            GROUP BY 1, 2, 3, 4
            ORDER BY 2, 3 DESC),
		
        country_max_spending AS (
			SELECT billing_country, MAX(total_spending) AS max_spending
            FROM customer_with_country
            GROUP BY billing_country)
            
SELECT cc.billing_country, cc.total_spending, cc.first_name, cc.last_name, cc.customer_id
FROM customer_with_country cc
JOIN country_maX_spending ms
ON cc.billing_country = ms.billing_country
WHERE cc.total_spending = ms.max_spending
ORDER BY 1;           
