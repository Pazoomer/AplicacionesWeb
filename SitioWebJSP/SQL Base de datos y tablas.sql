-- Crear la base de datos 'sistema'
CREATE DATABASE sistema;

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
    stock INT NOT NULL
);

-- Crear la tabla articulos
CREATE TABLE articulos (
    id_articulo INT AUTO_INCREMENT PRIMARY KEY,  -- Identificador único del artículo
    id_producto INT NOT NULL,                    -- Referencia al producto
    cantidad INT NOT NULL,                       -- Cantidad del producto en el carrito
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)  -- Relación con la tabla productos
);