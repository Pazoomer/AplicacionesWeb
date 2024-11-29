package servlet;

import controlador.Consultas;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author t1pas
 */
public class InicioSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("clave");

        Consultas sql = new Consultas();

        // Validar credenciales del usuario
        if (sql.autenticacion(usuario, clave)) {
            // Obtener el ID del usuario desde la base de datos
            int idUsuario = sql.obtenerIdUsuario(usuario);

            if (idUsuario > 0) { // Asegurarse de que el ID sea válido
                // Crear sesión y asignar atributos
                HttpSession objSession = request.getSession(true);
                objSession.setAttribute("usuario", usuario);
                objSession.setAttribute("id", idUsuario);

                // Redirigir al menú
                response.sendRedirect("menu.jsp");
            } else {
                // Si no se encuentra el ID, redirigir con un error
                response.sendRedirect("index.jsp?error=UsuarioNoEncontrado");
            }

        } else {
            // Credenciales incorrectas, redirigir al login
            response.sendRedirect("index.jsp?error=CredencialesIncorrectas");
        }
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Redirige al método principal
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response); // Redirige las solicitudes GET si es necesario
    }
}
