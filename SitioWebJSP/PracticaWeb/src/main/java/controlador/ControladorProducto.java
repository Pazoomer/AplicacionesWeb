package controlador;

import clases.Compra;
import clases.DetallesCompra;
import clases.Producto;
import java.util.List;
import modelos.ModeloProducto;

public class ControladorProducto {
    
    public String getProductos(){
        
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getAllProductos()) {
            htmlcode += "<div class=\"col-sm-4\">\n"
                    + "							<div class=\"product-image-wrapper\">\n"
                    + "								<div class=\"single-products\">\n"
                    + "									<div class=\"productinfo text-center\">\n"
                    + "										<img src=\"" + producto.getImg() + "\" alt=\"\" />\n"
                    + "										<h2>$" + producto.getPrecio() + "</h2>\n"
                    + "										<p>" + producto.getNombre() + "</p>\n"
                    + "                                                                         <p>" + producto.getDescripcion() + "</p>\n"
                    + "									</div>\n"
                    + "								</div>\n"
                    + "								<div class=\"choose\">\n"
                    + "									<ul class=\"nav nav-pills nav-justified\">\n"   
                    + "										<li><a href=\"AddCart?cantidad=1&idproducto=" + producto.getId() + "\"><i class=\"fa fa-plus-square\"></i>Añadir al carrito</a></li>"
                    + "									</ul>\n"
                    + "								</div>\n"
                    + "							</div>\n"
                    + "						</div>";
        }
        return htmlcode;    
    }
    
    
    public Producto getProducto(int id){
        return new ModeloProducto().getProducto(id);
    }
    
    public boolean comprarProductos(int[] productosId, int[] cantidades, int usuarioId){
        return new ModeloProducto().comprarProductos(productosId, cantidades,usuarioId);
    }
    
    public Compra getCompra(int id){
        return new ModeloProducto().getCompra(id);
    }
    public List<DetallesCompra> getListaDetallesCompra(int idCompra){
        return new ModeloProducto().getListaDetallesCompra(idCompra);
    }
}
