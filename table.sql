- Создание таблицы покупателей
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Создание таблицы товаров
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0
);

-- Создание таблицы заказов
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Создание таблицы элементов заказа
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Добавление тестовых товаров
INSERT INTO products (name, description, price, stock_quantity) VALUES
('Смартфон X', 'Флагман 2023 года', 799.99, 50),
('Ноутбук Pro', '16 ГБ RAM, 1TB SSD', 1299.00, 30),
('Наушники Elite', 'Беспроводные с шумоподавлением', 199.50, 100);

-- Добавление тестовых покупателей
INSERT INTO customers (name, address, phone, email) VALUES
('Иван Петров', 'Москва, ул. Ленина 1', '+79161234567', 'ivan@example.com'),
('Мария Сидорова', 'Санкт-Петербург, Невский пр. 10', '+78129876543', 'maria@example.com');-
