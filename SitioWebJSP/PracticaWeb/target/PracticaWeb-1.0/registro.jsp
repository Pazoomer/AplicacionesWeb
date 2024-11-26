<%-- 
    Document   : registro
    Created on : 14 nov 2024, 18:19:53
    Author     : t1pas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registrar Cuenta | ChickenGo</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Registrar Usuario</h1>
            <form action="nuevousuario" method="post" class="w-50 mx-auto border p-4 rounded bg-white shadow-sm">
                <div class="mb-3">
                    <label for="usuario" class="form-label">Nombre de Usuario</label>
                    <input type="text" id="usuario" name="usuario" class="form-control" placeholder="Nombre de usuario">
                </div>
                <div class="mb-3">
                    <label for="pass" class="form-label">Contraseña</label>
                    <input type="password" id="pass" name="pass" class="form-control">
                </div>
                <button type="submit" class="btn btn-success w-100">Registrar Usuario</button>
            </form>
        </div>
    </body>
</html>

