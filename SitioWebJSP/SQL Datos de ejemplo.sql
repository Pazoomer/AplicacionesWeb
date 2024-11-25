-- Usar la base de datos
USE sistema;

-- Insertar ocho productos diferentes
INSERT INTO productos (nombre, img_producto, precio, stock) VALUES
('Laptop Dell XPS 13', 'https://example.com/images/laptop_dell.jpg', 1499.99, 10),
('Smartphone Samsung Galaxy S21', 'https://example.com/images/galaxy_s21.jpg', 799.99, 25),
('Auriculares Sony WH-1000XM4', 'https://example.com/images/sony_wh1000xm4.jpg', 349.99, 15),
('Smartwatch Apple Watch Series 7', 'https://example.com/images/apple_watch.jpg', 399.99, 20),
('Monitor LG UltraGear 27"', 'https://example.com/images/lg_monitor.jpg', 499.99, 12),
('Teclado mecánico Logitech G915', 'https://example.com/images/logitech_keyboard.jpg', 249.99, 18),
('Silla gamer Razer Iskur', 'https://example.com/images/razer_chair.jpg', 399.99, 8),
('Cámara Canon EOS M50', 'https://example.com/images/canon_eos.jpg', 699.99, 5);

-- Insertar sus articulos correspondientes
INSERT INTO articulos (id_producto, cantidad) VALUES
(1, 100),
(2, 100),
(3, 100),
(4, 100),
(5, 100),
(6, 100),
(7, 100),
(8, 0);

-- Consultar los datos de la tabla
SELECT * FROM productos;