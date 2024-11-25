-- Usar la base de datos
USE sistema;

DELIMITER $$

CREATE PROCEDURE comprar_producto(IN productoID INT, IN cantidad_comprar INT)
BEGIN
    DECLARE stock_actual INT;
    
    -- Obtener el stock actual del producto
    SELECT stock INTO stock_actual
    FROM productos
    WHERE id_producto = productoID;
    
    -- Verificar si hay suficiente stock
    IF stock_actual >= cantidad_comprar THEN
        -- Actualizar la cantidad del producto en el stock (restar la cantidad comprada)
        UPDATE productos
        SET stock = stock - cantidad_comprar
        WHERE id_producto = productoID;
        
        -- Confirmar que la compra fue exitosa
        SELECT 'Compra realizada con éxito' AS mensaje;
    ELSE
        -- Si no hay suficiente stock, devolver un mensaje de error
        SELECT 'No hay suficiente stock disponible' AS mensaje;
    END IF;
    
END $$

DELIMITER $$

CREATE PROCEDURE selectProducto(IN productoID INT)
BEGIN
    SELECT id_producto, nombre, img_producto, precio, stock
    FROM productos
    WHERE id_producto = productoID;
END $$

DELIMITER ;

-- Cambiar el delimitador para evitar conflictos con el punto y coma
DELIMITER //

-- Crear el procedimiento almacenado para obtener todos los productos
CREATE PROCEDURE selectProductos()
BEGIN
    SELECT id_producto, nombre, img_producto, precio, stock
    FROM productos;
END //

-- Restaurar el delimitador a ;
DELIMITER ;