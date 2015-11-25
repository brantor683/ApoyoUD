/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Convocatoria;
import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Brandon
 */
public class ConvocatoriaDAO {

    public String registarConvocatoria(Convocatoria c, Usuario user) {
        String error = "";

        try {

            String strSQL = "INSERT INTO S_convocatoria VALUES(?,?,?,?,?,'Inactiva',?,?,?)";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, c.getK_convocatoria());
            prepStmt.setInt(2, c.getD_anoConvocatoria());
            prepStmt.setString(3, c.getF_inicioConvocatoria());
            prepStmt.setString(4, c.getF_finConvocatoria());
            prepStmt.setInt(5, c.getPeriodo());
            prepStmt.setInt(6, c.getD_cuposCategoriaA());
            prepStmt.setInt(7, c.getD_cuposCategoriaB());
            prepStmt.setInt(8, c.getD_cuposCategoriaC());

            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

            error = error + " Registrar convocatoria: " + c.getK_convocatoria();
        } catch (SQLException e) {

            error = "Convocatoria_DAO " + "Registrar convocatoria " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
            
        }

        return error;
    }

    public Convocatoria buscarConvocatoria(String estado_convocatoria, Usuario user) {
        Convocatoria convocatoria = new Convocatoria();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT * FROM s_convocatoria WHERE e_convocatoria=?";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setString(1, (estado_convocatoria));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                convocatoria.setK_convocatoria(rs.getInt(1));
                convocatoria.setD_anoConvocatoria(rs.getInt(2));
                convocatoria.setF_inicioConvocatoria(rs.getString(3));
                convocatoria.setF_finConvocatoria(rs.getString(4));
                convocatoria.setPeriodo(rs.getInt(5));
                convocatoria.setE_convocatoria(rs.getString(6));
            }
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            return convocatoria;
        } catch (SQLException e) {

        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
           // ServiceLocator.getInstance(user).close();
          
        }
        System.out.println(convocatoria.getK_convocatoria());
        return convocatoria;
    }

    public Convocatoria buscarConvocatoriaId(String idConvocatoria, Usuario user) {
        Convocatoria convocatoria = new Convocatoria();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT k_convocatoria FROM s_convocatoria WHERE k_convocatoria=?";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.valueOf(idConvocatoria));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                convocatoria.setK_convocatoria(rs.getInt(1));

            }
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            return convocatoria;
        } catch (SQLException e) {

        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
          
           
        }
        System.out.println(convocatoria.getK_convocatoria());
        return convocatoria;
    }
}
