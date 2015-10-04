/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Socioeconomico;
import Negocio.Solicitud;
import Negocio.Usuario;
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
    
     public Solicitud buscarSolicitudSocioeconomica(String id_estudiante, int id_convocatoria, Usuario user) {
        Solicitud solicitud = new Solicitud();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT k_est_codestudiante, k_conv_convocatoria  FROM S_SOLICITUD s WHERE K_est_codestudiante=? and k_conv_convocatoria=?" ;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_estudiante));
            prepStmt.setInt(2, id_convocatoria);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                solicitud.setK_est_codEstudiante(rs.getInt(1));
                solicitud.setK_conv_convocatoria(rs.getInt(2));
             

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
