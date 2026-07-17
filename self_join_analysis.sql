SELECT f1.title AS title_1, f2.title AS title_2, f1.length
FROM film AS f1 
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length
ORDER BY title_1