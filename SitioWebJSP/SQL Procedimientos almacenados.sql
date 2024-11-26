-- Usar la base de datos
USE sistema;

-- Cambiar el delimitador para evitar conflictos con el punto y coma
DELIMITER $$

DELIMITER $$

CREATE PROCEDURE comprarProductos(
    IN productoIDs TEXT,         -- Lista de IDs de productos separados por comas
    IN cantidades TEXT,          -- Lista de cantidades correspondientes separados por comas
    IN idUsuario INT,            -- ID del usuario que realiza la compra
    OUT compraExitosa BOOLEAN    -- Resultado de la operación
)
BEGIN
    DECLARE idx INT DEFAULT 1;           -- Índice para iterar
    DECLARE numProductos INT;            -- Número de productos en la lista
    DECLARE productoID INT;              -- Producto actual
    DECLARE cantidad INT;                -- Cantidad actual
    DECLARE stock_actual INT;            -- Stock actual del producto
    DECLARE precio DECIMAL(10, 2);       -- Precio unitario del producto
    DECLARE subtotal DECIMAL(10, 2);     -- Subtotal por producto
    DECLARE total DECIMAL(10, 2) DEFAULT 0; -- Total acumulado
    DECLARE idCompra INT;                -- ID de la compra
    DECLARE continuar BOOLEAN DEFAULT TRUE; -- Control de flujo para stock
    DECLARE total DECIMAL(10, 2) DEFAULT -1;

    -- Iniciar una transacción
    START TRANSACTION;

    -- Contar el número de elementos en la lista (asumiendo listas bien formateadas)
    SET numProductos = LENGTH(productoIDs) - LENGTH(REPLACE(productoIDs, ',', '')) + 1;

    WHILE idx <= numProductos AND continuar DO
        -- Extraer el productoID y cantidad para el índice actual
        SET productoID = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(productoIDs, ',', idx), ',', -1) AS UNSIGNED);
        SET cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(cantidades, ',', idx), ',', -1) AS UNSIGNED);

        -- Obtener el stock actual y el precio del producto
        SELECT stock, precio INTO stock_actual, precio
        FROM productos
        WHERE id_producto = productoID;

        -- Verificar si hay suficiente stock
        IF stock_actual < cantidad THEN
            SET continuar = FALSE; -- No hay suficiente stock
        ELSE
            -- Calcular subtotal y sumar al total
            SET subtotal = cantidad * precio;
            SET total = total + subtotal;
        END IF;

        SET idx = idx + 1;
    END WHILE;

    -- Si no hay suficiente stock, revertir la transacción y devolver FALSE
    IF continuar = FALSE THEN
        ROLLBACK;
        SET compraExitosa = FALSE;
    ELSE
        -- Insertar la compra en la tabla `compras`
        INSERT INTO compras (id_usuario, total, estado)
        VALUES (idUsuario, total, 'pendiente');

        -- Obtener el ID de la compra recién creada
        SET idCompra = LAST_INSERT_ID();

        -- Reiniciar el índice para iterar de nuevo
        SET idx = 1;

        -- Insertar en `detalle_compra` y actualizar stock
        WHILE idx <= numProductos DO
            -- Extraer el productoID y cantidad
            SET productoID = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(productoIDs, ',', idx), ',', -1) AS UNSIGNED);
            SET cantidad = CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(cantidades, ',', idx), ',', -1) AS UNSIGNED);

            -- Obtener el precio del producto
            SELECT precio INTO precio
            FROM productos
            WHERE id_producto = productoID;

            -- Insertar en `detalle_compra`
            INSERT INTO detalle_compra (id_compra, id_producto, cantidad, precio)
            VALUES (idCompra, productoID, cantidad, precio);

            -- Actualizar el stock del producto
            UPDATE productos
            SET stock = stock - cantidad
            WHERE id_producto = productoID;

            SET idx = idx + 1;
        END WHILE;

        -- Confirmar la transacción
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

CREATE PROCEDURE selectCompras(
    IN p_id_usuario INT
)
BEGIN
    SELECT id_compra, fecha_compra, estado, total
    FROM compras
    WHERE id_usuario = p_id_usuario
    ORDER BY fecha_compra DESC;
END $$

CREATE PROCEDURE selectDetallesCompra(
    IN p_id_compra INT
)
BEGIN
    SELECT id_detalle, id_producto, cantidad, precio
    FROM detalle_compra
    WHERE id_compra = p_id_compra;
END $$

-- Restaurar el delimitador a ;
DELIMITER ;