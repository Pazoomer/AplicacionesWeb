package clases;

import java.sql.Date;

/**
 *
 * @author t1pas
 */
public class Compra {
    private int idUsuario;
    private Date fecha;
    private String estado;
    private double total;

    public Compra(int idUsuario, Date fecha, String estado, double total) {
        this.idUsuario = idUsuario;
        this.fecha = fecha;
        this.estado = estado;
        this.total = total;
    }

    public Compra(Date fecha, String estado, double total) {
        this.fecha = fecha;
        this.estado = estado;
        this.total = total;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
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
    
    
}
