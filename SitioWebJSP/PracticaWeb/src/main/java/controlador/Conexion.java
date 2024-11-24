package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author t1pas
 */
public class Conexion {
    private String USERNAME="root";
    private String PASSWORD="1234a";
    private String HOST="localhost";
    private String PORT="3306";
    private String DATABASE="sistema";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?useSSL=false&serverTimezone=UTC";
    private Connection con;

    public Conexion()
    {
        try {
            Class.forName(CLASSNAME);
            con=DriverManager.getConnection(URL,USERNAME,PASSWORD);
            System.err.println("Conexion exitosa");
        }catch(ClassNotFoundException e){
            System.err.println("Error en: "+e);
        }catch(SQLException e){
            System.err.println("Error al conectar: "+e);
        }
    }
    
    public Connection getConexion(){
        return con;
    }
    
    public boolean registrar(String usuario, String clave){
        PreparedStatement pst=null;
        try{
            String consulta="insert into usuarios (nombre,pass) values (?,?)";
            pst=getConexion().prepareStatement(consulta);
            pst.setString(1,usuario);
            pst.setString(2, clave);
            if(pst.executeUpdate()==1){
                return true;
            }
        }catch(Exception e){
            System.out.println("Error en: "+e);
        }finally{
            try{
                if(getConexion()!=null)getConexion().close();
                if(pst!=null) pst.close();
            }catch(Exception e){
                System.out.println("Error en "+e);
            }
        }
        return false;
    }
}
