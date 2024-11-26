-- Usar la base de datos
USE sistema;

-- Insertar ocho productos diferentes
INSERT INTO productos (nombre, img_producto, precio, stock, descripcion) VALUES
('Laptop Dell XPS 13', 'https://example.com/images/laptop_dell.jpg', 1499.99, 10, "Soy una descripcion"),
('Smartphone Samsung Galaxy S21', 'https://example.com/images/galaxy_s21.jpg', 799.99, 25, "Soy una descripcion"),
('Auriculares Sony WH-1000XM4', 'https://example.com/images/sony_wh1000xm4.jpg', 349.99, 15, "Soy una descripcion"),
('Smartwatch Apple Watch Series 7', 'https://example.com/images/apple_watch.jpg', 399.99, 20, "Soy una descripcion"),
('Monitor LG UltraGear 27"', 'https://example.com/images/lg_monitor.jpg', 499.99, 12, "Soy una descripcion"),
('Teclado mecánico Logitech G915', 'https://example.com/images/logitech_keyboard.jpg', 249.99, 18, "Soy una descripcion"),
('Silla gamer Razer Iskur', 'https://example.com/images/razer_chair.jpg', 399.99, 8, "Soy una descripcion"),
('Cámara Canon EOS M50', 'https://example.com/images/canon_eos.jpg', 699.99, 5, "Soy una descripcion");

-- Insertar usuarios
INSERT INTO usuarios (nombre, pass) VALUES
('Jorge', '123');
