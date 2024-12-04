<%-- 
    Document   : index
    Created on : 14 nov 2024, 10:15:59
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
        <title>Iniciar Sesión | ChickenGo</title>
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
            .logo {
                max-width: 100%; /* Asegura que la imagen no se salga del contenedor */
                height: auto; /* Mantiene la proporción de la imagen */
            }
        </style>
    </head>
    
    <body>
        <div class="container mt-5">
            <h1 class="text-center mb-4">
                <img src="img/logo.jpg" alt="Logo de ChickenGo" class="logo img-fluid" style="max-width: 15rem;">
            </h1>
            <p class="text-center" style="color: #c74e1e; font-size: 1.2rem;">Tu lugar para el mejor pollo asado</p>
            <form action="iniciar" method="post" class="w-50 mx-auto border p-4 rounded shadow-sm">
                <c:if test="${not empty sessionScope.error}">
                    <div class="alert alert-danger text-center">
                        ${sessionScope.error}
                    </div>
                    <c:remove var="error" scope="session" />
                </c:if>
                <div class="mb-3">
                    <label for="usuario" class="form-label">Nombre de Usuario</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de usuario" value="${param.usuario}">
                </div>
                <div class="mb-3">
                    <label for="clave" class="form-label">Contraseña</label>
                    <input type="password" id="clave" name="clave" class="form-control">
                </div>
                <button type="submit" class="btn w-100">Iniciar Sesión</button>
            </form>

            <p class="text-center mt-3">¿No tienes una cuenta? <a href="registro.jsp" style="color: #e88a4e;">Registrar</a></p>
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
