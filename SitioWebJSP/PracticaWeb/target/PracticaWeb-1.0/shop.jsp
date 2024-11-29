<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controlador.ControladorProducto"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }
    String usuario = (String) session.getAttribute("usuario");  // Obtener el usuario de la sesión
    
    controlador.ControladorProducto cp = new controlador.ControladorProducto();
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
</head>

<body>
    <nav class="navbar navbar-expand-sm bg-primary navbar-dark">
        <a class="navbar-brand" href="menu.jsp">Logo</a>
        <ul class="navbar-nav">
            <li class="nav-item active">
                    <a class="nav-link" href="menu.jsp">Inicio</a>
                </li>
            <li class="nav-item active">
                <a class="nav-link" href="shop.jsp">Productos</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="cart.jsp">Carrito</a> 
            </li>
            <li class="nav-item active">
                    <a class="nav-link" href="historial.jsp">Historial de compras</a> 
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="contacto.jsp">Contacto</a> 
                </li>
            <li class="nav-item">
                <a class="nav-link" href="CerrarSesion">Cerrar sesión</a> 
            </li>
        </ul>
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
</body>
</html>