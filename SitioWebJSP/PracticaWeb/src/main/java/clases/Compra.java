package clases;

import java.sql.Date;

/**
 *
 * @author t1pas
 */
public class Compra {
    private int idCompra;
    private Date fecha;
    private String estado;
    private double total;

    public Compra(int idCompra, Date fecha, String estado, double total) {
        this.idCompra = idCompra;
        this.fecha = fecha;
        this.estado = estado;
        this.total = total;
    }

    public Compra(Date fecha, String estado, double total) {
        this.fecha = fecha;
        this.estado = estado;
        this.total = total;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getIdCompra() {
        return idCompra;
    }

    public void setIdCompra(int idCompra) {
        this.idCompra = idCompra;
    }
    
}
