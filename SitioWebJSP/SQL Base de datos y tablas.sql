-- Crear la base de datos 'sistema'
#CREATE DATABASE sistema;

-- Usar la base de datos 'sistema'
USE sistema;

-- Crear la tabla 'usuarios'
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,  -- ID único de usuario
    nombre VARCHAR(255) NOT NULL,               -- Nombre del usuario
    pass VARCHAR(255) NOT NULL                  -- Contraseña del usuario
);

-- Crear la tabla productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    img_producto VARCHAR(255),
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla de compras
CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,               -- Relación con el usuario que hizo la compra
    fecha_compra DATETIME DEFAULT CURRENT_TIMESTAMP,  -- Fecha de la compra
    total DECIMAL(10, 2) NOT NULL,         -- Total de la compra
    estado VARCHAR(50) DEFAULT 'pendiente', -- Estado de la compra (pendiente, procesada, entregada, etc.)
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) -- Relación con la tabla de usuarios
);

-- Tabla de detalles de compra (productos comprados)
CREATE TABLE detalle_compra (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_compra INT NOT NULL,                -- Relación con la compra
    id_producto INT NOT NULL,              -- Relación con el producto comprado
    cantidad INT NOT NULL,                 -- Cantidad del producto comprado
    precio DECIMAL(10, 2) NOT NULL,        -- Precio del producto en el momento de la compra
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra),  -- Relación con la tabla de compras
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)  -- Relación con la tabla de productos
);
