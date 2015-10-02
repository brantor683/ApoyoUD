/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Negocio;

/**
 *
 * @author Brandon
 */
public class Socioeconomico {
    
    private int k_soc_socioeconomica;
    private int k_sol_idsolicitud; 
    private String d_soporte ;
    private String e_estado_validacion ;
    
    public Socioeconomico(){
        
    }

    public int getK_soc_socioeconomica() {
        return k_soc_socioeconomica;
    }

    public void setK_soc_socioeconomica(int k_soc_socioeconomica) {
        this.k_soc_socioeconomica = k_soc_socioeconomica;
    }

    public int getK_sol_idsolicitud() {
        return k_sol_idsolicitud;
    }

    public void setK_sol_idsolicitud(int k_sol_idsolicitud) {
        this.k_sol_idsolicitud = k_sol_idsolicitud;
    }

    public String getD_soporte() {
        return d_soporte;
    }

    public void setD_soporte(String d_soporte) {
        this.d_soporte = d_soporte;
    }

    public String getE_estado_validacion() {
        return e_estado_validacion;
    }

    public void setE_estado_validacion(String e_estado_validacion) {
        this.e_estado_validacion = e_estado_validacion;
    }
    
    
}
