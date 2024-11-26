package modelos;

import clases.Compra;
import clases.DetallesCompra;
import clases.Producto;
import controlador.Conexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author t1pas
 */
//TODO: Hacer un ModeloCompra
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
                        rs.getInt("stock"),
                        rs.getString("descripcion")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); 
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
                        rs.getDouble("precio"), rs.getInt("stock"),rs.getString("descripcion"));
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
            }catch(SQLException e){
                
            }
        }
        return producto;
    }   

    public Object comprarProductos(int[] productosId, int[] cantidades, int usuarioId) {
        CallableStatement cstmt = null;
        boolean exito = false;

        try {
            // Convertir los arreglos a cadenas separadas por comas
            String listaProductos = Arrays.stream(productosId)
                    .mapToObj(String::valueOf)
                    .collect(Collectors.joining(","));
            String listaCantidades = Arrays.stream(cantidades)
                    .mapToObj(String::valueOf)
                    .collect(Collectors.joining(","));

            // Llamada al procedimiento almacenado 'comprarProductos'
            String sql = "{CALL comprarProductos(?, ?, ?, ?)}";
            cstmt = getConexion().prepareCall(sql);

            // Establecer los parámetros de entrada
            cstmt.setString(1, listaProductos); // Lista de IDs de productos separados por comas
            cstmt.setString(2, listaCantidades); // Lista de cantidades correspondientes separados por comas
            cstmt.setInt(3, usuarioId);          // ID del usuario

            // Registrar el parámetro de salida
            cstmt.registerOutParameter(4, java.sql.Types.BOOLEAN);

            // Ejecutar el procedimiento
            cstmt.execute();

            // Leer el valor del parámetro de salida
            exito = cstmt.getBoolean(4);

        } catch (SQLException e) {
            e.printStackTrace(); 
            return e;
        } finally {
            try {
                if (cstmt != null) {
                    cstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return exito; 
    }

    public List<Compra> getAllCompras(int id_usuario){
        ArrayList<Compra> compra = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "Call selectCompras(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id_usuario);
            rs = pst.executeQuery();
            while (rs.next()) {
                compra.add(new Compra(rs.getInt("id_compra"),rs.getDate("fecha_compra"), rs.getString("estado"), rs.getDouble("total")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace(); 
            }
        }
        return compra;
    }
    
    //TODO: Este metodo aun no se usa
    public Compra getCompra(int id_compra){
        Compra compra=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            String sql = "Call selectCompra(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id_compra);
            rs = pst.executeQuery();
            while (rs.next()) {
                compra=new Compra(rs.getDate("fecha"), rs.getString("estado"), rs.getDouble("total"));
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
            }catch(SQLException e){
                
            }
        }
        return compra;
    }
    
    public List<DetallesCompra> getListaDetallesCompra(int idCompra){
        ArrayList<DetallesCompra> detallesCompra = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String sql = "Call selectDetallesCompra(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, idCompra);
            rs = pst.executeQuery();
            while (rs.next()) {
                detallesCompra.add(new DetallesCompra(rs.getInt("id_detalle"),rs.getInt("id_producto"),
                        rs.getInt("cantidad"),
                        rs.getDouble("precio")));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return detallesCompra;
    }

}
