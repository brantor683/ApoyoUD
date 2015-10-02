/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import java.io.File;

/**
 *
 * @author Brandon
 */
public class Directorio {
    
    private File directorio;
    public Directorio(){
        
    }
    
    
    public void generarDirectorio(String ruta){
        try{
        directorio= new File(ruta); 
        directorio.mkdirs();}
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
}
