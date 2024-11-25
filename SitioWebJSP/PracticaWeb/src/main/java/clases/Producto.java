package clases;

/**
 *
 * @author t1pas
 */
public class Producto {
    private int id;
    private String nombre;
    private String img;
    private String descripcion;
    private double precio;
    private int stock;

    public Producto(int id, String nombre, String img, double precio, int stock, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion=descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
