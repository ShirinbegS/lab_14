-- 1. Получить все заказы конкретного покупателя
SELECT o.order_id, o.order_date, o.status, o.total
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.name = 'Иван Петров';

-- 2. Получить все товары в конкретном заказе
SELECT p.name, oi.quantity, oi.unit_price, (oi.quantity * oi.unit_price) AS item_total
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
WHERE oi.order_id = 5;

-- 3. Найти самые популярные товары (топ-5)
SELECT p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 5;

-- 4. Обновить количество товара на складе после заказа
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 10;

-- 5. Получить общую выручку за определенный период
SELECT SUM(total) AS revenue
FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-01-31';