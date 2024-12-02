package controlador;

import clases.Compra;
import clases.DetallesCompra;
import clases.Producto;
import java.util.List;
import modelos.ModeloProducto;

public class ControladorCompraProducto {

    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getAllProductos()) {
            htmlcode += "<div class=\"col-lg-4 col-md-6 mb-4\">\n"
                    + "    <div class=\"card h-100\">\n"
                    + "        <img src=\"" + producto.getImg() + "\" class=\"card-img-top\" alt=\"" + producto.getNombre() + "\">\n"
                    + "        <div class=\"card-body text-center\">\n"
                    + "            <h5 class=\"card-title\">" + producto.getNombre() + "</h5>\n"
                    + "            <p class=\"card-text text-muted\">" + producto.getDescripcion() + "</p>\n"
                    + "            <h4 class=\"text-danger\">$" + producto.getPrecio() + "</h4>\n"
                    + "        </div>\n"
                    + "        <div class=\"card-footer text-center\">\n"
                    + "            <a href=\"AddCart?cantidad=1&idproducto=" + producto.getId() + "\" class=\"btn btn-primary\">\n"
                    + "                <i class=\"fa fa-shopping-cart\"></i> Añadir al carrito\n"
                    + "            </a>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</div>";
        }
        return htmlcode;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }

    public boolean comprarProductos(int[] productosId, int[] cantidades, int usuarioId) {
        return new ModeloProducto().comprarProductos(productosId, cantidades, usuarioId);
    }

    public String getCompras(Integer id_usuario) {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";

        List<Compra> compras = mp.getAllCompras(id_usuario);

        if (compras.isEmpty()) {
            htmlcode = "<div class=\"alert alert-info\" role=\"alert\">"
                    + "No tienes compras registradas."
                    + "</div>";
        } else {
            for (Compra compra : compras) {
                htmlcode += "<div class=\"col-sm-4\">\n"
                        + "							<div class=\"product-image-wrapper\">\n"
                        + "								<div class=\"single-products\">\n"
                        + "									<div class=\"productinfo text-center\">\n"
                        + "										<h2>" + compra.getEstado() + "</h2>\n"
                        + "										<p>$" + compra.getTotal() + "</p>\n"
                        + "                                                                         <button onclick=\"mostrarDetalles(" + compra.getIdCompra() + ")\">Ver detalles</button>\n"
                        + "                                                               </div>\n"
                        + "                                                                </div>\n"
                        + "                                                                </div>\n"
                        + "                                                                 <div id=\"detalles-" + compra.getIdCompra() + "\" style=\"display:none; margin-top: 10px;\">\n"
                        + "                                                                 <!-- Aquí se cargarán los detalles dinámicamente -->\n"
                        + "                                                              </div>\n"
                        + "                                                              </div>";
            }
        }
        return htmlcode;
    }

    public Compra getCompra(int id) {
        return new ModeloProducto().getCompra(id);
    }

    public List<DetallesCompra> getListaDetallesCompra(int idCompra) {
        return new ModeloProducto().getListaDetallesCompra(idCompra);
    }

    public String getDetalles(Integer id_compra) {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        String imagen = "";
        Producto producto;
        List<DetallesCompra> detalles = mp.getListaDetallesCompra(id_compra);

        for (DetallesCompra detalle : detalles) {
            producto = getProducto(detalle.getIdProducto());
            if (producto != null) {
                imagen = getProducto(detalle.getIdProducto()).getImg();
            }
            htmlcode += "<div class=\"col-sm-4\">\n"
                    + "							<div class=\"product-image-wrapper\">\n"
                    + "								<div class=\"single-products\">\n"
                    + "									<div class=\"productinfo text-center\">\n"
                    + "										<img src=\"" + imagen + "\" alt=\"\" />\n"
                    + "                                                                         <p>" + detalle.getIdProducto() + "</p>\n"
                    + "										<h2>$" + detalle.getPrecio() + "</h2>\n"
                    + "										<p>" + detalle.getCantidad() + "</p>\n"
                    + "									</div>\n"
                    + "								</div>\n"
                    + "							</div>\n"
                    + "						</div>";
        }
        return htmlcode;
    }
}
