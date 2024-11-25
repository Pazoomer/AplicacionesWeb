<%@page import="clases.Producto"%> 
<%@page import="controlador.ControladorProducto"%>
<%@page import="clases.Articulo"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%
    ArrayList<Articulo> articulos = session.getAttribute("carrito") == null ? null : (ArrayList) session.getAttribute("carrito");
    ControladorProducto cp = new ControladorProducto();

    // Variables para mostrar el estado de la compra
    boolean compraRealizada = false;
    boolean errorCompra = false;
    String mensajeCompra = "";

    // Procesar la compra si se envi� el formulario
    if (request.getParameter("confirmarCompra") != null) {
        if (articulos != null && !articulos.isEmpty()) {
            boolean compraExitosa = true;

            for (Articulo articulo : articulos) {
                boolean resultado = cp.comprarProducto(articulo.getIdProducto(), articulo.getCantidad());
                if (!resultado) {
                    compraExitosa = false;
                    errorCompra = true;
                    mensajeCompra = "Hubo un problema al procesar tu compra. Verifica el stock disponible.";
                    break;
                }
            }

            if (compraExitosa) {
                // Vaciar el carrito tras una compra exitosa
                session.setAttribute("carrito", null);
                compraRealizada = true;
                mensajeCompra = "�Compra realizada con �xito!";
            }
        } else {
            errorCompra = true;
            mensajeCompra = "No hay art�culos en tu carrito.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrito | ChickenGo</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
</head>

<body>
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="index.jsp">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>

            <!-- Mensaje de compra -->
            <% if (mensajeCompra != "") { %>
                <div class="alert <%= compraRealizada ? "alert-success" : "alert-danger" %> text-center">
                    <strong><%= mensajeCompra %></strong>
                    <% if (compraRealizada) { %>
                        <a href="shop.jsp" class="btn btn-primary mt-3">Seguir comprando</a>
                    <% } else { %>
                        <a href="cart.jsp" class="btn btn-warning mt-3">Reintentar</a>
                    <% } %>
                </div>
            <% } else if (articulos == null || articulos.isEmpty()) { %>
                <div class="alert alert-warning text-center">
                    <strong>Tu carrito est� vac�o.</strong>
                    <a href="shop.jsp" class="btn btn-primary mt-3">Ir a la tienda</a>
                </div>
            <% } else { %>
                <!-- Mostrar carrito -->
                <div class="table-responsive">
                    <table class="table table-condensed">
                        <thead>
                            <tr>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Precio Unitario</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                double total = 0;
                                for (Articulo articulo : articulos) {
                                    Producto producto = cp.getProducto(articulo.getIdProducto());
                                    double subtotal = producto.getPrecio() * articulo.getCantidad();
                                    total += subtotal;
                            %>
                            <tr>
                                <td><%= producto.getNombre() %></td>
                                <td><%= articulo.getCantidad() %></td>
                                <td>$<%= producto.getPrecio() %></td>
                                <td>$<%= subtotal %></td>
                            </tr>
                            <% } %>
                            <tr>
                                <td colspan="3"><strong>Total</strong></td>
                                <td><strong>$<%= total %></strong></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Bot�n para mostrar el formulario de checkout -->
                <% if (request.getParameter("checkout") == null) { %>
                    <form method="post">
                        <button type="submit" name="checkout" class="btn btn-success">Checkout</button>
                    </form>
                <% } else { %>
                    <!-- Formulario de datos de env�o -->
                    <h3>Datos de env�o</h3>
                    <form method="post" onsubmit="return validarFormulario();">
                        <div class="form-group">
                            <label for="nombre">Nombre Completo:</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" required>
                        </div>
                        <div class="form-group">
                            <label for="direccion">Direcci�n:</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" required>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Tel�fono:</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" required>
                        </div>
                        <div class="form-group">
                            <label for="metodoPago">M�todo de Pago:</label>
                            <select class="form-control" id="metodoPago" name="metodoPago" required>
                                <option value="">Selecciona una opci�n</option>
                                <option value="Tarjeta">Tarjeta</option>
                                <option value="Efectivo">Efectivo</option>
                                <option value="Transferencia">Transferencia</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="detalles">Detalles adicionales:</label>
                            <textarea class="form-control" id="detalles" name="detalles" rows="3"></textarea>
                        </div>
                        <button type="submit" name="confirmarCompra" class="btn btn-primary">Confirmar Compra</button>
                    </form>
                <% } %>
            <% } %>
        </div>
    </section>

    <script>
        function validarFormulario() {
            const nombre = document.getElementById('nombre').value.trim();
            const direccion = document.getElementById('direccion').value.trim();
            const telefono = document.getElementById('telefono').value.trim();
            const metodoPago = document.getElementById('metodoPago').value;

            if (!nombre || !direccion || !telefono || !metodoPago) {
                alert('Por favor, completa todos los campos requeridos.');
                return false;
            }
            return true;
        }
    </script>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
