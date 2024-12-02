<%@page import="clases.Producto"%> 
<%@page import="controlador.ControladorCompraProducto"%>
<%@page import="clases.Articulo"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    ArrayList<Articulo> articulos = session.getAttribute("carrito") == null ? null : (ArrayList) session.getAttribute("carrito");
    controlador.ControladorCompraProducto cp = new controlador.ControladorCompraProducto();

    // Variables para mostrar el estado de la compra
    boolean compraRealizada = false;
    boolean errorCompra = false;
    String mensajeCompra = "";

    // Procesar la compra si se envió el formulario
if (request.getParameter("confirmarCompra") != null) {
    if (articulos != null && !articulos.isEmpty()) {
        // Crear listas de IDs de productos y cantidades
        int[] productosId = new int[articulos.size()];
        int[] cantidades = new int[articulos.size()];

        for (int i = 0; i < articulos.size(); i++) {
            Articulo articulo = articulos.get(i);
            productosId[i] = articulo.getIdProducto();
            cantidades[i] = articulo.getCantidad();
        }
        // Obtener el ID del usuario actual desde la sesión
        Integer usuarioId = (Integer) session.getAttribute("id");
        if (usuarioId == null) {
            // Maneja el caso en el que el usuario no esté autenticado
            throw new IllegalStateException("El usuario no ha iniciado sesión.");
        }
        // Llamar al método para realizar la compra  
        boolean compraExitosa = cp.comprarProductos(productosId, cantidades, usuarioId);
        //mensajeCompra=compraExitosa.toString();
        if (compraExitosa) {
            // Vaciar el carrito tras una compra exitosa
            session.setAttribute("carrito", null);
            compraRealizada = true;
            mensajeCompra = "¡Compra realizada con éxito!";
        } else {
            errorCompra = true;
            mensajeCompra = "Hubo un problema al procesar tu compra. Verifica el stock disponible.";
        }
    } else {
        errorCompra = true;
        mensajeCompra = "No hay artículos en tu carrito.";
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

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
            body {
                background-color: #933e06; 
            }
            .navbar {
                background-color: #3F2419; 
            }
            .navbar-brand {
                color: #ff6700 !important;
                font-weight: bold;
            }
            .nav-link {
                color: #f8f9fa !important; 
            }
            .nav-link:hover {
                color: #ff6700 !important; 
            }
        </style>
    </head>

    <body>
        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="menu.jsp">
                    <img src="img/logo.jpg" alt="" style="height: 80px; margin-right: 10px;">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="menu.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">Carrito</a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="historial.jsp">Historial de compras</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contacto.jsp">Contacto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="CerrarSesion">Cerrar sesión</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li class="active">Shopping Cart</li>
                    </ol>
                </div>

                <!-- Mensaje de compra -->
                <% if (mensajeCompra != "") {%>
                <div class="alert <%= compraRealizada ? "alert-success" : "alert-danger"%> text-center">
                    <strong><%= mensajeCompra%></strong>
                    <% if (compraRealizada) { %>
                    <a href="shop.jsp" class="btn btn-primary mt-3">Seguir comprando</a>
                    <% } else { %>
                    <a href="cart.jsp" class="btn btn-warning mt-3">Reintentar</a>
                    <% } %>
                </div>
<% } else if (articulos == null || articulos.isEmpty()) { %>

<div id="emptyCartModal" class="modal show d-block" tabindex="-1" aria-labelledby="emptyCartModalLabel" aria-hidden="true" style="background-color: rgba(0, 0, 0, 0.5);">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title" id="emptyCartModalLabel">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i>Advertencia
                </h5>
            </div>
            <div class="modal-body text-center">
                <strong>Tu carrito está vacío.</strong>
                <p class="mt-3">Por favor, añade productos para continuar con la compra.</p>
            </div>
            <div class="modal-footer justify-content-center">
                <a href="shop.jsp" class="btn btn-primary">Ir a la tienda</a>
                <button type="button" class="btn btn-secondary" id="closeModalButton">Aceptar</button>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const closeModalButton = document.getElementById('closeModalButton');
        const modal = document.getElementById('emptyCartModal');

        closeModalButton.addEventListener('click', function () {
            modal.classList.remove('show', 'd-block'); 
            modal.style.display = 'none'; 
        });
    });
</script>

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
                                <th>Acción</th>
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
                                <td><%= producto.getNombre()%></td>
                                <td><%= articulo.getCantidad()%></td>
                                <td>$<%= producto.getPrecio()%></td>
                                <td>$<%= subtotal%></td>
                                <td>
                                    <!-- Botón para eliminar el producto -->
                                    <form method="post" action="EliminarCart">
                                        <input type="hidden" name="id_producto" value="<%= articulo.getIdProducto()%>">
                                        <button type="submit" class="btn btn-danger">Eliminar</button>
                                    </form>
                                </td>
                            </tr>
                            <% }%>
                            <tr>
                                <td colspan="3"><strong>Total</strong></td>
                                <td><strong>$<%= total%></strong></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Botón para mostrar el formulario de checkout -->
                <% if (request.getParameter("checkout") == null) { %>
                <form method="post">
                    <button type="submit" name="checkout" class="btn btn-success">Checkout</button>
                </form>
                <% } else { %>
                <!-- Formulario de datos de envío -->
                <h3>Datos de envío</h3>
                <form method="post" onsubmit="return validarFormulario();">
                    <div class="form-group">
                        <label for="nombre">Nombre Completo:</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" class="form-control" id="direccion" name="direccion" required>
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" required>
                    </div>
                    <div class="form-group">
                        <label for="metodoPago">Método de Pago:</label>
                        <select class="form-control" id="metodoPago" name="metodoPago" required>
                            <option value="">Selecciona una opción</option>
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
                <% }%>
            </div>
        </section>

        <script >
            function closeModal() {
                const modal = document.getElementById('emptyCartModal');
                if (modal) {
                    modal.style.display = 'none';
                }
            }

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
        <footer class="bg-dark text-light text-center py-3 mt-4">
    <p class="mb-0">© Derechos Reservados 2024</p>
</footer>

    </body>
</html>
