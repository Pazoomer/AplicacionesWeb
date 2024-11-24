package modelos;

import clases.Producto;
import controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author t1pas
 */
public class ModeloProducto extends Conexion{

    public List<Producto> getAllProductos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "Call selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id_producto"),
                        rs.getString("nombre"),
                        rs.getString("img_producto"),
                        rs.getDouble("precio"),
                        rs.getInt("stock")));
            }
            System.out.println("Productos obtenidos: " + productos.size());  // Verificar la cantidad de productos

        } catch (Exception e) {
            e.printStackTrace();  // Mostrar detalles del error
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception e) {
                e.printStackTrace();  // Mostrar detalles del error al cerrar recursos
            }
        }
        return productos;
    }

    public Producto getProducto(int id) { 
        Producto producto=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String sql = "Call selectProducto(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            while (rs.next()) {
                producto=new Producto(rs.getInt("id_producto"), rs.getString("nombre"), rs.getString("img_producto"),
                        rs.getDouble("precio"), rs.getInt("stock"));
            }

        } catch (Exception e) {
            
        }finally{
            try{
                if(rs!=null){
                    rs.close();
                }
                if(pst!=null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch(Exception e){
                
            }
        }
        return producto;
    }   
}
