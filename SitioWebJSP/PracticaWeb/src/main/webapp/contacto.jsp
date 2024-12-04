<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    if (session == null || session.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
    }
    String usuario = (String) session.getAttribute("usuario");  // Obtener el usuario de la sesión
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
        <div class="container mt-4">
            <div class="row">
                <!-- Card 1 -->
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28313.082386932096!2d-109.99452346523437!3d27.496167399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c83e400c63348b%3A0x4815d6a89dbcaac6!2sChicken%20GO!5e0!3m2!1ses!2smx!4v1733024834778!5m2!1ses!2sm" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p><strong>Teléfono:</strong> +52 (644) 447 5099</p>
                            <p><strong>Dirección:</strong> Francisco Eusebio Kino 161, Itson, 85134 Cdad. Obregón, Son.</p>
                            <p><strong>Horario:</strong> Lunes a Domingo, 11:00 AM - 5:00 PM</p>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28313.082386932096!2d-109.99452346523437!3d27.496167399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c8161b4606390b%3A0x34b4c46296813df5!2sChicken%20Go!5e0!3m2!1ses!2smx!4v1733025085960!5m2!1ses!2smx" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p><strong>Teléfono:</strong> +52 (644) 407 7322</p>
                            <p><strong>Dirección:</strong> C. Tabasco 198, Cortinas 3 Secc, 85167 Cdad. Obregón, Son.</p>
                            <p><strong>Horario:</strong> Lunes a Domingo, 11:00 AM - 6:00 PM</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!-- Card 3 -->
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28315.882239261817!2d-109.97821563442382!3d27.485279499258034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c83e400c77a0f9%3A0xa2f7e6222325a422!2sChicken%20Go!5e0!3m2!1ses!2smx!4v1733025331872!5m2!1ses!2smx" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p><strong>Teléfono:</strong> (345) 678-9012</p>
                            <p><strong>Dirección:</strong> Calle Gral Plutarco Elías Calles 1704, Benito Juárez, 85060 Cdad. Obregón, Son.</p>
                            <p><strong>Horario:</strong> Lunes a Domingo, 10:00 AM - 8:00 PM</p>
                        </div>
                    </div>
                </div>
                <!-- Card 4 -->
                <div class="col-md-6 mb-4">
                    <div class="card">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28313.082386932096!2d-109.99452346523437!3d27.496167399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c83e400c63348b%3A0x4815d6a89dbcaac6!2sChicken%20GO!5e0!3m2!1ses!2smx!4v1733024834778!5m2!1ses!2sm" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                        <div class="card-body text-center">
                            <p><strong>Teléfono:</strong> +52 644 401 9422</p>
                            <p><strong>Dirección:</strong> C. Tabasco 198, Cortinas 3 Secc, 85167 Cdad. Obregón, Son.</p>
                            <p><strong>Horario:</strong> Lunes a Domingo, 11:00 AM - 5:00 PM</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>   
        <div class="container mt-5">
            <h2 class="text-center text-light">Ponte en contacto</h2>
            <form id="formContacto" class="bg-light p-4 rounded">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" id="nombre" name="nombre" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="email">Correo Electrónico:</label>
                    <input type="email" id="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="asunto">Asunto:</label>
                    <input type="text" id="asunto" name="asunto" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="mensaje">Mensaje:</label>
                    <textarea id="mensaje" name="mensaje" class="form-control" rows="5" required></textarea>
                </div>
                <button type="button" id="enviarBtn" class="btn btn-primary btn-block" style="background: #461806; color: white">Enviar</button>
            </form>
            <div id="mensajeExito" class="alert alert-success text-center mt-3 d-none">
                ¡Tu mensaje ha sido enviado con éxito!
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
        <script>
    document.getElementById("enviarBtn").addEventListener("click", function () {
        const nombre = document.getElementById("nombre").value.trim();
        const email = document.getElementById("email").value.trim();
        const asunto = document.getElementById("asunto").value.trim();
        const mensaje = document.getElementById("mensaje").value.trim();

        // Validar campos
        if (!nombre || !email || !asunto || !mensaje) {
            alert("Por favor, completa todos los campos.");
            return;
        }

        if (!validarEmail(email)) {
            alert("Por favor, ingresa un correo válido.");
            return;
        }

        // Mostrar mensaje de éxito
        document.getElementById("mensajeExito").classList.remove("d-none");

        // Limpiar formulario
        document.getElementById("formContacto").reset();
    });

    // Función para validar formato de correo
    function validarEmail(email) {
        const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return regex.test(email);
    }
        </script>

    </body>
</html>