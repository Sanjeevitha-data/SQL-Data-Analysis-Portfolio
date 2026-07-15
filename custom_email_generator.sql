SELECT customer_id, first_name || ' ' || last_name AS full_name,
LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com' AS custom_email
FROM customer
ORDER BY full_name ASC;