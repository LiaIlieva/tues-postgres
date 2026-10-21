
-- Question 1: Show each student's name and amount owed for order 1.
SELECT
    s.name,
    SUM(oi.quantity * oi.unit_price)::NUMERIC(10,2) AS amount_owed
FROM order_items AS oi
JOIN students AS s ON s.id = oi.student_id
WHERE oi.order_id = 1
GROUP BY s.id, s.name
ORDER BY s.name;

-- Question 2: Show the total of every order, sorted by date.
SELECT
    o.id AS order_id,
    o.order_date,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0)::NUMERIC(10,2)
        AS order_total
FROM orders AS o
LEFT JOIN order_items AS oi ON oi.order_id = o.id
GROUP BY o.id, o.order_date
ORDER BY o.order_date, o.id;
