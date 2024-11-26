USE sistema;

#CALL comprarProductos('2,4', '1,1', 1, @resultado);
SET @productoIDs = '2,3,3'; -- Lista de IDs separados por comas
SET @numProductos = LENGTH(@productoIDs) - LENGTH(REPLACE(@productoIDs, ',', '')) + 1; -- Calcular cantidad de productos
SELECT @numProductos;

SELECT * FROM productos;
SELECT * FROM usuarios;
SELECT * FROM compras;
SELECT * FROM detalle_compra;



