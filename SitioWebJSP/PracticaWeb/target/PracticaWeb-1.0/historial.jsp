<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ControladorCompraProducto" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }
    String usuario = (String) session.getAttribute("usuario");  // Obtener el usuario de la sesión
    
    Integer usuarioId = (Integer) session.getAttribute("id");
    if (usuarioId == null) {
        response.sendRedirect("index.jsp");
    }
    controlador.ControladorCompraProducto cp = new controlador.ControladorCompraProducto();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio | ChickenGo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
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
        <div class="container-fluid">
            <div class="row">
                <%= cp.getCompras(usuarioId) %>
            </div>
        </div>
        <script>
function mostrarDetalles(idCompra) {
    const detallesDiv = document.getElementById('detalles-' + idCompra);

    if (detallesDiv.style.display === 'none') {
        // Hacer una solicitud AJAX para obtener los detalles
        fetch('detalles?accion=detalles&idCompra=' + idCompra)
            .then(response => response.text())
            .then(data => {
                detallesDiv.innerHTML = data;
                detallesDiv.style.display = 'block'; // Mostrar los detalles
            })
            .catch(error => {
                console.error('Error al cargar los detalles:', error);
            });
    } else {
        detallesDiv.style.display = 'none'; // Ocultar los detalles
    }
}
        </script>
        <footer class="bg-dark text-light text-center py-3 mt-4">
    <p class="mb-0">© Derechos Reservados 2024</p>
</footer>

    </body>
</html>


