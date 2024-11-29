package filtros;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter({"/menu.jsp", "/shop.jsp","/contacto.jsp","/historial.jsp","/cart.jsp"})
public class FiltroAutenticacion implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Configuración inicial del filtro (si es necesario)
    }

    @Override
    public void doFilter(jakarta.servlet.ServletRequest request, jakarta.servlet.ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        // Convertir las solicitudes a HttpServletRequest/HttpServletResponse
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Obtener la sesión actual sin crear una nueva
        HttpSession session = httpRequest.getSession(false);

        // Validar si el usuario está autenticado
        if (session == null || session.getAttribute("usuario") == null) {
            // Redirigir al usuario al inicio de sesión
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/index.jsp");
            return;
        }

        // Continuar con la solicitud si el usuario está autenticado
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // Liberar recursos del filtro (si es necesario)
    }
}
