<%-- 
    Document   : registro
    Created on : 14 nov 2024, 18:19:53
    Author     : t1pas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Cuenta | ChickenGo</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #f8f1f1; /* Fondo claro */
            }
            .container {
                background-color: #fff3e0; /* Fondo anaranjado */
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                padding: 2rem;
            }
            h1 {
                color: #c74e1e; /* Color café */
                font-family: 'Arial', sans-serif;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            h1 img {
                width: 12rem; /* Ajusta el tamaño del logo */
                max-width: 100%;
                height: auto;
                margin-bottom: 1rem;
            }
            .form-label, .btn {
                color: #c74e1e; /* Texto color café */
            }
            .btn {
                background-color: #e88a4e; /* Naranja */
                border: none;
                font-weight: bold;
            }
            .btn:hover {
                background-color: #d45523; /* Naranja más oscuro */
            }
            footer {
                background-color: #c74e1e; /* Color café oscuro */
                color: #fff;
            }
            .form-control {
                border-color: #e88a4e; /* Borde naranja */
            }
            .form-control:focus {
                border-color: #c74e1e; /* Borde color café al enfocar */
                box-shadow: 0 0 0 0.2rem rgba(199, 78, 30, 0.25);
            }
            .form-control::placeholder {
                color: #c74e1e; /* Texto de marcador de posición color café */
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-4">
                <img src="img/logo.jpg" alt="Logo de ChickenGo">
            </h1>
            <p class="text-center" style="color: #c74e1e; font-size: 1.2rem;">Bienvenido a ChickenGo. Registra tu cuenta para empezar.</p>
            <form action="nuevousuario" method="post" class="w-50 mx-auto border p-4 rounded shadow-sm">
                <div class="mb-3">
                    <label for="usuario" class="form-label">Nombre de Usuario</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de usuario">
                </div>
                <div class="mb-3">
                    <label for="pass" class="form-label">Contraseña</label>
                    <input type="password" id="pass" name="pass" class="form-control">
                </div>
                <button type="submit" class="btn w-100">Registrar Usuario</button>
            </form>
        </div>
        <footer class="bg-dark text-light text-center py-3 mt-4">
            <p class="mb-0">© Derechos Reservados 2024 - ChickenGo</p>
        </footer>
    </body>
</html>


