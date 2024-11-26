-- Usar la base de datos
USE sistema;

-- Cambiar el delimitador para evitar conflictos con el punto y coma
DELIMITER $$

CREATE PROCEDURE comprarProductos(
    IN productoIDs TEXT,         -- Lista de IDs de productos separados por comas
    IN cantidades TEXT,          -- Lista de cantidades correspondientes separados por comas
    IN idUsuario INT,            -- ID del usuario que realiza la compra
    OUT compraExitosa BOOLEAN    -- Resultado de la operación
)
BEGIN
    DECLARE listaProductos TEXT;
    DECLARE listaCantidades TEXT;
    DECLARE total DECIMAL(10, 2) DEFAULT 0;
    DECLARE idx INT DEFAULT 0;
    DECLARE productoID INT;
    DECLARE cantidad INT;
    DECLARE stock_actual INT;
    DECLARE continuar BOOLEAN DEFAULT TRUE;
    DECLARE idCompra INT;

    -- Convertir las listas de cadenas a formato texto para iterar
    SET listaProductos = productoIDs; -- productoIDs es una cadena separada por comas
    SET listaCantidades = cantidades; -- cantidades también es una cadena separada por comas

    -- Iniciar una transacción para asegurar atomicidad
    START TRANSACTION;

    -- Validar stock para todos los productos
    WHILE idx < LENGTH(listaProductos) AND continuar DO
        -- Extraer el productoID y cantidad correspondientes
        SET productoID = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(listaProductos, ',', idx + 1), ',', -1) AS UNSIGNED);
        SET cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(listaCantidades, ',', idx + 1), ',', -1) AS UNSIGNED);

        -- Obtener el stock actual del producto
        SELECT stock INTO stock_actual
        FROM productos
        WHERE id_producto = productoID;

        -- Verificar si hay suficiente stock
        IF stock_actual < cantidad THEN
            SET continuar = FALSE; -- No hay suficiente stock, detener las validaciones
        ELSE
            -- Calcular el total
            SELECT precio INTO total
            FROM productos
            WHERE id_producto = productoID;
            SET total = total + (cantidad * total);
        END IF;

        SET idx = idx + 1;
    END WHILE;

    -- Si no hay suficiente stock, revertir la transacción y devolver FALSE
    IF continuar = FALSE THEN
        ROLLBACK;
        SET compraExitosa = FALSE;
    ELSE
        -- Insertar la compra en la tabla compras
        INSERT INTO compras (id_usuario, total, estado)
        VALUES (idUsuario, total, 'pendiente');

        -- Obtener el ID de la compra recién insertada
        SET idCompra = LAST_INSERT_ID();

        -- Insertar los detalles de la compra y actualizar el stock
        SET idx = 0;
        WHILE idx < LENGTH(listaProductos) DO
            -- Extraer el productoID y cantidad correspondientes
            SET productoID = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(listaProductos, ',', idx + 1), ',', -1) AS UNSIGNED);
            SET cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(listaCantidades, ',', idx + 1), ',', -1) AS UNSIGNED);

            -- Insertar en detalle_compra
            INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio)
            SELECT idCompra, id_producto, cantidad, precio
            FROM productos
            WHERE id_producto = productoID;

            -- Actualizar el stock del producto
            UPDATE productos
            SET stock = stock - cantidad
            WHERE id_producto = productoID;

            SET idx = idx + 1;
        END WHILE;

        -- Confirmar la transacción y devolver TRUE
        COMMIT;
        SET compraExitosa = TRUE;
    END IF;
END $$

-- Crear el procedimiento para obtener un producto específico
CREATE PROCEDURE selectProducto(IN productoID INT)
BEGIN
    SELECT id_producto, nombre, img_producto, precio, stock, descripcion
    FROM productos
    WHERE id_producto = productoID;
END $$

-- Crear el procedimiento para obtener todos los productos
CREATE PROCEDURE selectProductos()
BEGIN
    SELECT id_producto, nombre, img_producto, precio, stock, descripcion
    FROM productos;
END $$

-- Restaurar el delimitador a ;
DELIMITER ;