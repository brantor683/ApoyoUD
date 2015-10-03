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
import java.sql.SQLException;

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
    
    
}
