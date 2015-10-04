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
public class Convocatoria {
    	private int d_anoConvocatoria;
	private String f_inicioConvocatoria;
	private String f_finConvocatoria;
	private int periodo;
	private String e_estadoconvocatoria;
	private int k_convocatoria;
        private int d_cuposCategoriaA;
        private int d_cuposCategoriaB;
        private int d_cuposCategoriaC;

public Convocatoria(){
    
}

    public int getD_anoConvocatoria() {
        return d_anoConvocatoria;
    }

    public void setD_anoConvocatoria(int d_anoConvocatoria) {
        this.d_anoConvocatoria = d_anoConvocatoria;
    }

  
    public String getF_inicioConvocatoria() {
        return f_inicioConvocatoria;
    }

    public void setF_inicioConvocatoria(String f_inicioConvocatoria) {
        this.f_inicioConvocatoria = f_inicioConvocatoria;
    }

    public String getF_finConvocatoria() {
        return f_finConvocatoria;
    }

    public void setF_finConvocatoria(String f_finConvocatoria) {
        this.f_finConvocatoria = f_finConvocatoria;
    }

    public int getPeriodo() {
        return periodo;
    }

    public void setPeriodo(int periodo) {
        this.periodo = periodo;
    }

    public String getE_estadoconvocatoria() {
        return e_estadoconvocatoria;
    }

    public void setE_estadoconvocatoria(String e_estadoconvocatoria) {
        this.e_estadoconvocatoria = e_estadoconvocatoria;
    }

    public int getK_convocatoria() {
        return k_convocatoria;
    }

    public void setK_convocatoria(int k_convocatoria) {
        this.k_convocatoria = k_convocatoria;
    }

    public int getD_cuposCategoriaA() {
        return d_cuposCategoriaA;
    }

    public void setD_cuposCategoriaA(int d_cuposCategoriaA) {
        this.d_cuposCategoriaA = d_cuposCategoriaA;
    }

    public int getD_cuposCategoriaB() {
        return d_cuposCategoriaB;
    }

    public void setD_cuposCategoriaB(int d_cuposCategoriaB) {
        this.d_cuposCategoriaB = d_cuposCategoriaB;
    }

    public int getD_cuposCategoriaC() {
        return d_cuposCategoriaC;
    }

    public void setD_cuposCategoriaC(int d_cuposCategoriaC) {
        this.d_cuposCategoriaC = d_cuposCategoriaC;
    }


}
