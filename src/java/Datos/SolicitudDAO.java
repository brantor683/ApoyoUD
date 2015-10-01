/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Usuario;
import Negocio.Solicitud;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/**
 *
 * @author Brandon
 */
public class SolicitudDAO {
    
    public SolicitudDAO(){
        
    }
    
        public String registrarSolicitud(Solicitud s, Usuario user) {
        String error ="";
      
        try {

            String strSQL = "INSERT INTO S_SOLICITUD(k_idSolicitud, f_solicitud, e_estSolicitud, k_conv_convocatoria, k_est_codEstudiante) VALUES(SEQ_SOLICITUD.NEXTVAL,SYSDATE,'Recibida',?,?)";


            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            
           
            prepStmt.setInt(1, s.getK_conv_convocatoria());
             prepStmt.setInt(2, s.getK_est_codEstudiante());
           
           
            
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

          //  error = error + " Registrar solicitud: " +  s.getK_idSolicitud() ;
        } catch (SQLException e) {
     
            error = "Solictud_DAO " + "Registrar Solicitud " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }

        return error;
    }
        
        public Solicitud buscarSolicitud(String id_estudiante, Usuario user) {
        Solicitud solicitud = new Solicitud();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT * FROM S_SOLICITUD WHERE K_est_codestudiante=? and k_idSolicitud=5";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_estudiante));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                solicitud.setK_idSolicitud(rs.getInt(1));
                solicitud.setE_estSolicitud(rs.getString(2));
                solicitud.setK_est_codEstudiante(rs.getInt(3));
                solicitud.setK_func_idFuncionario(rs.getInt(4));
                solicitud.setK_conv_convocatoria(rs.getInt(5));
                solicitud.setD_diasbeneficio(rs.getInt(6));
                solicitud.setF_solicitud(rs.getString(7));
                         
            }
            return solicitud;
        } catch (SQLException e) {

            JOptionPane.showMessageDialog(null, "No Encontrado: " + e, null, JOptionPane.ERROR_MESSAGE);
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return solicitud;
    }
}
