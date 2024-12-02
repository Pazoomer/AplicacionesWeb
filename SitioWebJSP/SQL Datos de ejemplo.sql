-- Usar la base de datos
USE sistema;

-- Insertar ocho productos diferentes
INSERT INTO productos (nombre, img_producto, precio, stock, descripcion) VALUES
('Orden de pollo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSh7rbfkhA10H3F7u7F76HeE7l6wtFyATSODg&s', 170.00, 100, "El clasico pollo asado y jugoso"),
('Papas asadas', 'https://www.gourmet.cl/wp-content/uploads/2014/09/Papas-Asadas.jpg', 60.00, 30, "Las más tiernas papas asadas"),
('Cebollas asadas', 'https://okdiario.com/img/2018/10/03/cebollas-asadas.jpg', 90.00, 40, "Cebollas en su jugo con limon"),
('Sopa fria', 'https://img-global.cpcdn.com/recipes/d2aa646925579bfb/1200x630cq70/photo.jpg', 50.00, 15, "Combinación de crema, jamon y la salsa de la casa"),
('Coca-Cola sin azucar', 'https://coca-colafemsa.com/wp-content/uploads/2020/02/8-5.png', 30.00, 250, "Coca-Cola sin azucar 600ml"),
('Sprite', 'https://lacriaturacreativa.com/wp-content/uploads/2022/05/sprite-nueva-imagen08.jpg', 30.00, 250, "Sprite 600ml"),
('Fanta fresa', 'https://i5.walmartimages.com.mx/gr/images/product-images/img_large/00750105530138L.jpg', 30.00, 250, "La mejor Fanta 600ml"),
('Salsa roja', 'https://carnemax.mx/wp-content/uploads/2021/05/sala-roja.jpg', 20.00, 6, "La original ChickenGo");

-- Insertar usuarios
INSERT INTO usuarios (nombre, pass) VALUES
('Jorge', '123'),
('Chuy', 'chuy'),
('Admin', 'root');
