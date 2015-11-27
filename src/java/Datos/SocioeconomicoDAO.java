/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.ItemSocioeconomico;
import Negocio.Socioeconomico;
import Negocio.Solicitud;
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
public class SocioeconomicoDAO {

    public String registrarSocioeconomica(Socioeconomico s, Usuario user) {
        String error = "";

        try {

            String strSQL = "INSERT INTO S_SOLI_SOCIOECONOMICO VALUES(?,SEQ_SOLICITUD.CURRVAL,?,'N')";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, s.getK_soc_socioeconomica());
            prepStmt.setString(2, s.getD_soporte());

            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

            //  error = error + " Registrar solicitud: " +  s.getK_idSolicitud() ;
        } catch (SQLException e) {

            error = "Socioeconomico_DAO " + "Registrar Solicitud_Socioeconomico " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }

        return error;
    }
    
     
    public Socioeconomico buscarDocumento(int id_itemSocioeconomico, int id_solicitud, Usuario user) {
   
        Socioeconomico socioeconomico = new Socioeconomico();

        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT d_soporte  FROM S_SOLI_SOCIOECONOMICO  WHERE K_SOC_socioeconomica=? AND K_SOL_IDSOLICITUD=?" ;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, (id_itemSocioeconomico));
            prepStmt.setInt(2, (id_solicitud));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
        
              
            socioeconomico.setD_soporte(rs.getString(1));
            
         
            }
          
            ServiceLocator.getInstance(user).commit();
            return socioeconomico;
        } catch (SQLException e) {

         
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return socioeconomico;
    }
    
}
