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
            htmlcode += "<div class=\"col-lg-4 col-md-6 mb-3\">\n"
                    + "    <div class=\"card h-100\" style=\"border: none; border-radius: 15px; background-color: #d45523; color: #fff; width: 16rem; margin: auto;\">\n"
                    + "        <img src=\"" + producto.getImg() + "\" class=\"card-img-top\" alt=\"" + producto.getNombre() + "\" style=\"border-radius: 10px; height: 10rem; object-fit: cover;\">\n"
                    + "        <div class=\"card-body text-center\" style=\"padding: 0.2rem;\">\n"
                    + "            <h5 class=\"card-title\" style=\"font-size: 1.2rem; font-weight: bold; color: #f4b400;\">" + producto.getNombre() + "</h5>\n"
                    + "            <p class=\"card-text\" style=\"color: #ffebcd; font-size: 1rem;\">" + producto.getDescripcion() + "</p>\n"
                    + "            <h4 style=\"color: #f8e591; font-weight: bold; font-size: 1.1rem;\">$" + producto.getPrecio() + "</h4>\n"
                    + "        </div>\n"
                    + "        <div class=\"card-footer text-center\" style=\"background-color: #fbfbfb; border-top: none; padding: 0.5rem; border-radius: 0 0 15px 15px;\">\n"
                    + "            <a href=\"AddCart?cantidad=1&idproducto=" + producto.getId() + "\" class=\"btn\" style=\"background-color: #e8a54e; color: #f8e591; font-weight: bold; border-radius: 10px; font-size: 0.9rem; padding: 0.4rem 0.6rem;\">\n"
                    + "                <i class=\"fa fa-shopping-cart\"></i> Añadir\n"
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
                        + "    <div class=\"product-image-wrapper\" class=\"card h-100\"\n"
                        + "        style=\"border-radius: 15px; background-color: #c74e1e43; width: 12rem; margin: auto; padding-bottom: .8rem;\">\n"
                        + "        <div class=\"single-products\">\n"
                        + "            <div class=\"productinfo text-center\">\n"
                        + "                <h2 style=\"color: #ffffff; font-weight: bold; font-size: 2rem;\">" + compra.getEstado() + "</h2>\n"
                        + "                <p style=\"color: #ffcc00; font-weight: bold; font-size: 1rem;\">Pedido# " + compra.getIdCompra() + "</p>\n"
                        + "                <p style=\"color: #ffcc00; font-weight: bold; font-size: 1.1rem;\">Total: $" + compra.getTotal() + "</p>\n"
                        + "                <button class=\"btn\" style=\"background-color: #ffa52f; color: #ffffff; font-weight: bold; border-radius: 10px; font-size: 0.9rem; padding: 0.4rem 0.6rem;\" onclick=\"mostrarDetalles(" + compra.getIdCompra() + ")\">\n"
                        + "                    Ver detalles\n"
                        + "                </button>\n"
                        + "            </div>\n"
                        + "        </div>\n"
                        + "    </div>\n"
                        + "    <div id=\"detalles-" + compra.getIdCompra() + "\" style=\"display:none; margin-top: 10px;\">\n"
                        + "    </div>\n"
                        + "</div>";
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
                    + "    <div class=\"product-image-wrapper\" class=\"card h-100\"\n"
                    + "        style=\"border-radius: 15px; background-color: #c74e1e43; width: 12rem; margin: auto; padding-bottom: .8rem;\">\n"
                    + "        <div class=\"single-products\">\n"
                    + "            <div class=\"productinfo text-center\">\n"
                    + "                <img src=\"" + imagen + "\" alt=\"\" style=\"border-radius: 10px; height: 10rem; object-fit: cover;\">\n"
                    + "                <p style=\"color: #ffffff; font-weight: bold; font-size: 1rem;\">Producto# " + detalle.getIdProducto() + "</p>\n"
                    + "                <h2 style=\"color: #ffcc00; font-weight: bold; font-size: 1.2rem;\">$" + detalle.getPrecio() + "</h2>\n"
                    + "                <p style=\"color: #ffffff; font-weight: bold; font-size: 1rem;\">Cantidad: " + detalle.getCantidad() + "</p>\n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</div>";
        }
        return htmlcode;
    }
}
