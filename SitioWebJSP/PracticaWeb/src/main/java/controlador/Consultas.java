package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author t1pas
 */
public class Consultas extends Conexion{

    public Consultas() {}

    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where nombre=? and pass=?";
            
            // Usamos un ResultSet scrollable
            pst = getConexion().prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pst.setString(1, usuario);
            pst.setString(2, clave);
            
            rs = pst.executeQuery();

            // Con un ResultSet scrollable podemos usar rs.absolute(1)
            if (rs.absolute(1)) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public int obtenerIdUsuario(String usuario) {
        int id = -1;
        
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "SELECT id_usuario FROM usuarios WHERE nombre = ?";
            
            // Usamos un ResultSet scrollable
            pst = getConexion().prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            pst.setString(1, usuario);
            
            rs = pst.executeQuery();

            // Con un ResultSet scrollable podemos usar rs.absolute(1)
            if (rs.absolute(1)) {
                id = rs.getInt("id_usuario");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return id;
    }
}
