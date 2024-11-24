<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Invalidar la sesión si está activa
    if (session != null) {
        session.invalidate();  // Elimina la sesión
    }

    // Evitar caché solo en esta página de logout y páginas protegidas
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
    response.setHeader("Pragma", "no-cache"); 
    response.setDateHeader("Expires", 0);

    // Redirigir al index (página de inicio)
    response.sendRedirect("index.jsp");
%>
