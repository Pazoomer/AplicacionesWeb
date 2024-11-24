package modelos;

import clases.Producto;
import controlador.Conexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

        } catch (SQLException e) {
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
            } catch (SQLException e) {
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

        } catch (SQLException e) {
            
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
            }catch(SQLException e){
                
            }
        }
        return producto;
    }   
    
    public boolean comprarProducto(int productoId, int cantidad) {
        CallableStatement cstmt = null;
        boolean exito = false;
        try {
            // Llamada al procedimiento almacenado 'comprar_producto'
            String sql = "{CALL comprar_producto(?, ?)}";
            cstmt = getConexion().prepareCall(sql);
            
            // Establecer los parámetros
            cstmt.setInt(1, productoId);  // ID del producto
            cstmt.setInt(2, cantidad);     // Cantidad a comprar
            
            // Ejecutar el procedimiento
            cstmt.execute();
            exito = true;  // Si la ejecución es exitosa, se marca como true
            
        } catch (SQLException e) {
            e.printStackTrace();
            // Si hay un error (por ejemplo, falta de stock), se captura la excepción
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return exito;  // Devuelve true si la compra fue exitosa, false si hubo algún error
    }
}
