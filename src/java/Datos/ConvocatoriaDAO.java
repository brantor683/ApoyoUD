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

            String strSQL = "INSERT INTO S_convocatoria VALUES(?,?,?,?,?,?)";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, c.getK_convocatoria());
            prepStmt.setInt(2, c.getD_anoConvocatoria());
            prepStmt.setString(3, c.getF_inicioConvocatoria());
            prepStmt.setString(4, c.getF_finConvocatoria());
            prepStmt.setInt(5, c.getPeriodo());
            prepStmt.setString(6, c.getE_estadoconvocatoria());

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
            String strSQL = "SELECT * FROM s_convocatoria WHERE e_estadoconvocatoria=?";
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
                convocatoria.setE_estadoconvocatoria(rs.getString(6));
            }

            return convocatoria;
        } catch (SQLException e) {

        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        System.out.println(convocatoria.getK_convocatoria());
        return convocatoria;
    }

    public String buscarPrivilegio2(String privilegio, Usuario user) {
        String error = "<table style='border: 1px solid black;'>";
        ResultSet tabla = null;
        if (privilegio.equals("Todos")) {
            try {
                String strSQL = "SQL> select s.k_idsolicitud, s.e_estsolicitud, "
                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
                        + "f.n_nomfacultad, pc.n_nomproycurricular from solicitud,"
                        + "estudiante e, facultad f, proyectocurricular pc WHERE "
                        + "e.k_codestudiante=s.k_est_codestudiante AND "
                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
                        + "pc.k_proy_facultad=f.k_facultad";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.executeUpdate();
                tabla = prepStmt.getResultSet();
                while (tabla.next()) {
                    error = error + "<tr style='width:80%;  border: 1px solid black;'><td style='width:40%; border: 1px solid black;'>" + tabla.getString(1) + " </td> <td style='width:40%; border: 1px solid black;'> " + tabla.getString(2) + "</td></tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "Privilegio DAO " + "Consultar priveligos Sistema" + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        } else if (privilegio.equals("Ingenieria")) {

            try {
                String strSQL = "Select grantee, privilege from DBA_TAB_PRIVS where "
                        + "Grantee LIKE 'ROL_%' or Grantee = 'FACIS' order by grantee";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.executeUpdate();
                tabla = prepStmt.getResultSet();
                while (tabla.next()) {
                    error = error + "<tr style='width:80%;  border: 1px solid black;'><td style='width:40%; border: 1px solid black;'>" + tabla.getString(1) + " </td> <td style='width:40%; border: 1px solid black;'> " + tabla.getString(2) + "</td></tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "Privilegio DAO " + "Consultar priveligos Objeto" + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        }
        else if (privilegio.equals("Ciencia")) {

            try {
                String strSQL = "Select grantee, privilege from DBA_TAB_PRIVS where "
                        + "Grantee LIKE 'ROL_%' or Grantee = 'FACIS' order by grantee";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.executeUpdate();
                tabla = prepStmt.getResultSet();
                while (tabla.next()) {
                    error = error + "<tr style='width:80%;  border: 1px solid black;'><td style='width:40%; border: 1px solid black;'>" + tabla.getString(1) + " </td> <td style='width:40%; border: 1px solid black;'> " + tabla.getString(2) + "</td></tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "Privilegio DAO " + "Consultar priveligos Objeto" + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        }
        else if (privilegio.equals("ASAB")) {

            try {
                String strSQL = "Select grantee, privilege from DBA_TAB_PRIVS where "
                        + "Grantee LIKE 'ROL_%' or Grantee = 'FACIS' order by grantee";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.executeUpdate();
                tabla = prepStmt.getResultSet();
                while (tabla.next()) {
                    error = error + "<tr style='width:80%;  border: 1px solid black;'><td style='width:40%; border: 1px solid black;'>" + tabla.getString(1) + " </td> <td style='width:40%; border: 1px solid black;'> " + tabla.getString(2) + "</td></tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "Privilegio DAO " + "Consultar priveligos Objeto" + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        }
        return error;
    }
//Vivero,Tecnologica
}
