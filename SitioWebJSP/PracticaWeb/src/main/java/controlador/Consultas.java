package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author t1pas
 */
public class Consultas extends Conexion{

    public Consultas() {}

    public boolean autenticacion(String usuario, String clave) {
        System.out.println(usuario);
        System.out.println(clave);
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where nombre=? and pass=?";
            
            // Usamos un ResultSet scrollable
            pst = getConexion().prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

            pst.setString(1, usuario);
            pst.setString(2, clave);
            
            System.out.println("Consulta es " + consulta);
            rs = pst.executeQuery();

            // Con un ResultSet scrollable podemos usar rs.absolute(1)
            if (rs.absolute(1)) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }
}
