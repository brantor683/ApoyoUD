/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;

import Negocio.ItemSocioeconomico;
import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Brandon
 */
public class ItemSocioeconomicoDAO {
    public List buscarSolicitudSocioeconomica(int id_solicitud, Usuario user) {
        List listaObjetos = new ArrayList();
        ItemSocioeconomico nuevo = new ItemSocioeconomico();
    
        int aux=0;
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT k_soc_socioeconomica  FROM S_SOLI_SOCIOECONOMICO s WHERE K_sol_idsolicitud=?" ;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, (id_solicitud));
        
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
               aux=0;
              
             nuevo.setK_socioeconomico(rs.getInt(1));
             aux=nuevo.getK_socioeconomico();
             listaObjetos.add(aux);
               
            }
         
            ServiceLocator.getInstance(user).commit();
            return listaObjetos;
        } catch (SQLException e) {

         
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return listaObjetos;
    }

    public ItemSocioeconomico buscarItemSocioeconomica(int id_itemSocioeconomico, Usuario user) {
   
        ItemSocioeconomico item = new ItemSocioeconomico();

        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT d_descsocioeconomica  FROM S_SOCIOECONOMICA s WHERE K_socioeconomico=?" ;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, (id_itemSocioeconomico));
        
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
        
              
            item.setD_descSocioeconomica(rs.getString(1));
         
            }
          
            ServiceLocator.getInstance(user).commit();
            return item;
        } catch (SQLException e) {

         
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return item;
    }
}


