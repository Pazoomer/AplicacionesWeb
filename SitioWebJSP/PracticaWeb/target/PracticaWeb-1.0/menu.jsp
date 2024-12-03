<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
    
    String usuario = (String) session.getAttribute("usuario");  // Obtener el usuario de la sesión
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Inicio | ChickenGo</title>
        <!--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/newcss.css"/>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm navbar-dark">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand" href="menu.jsp">
                    <img src="img/logo.jpg" alt="Logo" style="height: 80px; margin-right: 10px;">
                </a>

                <!-- Toggle Button for Mobile View -->
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Menu Items -->
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="menu.jsp">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="shop.jsp">Productos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">Carrito</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="historial.jsp">Historial de compras</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contacto.jsp">Contacto</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-danger" href="CerrarSesion">Cerrar sesión</a>
                        </li>
                    </ul>

                    <!-- Right-side Items -->
                    <ul class="navbar-nav ms-auto align-items-center">
                        <li class="nav-item">
                            <span class="navbar-text text-light me-5">Bienvenido, Jorge</span>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Administrar cuenta</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="banner">
            <div>
                <h1 class="fade-in">Los mejores pollos de la ciudad</h1>
            </div>
        </div>


        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card product-image-wrapper shadow-sm card-hover">
                        <a href="shop.jsp">
                            <img src="img/antojo1.jpg" class="card-img-top img-fluid" alt="Producto">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title font-weight-bold  promos">Las mejores promociones</h5>
                            <p class="card-text text-muted">Revisa nuestros descuentos exclusivos ordenando desde esta pagina web</p>
                        </div>
                        <div class="card-footer bg-light">

                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card product-image-wrapper shadow-sm card-hover">
                        <a href="shop.jsp">
                            <img src="img/oferta1.jpg" class="card-img-top img-fluid" alt="Producto">
                        </a>
                        <div class="card-body text-center">
                            <h5 class="card-title font-weight-bold promos">Disfruta en familia y amigos</h5>
                            <p class="card-text text-muted">Ordena nuestras paquetes familiares al mejor precio, solo en la página web</p>
                        </div>
                        <div class="card-footer bg-light"></div>
                    </div>
                </div>

                <div class="col-md-4 mb-4">
                    <div class="card product-image-wrapper shadow-sm card-hover">
                        <a href="shop.jsp">

                            <img src="img/ensalada-de-pollo.jpg" class="card-img-top" alt="Producto" height="520px" width="400px">
                        </a>

                        <div class="card-body text-center">
                            <h5 class="card-title font-weight-bold  promos">No olvides los extras</h5>
                            <p class="card-text text-muted">Deliciosas botanas perfectas para acompañar</p>
                        </div>
                        <div class="card-footer bg-light">

                        </div>
                    </div>
                </div>

            </div>
            <div class="text-center mt-4"  >
                <a href="shop.jsp" class="btn btn-lg" style="background: #461806; color: white">
                    Revisa nuestras promociones
                </a>
            </div>

            <div class="text-center mt-5">
                <h1 class="display-4">Visítanos en cualquiera de nuestras sucursales</h1>
            </div>

            <div class="container mt-4">
                <div class="row g-4">

                    <div class="col-md-4 map-container">
                        <div class="card shadow-sm">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28313.082386932096!2d-109.99452346523437!3d27.496167399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c83e400c63348b%3A0x4815d6a89dbcaac6!2sChicken%20GO!5e0!3m2!1ses!2smx!4v1733024834778!5m2!1ses!2sm"  width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="card-body text-center">
                                <p><strong>Teléfono:</strong> +52 (644) 447 5099</p>
                                <p><strong>Dirección:</strong> Francisco Eusebio Kino 161, Itson, 85134 Cdad. Obregón, Son.</p>
                                <p><strong>Horario:</strong> Lunes a Domingo, 11:00 AM - 5:00 PM</p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 map-container">
                        <div class="card shadow-sm">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28315.882239261817!2d-109.97821563442382!3d27.485279499258034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c83e400c77a0f9%3A0xa2f7e6222325a422!2sChicken%20Go!5e0!3m2!1ses!2smx!4v1733025331872!5m2!1ses!2smx"  width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <div class="card-body text-center">
                                <p><strong>Teléfono:</strong> (345) 678-9012</p>
                                <p><strong>Dirección:</strong> Calle Gral Plutarco Elías Calles 1704, Benito Juárez, 85060 Cdad. Obregón, Son.</p>
                                <p><strong>Horario:</strong> Lunes a Domingo, 10:00 AM - 8:00 PM</p> 
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 map-container">
                        <div class="card shadow-sm ">
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d28313.082386932096!2d-109.99452346523437!3d27.496167399999994!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c8161b4606390b%3A0x34b4c46296813df5!2sChicken%20Go!5e0!3m2!1ses!2smx!4v1733025085960!5m2!1ses!2smx"  width="500" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
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
            <div class="text-center mt-4 " >
                <a href="contacto.jsp" class="btn  btn-lg " style="background: #461806; color: white">
                    Nuestras Sucursales
                </a>
            </div>
        </div>
        <footer class="bg-dark text-light text-center py-3 mt-4">
    <p class="mb-0">© Derechos Reservados 2024</p>
</footer>

    </body>
</html>
