-- Use database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- ========================
-- Drop existing tables (correct order)
-- ========================
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS users;

-- ========================
-- Users table
-- ========================
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  fullname VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(200) NOT NULL,
  phone VARCHAR(20)
);

-- ========================
-- Products table
-- ========================
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0,
  image_url VARCHAR(500)
);

-- ========================
-- Orders table
-- ========================
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) DEFAULT 'PLACED',
  CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ========================
-- Order Items table
-- ========================
CREATE TABLE order_items (
  id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES orders(id)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES products(id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- ========================
-- Insert sample products
-- ========================
INSERT INTO products (name, description, price, stock, image_url) VALUES
('Smartphone X200','Latest Android smartphone with 128GB storage',29999.00,50,'https://platform.theverge.com/wp-content/uploads/sites/2/chorus/uploads/chorus_asset/file/25626687/DSC08433.jpg?quality=90&strip=all&crop=16.675%2C0%2C66.65%2C100&w=2400'),
('Laptop Pro 15','High-performance laptop with 16GB RAM',65999.00,20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFSQygaQ755cPweSwvk4z_eCT3dWLw2a_U6g&s'),
('Wireless Earbuds','Bluetooth earbuds with noise cancellation',4999.00,100,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2EA9QinoA5NVQVELr_stnfRtB4xcQpSyMDQ&s'),
('Smartwatch Series 5','Fitness tracking smartwatch with heart monitor',12999.00,40,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfv8vE1tfnpBUvEOm1ZxHVCV8Y_lm3JHVwDg&s'),
('Gaming Mouse','Ergonomic gaming mouse with RGB lights',1999.00,75,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo8NBp9ojFLmLlPZWIrtm6KJp8qzJSZNP6GA&s'),
('Office Chair','Ergonomic office chair with lumbar support',8999.00,15,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQi7fhAlB2C8KUUdD5OeoYqxn4p1BZEqsc4og&s'),
('Running Shoes','Lightweight running shoes (size 7-11)',2999.00,60,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSu2vssnq_bX_UyvTyuCLAl7eCaGTyGh7QDDw&s'),
('Backpack 30L','Durable waterproof backpack',1499.00,80,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQan5ANlL5dG3yBIPzzHz0h33NOp_CmGIROGg&s'),
('DSLR Camera','Professional DSLR with 24MP lens kit',45999.00,10,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7-Q_cUg-cy8t7U8ptfunDKclby5zilftXQA&s'),
('Bluetooth Speaker','Portable waterproof Bluetooth speaker',3499.00,70,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6WgNTusLMNOURVSdpQEsx9B0o-Ft6OC7I1w&s'),
('Tablet Air 10','Lightweight tablet with 10-inch display and 6GB RAM',22999.00,30,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6DDDhlz87Geha43CNMpOg-RNe9SGy2Vt6Vw&s'),
('Wireless Keyboard','Slim wireless keyboard with backlit keys',2999.00,50,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjrbWjWZIf1DGmg_Xwth6q09q8lXsHRsW0zg&s'),
('4K LED TV','50-inch Ultra HD Smart TV with HDR',42999.00,25,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZd20oTi6EkKgCVUqrVbFmhmgrOYyUy9Qotw&s'),
('Air Conditioner 1.5 Ton','Energy-efficient split AC with inverter technology',32999.00,15,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdW0rGltN7SCqa0FkmFCrGDc26emy9szGmaw&s'),
('Refrigerator 260L','Double-door refrigerator with frost-free technology',27999.00,12,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR88QD7kZV6UnXZZZ-pwYwCZ7sMqs_F2XlHww&s'),
('Microwave Oven','Convection microwave with grill function',9999.00,20,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpfkeY50FjzJ04DATYd5zKguHc2NEF2oXvPQ&s'),
('Washing Machine','Fully automatic front load washing machine',24999.00,10,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNq7ECaLLmCN8ki-XmMS0nV5KA6bP03Vir7g&s'),
('Leather Wallet','Genuine leather men’s wallet with RFID protection',1499.00,100,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAcJ8y83yto6UrBVoQSHDPqeLf_Lxhp2sZUQ&s'),
('Sunglasses','Polarized unisex sunglasses with UV protection',1999.00,60,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_xwJCdc7N3wzYFv0v6tu4Fz2QBwaHEPolMg&s'),
('Smart Lamp','Wi-Fi enabled smart lamp with voice control',2499.00,40,'https://m.media-amazon.com/images/I/61cdve+mxjL._UF1000,1000_QL80_.jpg');

-- =========================
-- Test queries
-- ========================
SELECT * FROM users;
SELECT * FROM products;
SELECT * FROM orders;
