<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ControladorCompraProducto"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }
    String usuario = (String) session.getAttribute("usuario");  // Obtener el usuario de la sesión
    
    controlador.ControladorCompraProducto cp = new controlador.ControladorCompraProducto();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Tienda | ChickenGo</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

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
    <% 
    String mensaje = (String) request.getAttribute("mensaje");
    if (mensaje != null) {
    %>
    <div class="alert alert-success"><%= mensaje %></div>
    <% 
        } 
    %>
    <div class="container-fluid">
        <div class="row">
            <%= cp.getProductos() %>
        </div>
    </div>
    <footer class="bg-dark text-light text-center py-3 mt-4">
        <p class="mb-0">© Derechos Reservados 2024</p>
        <div class="mt-2">
            <a href="https://www.facebook.com/p/Chicken-GO-Pollos-a-la-le%C3%B1a-100063581016962/" target="_blank" class="text-light mx-2">
                <i class="fab fa-facebook fa-lg"></i>
            </a>
            <a href="https://www.instagram.com/chickengo.obregon/" target="_blank" class="text-light mx-2">
                <i class="fab fa-instagram fa-lg"></i>
            </a>
        </div>
    </footer>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</body>
</html>