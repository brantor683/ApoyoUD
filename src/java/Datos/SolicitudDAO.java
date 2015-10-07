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

    public SolicitudDAO() {

    }

    public String registrarSolicitud(Solicitud s, Usuario user) {
        String error = "";

        try {

            String strSQL = "INSERT INTO S_SOLICITUD(k_idSolicitud, f_solicitud, e_estSolicitud, k_conv_convocatoria, k_est_codEstudiante) VALUES(SEQ_SOLICITUD.NEXTVAL,SYSDATE,'Recibida',?,?)";

            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();

            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);

            prepStmt.setInt(1, s.getK_conv_convocatoria());
            prepStmt.setInt(2, s.getK_est_codEstudiante());

            prepStmt.executeQuery();
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
               prepStmt.close();
            ServiceLocator.getInstance(user).commit();
       
            return solicitud;
        } catch (SQLException e) {

            JOptionPane.showMessageDialog(null, "No Encontrado: " + e, null, JOptionPane.ERROR_MESSAGE);
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return solicitud;
    }
    
    public Solicitud buscarSolicitudConvocatoria(String id_estudiante, int id_convocatoria, Usuario user) {
        Solicitud solicitud = new Solicitud();
        try {

            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT k_est_codestudiante, k_conv_convocatoria, k_idsolicitud   FROM S_SOLICITUD s WHERE K_est_codestudiante=? and k_conv_convocatoria=?" ;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_estudiante));
            prepStmt.setInt(2, id_convocatoria);
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                solicitud.setK_est_codEstudiante(rs.getInt(1));
                solicitud.setK_conv_convocatoria(rs.getInt(2));
                solicitud.setK_idSolicitud(rs.getInt(3));

            }
              prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            return solicitud;
        } catch (SQLException e) {

            JOptionPane.showMessageDialog(null, "No Encontrado: " + e, null, JOptionPane.ERROR_MESSAGE);
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return solicitud;
    }

    public String buscarSolicitudFuncionario(String consFacultad, String consProyCurri, Usuario user) {
        String error = "<table  style='font: normal 12px/150% Arial, Helvetica, sans-serif; background: #fff; overflow: hidden; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; '>";
        ResultSet tabla = null;
        if (consFacultad.equals("Todos") && consProyCurri.equals("Todos")) {
            try {
                String strSQL = "SELECT s.k_idsolicitud, s.e_estsolicitud, "
                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
                        + "f.n_nomfacultad, pc.n_nomproycurricular "
                        + "FROM solicitud s,estudiante e, facultad f, proyectocurricular pc WHERE "
                        + "s.k_est_codestudiante=e.k_codestudiante AND "
                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
                        + "pc.k_proy_facultad=f.k_facultad ORDER BY s.k_idsolicitud";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.executeQuery();
                tabla = prepStmt.getResultSet();
                error = error + "<tr style=' border: 1px solid black;'>"
                        //TD CODIGO ESTUDIANTE
                        + "     <td  style=' padding:15px;\n" 
                        + " color:#fff;\n" 
                        + "    text-shadow:1px 1px 1px #568F23;\n" 
                        + "    border:1px solid #93CE37;\n" 
                        + "    border-bottom:3px solid #9ED929;\n" 
                        + "    background-color:#9DD929;\n" 
                        + "    background:-webkit-gradient(\n" 
                        + "    linear,\n" 
                        + "    left bottom,\n" 
                        + "    left top,\n" 
                        + "    color-stop(0.02, rgb(123,192,67)),\n" 
                        + "        color-stop(0.51, rgb(139,198,66)),\n" 
                        + "        color-stop(0.87, rgb(158,217,41))\n" +
                        "        );\n"
                        + "    background: -moz-linear-gradient(\n" 
                        + "        center bottom,\n" 
                        + "        rgb(123,192,67) 2%,\n" 
                        + "        rgb(139,198,66) 51%,\n" 
                        + "        rgb(158,217,41) 87%\n" 
                        + "        );\n" 
                        + "    -webkit-border-top-left-radius:5px;\n" 
                        + "    -webkit-border-top-right-radius:5px;\n" 
                        + "    -moz-border-radius:5px 5px 0px 0px;\n" 
                        + "    border-top-left-radius:5px;\n" 
                        // CODIGO SOLICITUD
                        + "    border-top-right-radius:5px;'>" + "Codigo Solicitud" + " </td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        // ESTADO SOLICITUD
                        + "    border-top-right-radius:5px; '> " + "Estado Solicitud" + "</td>" + "     "
                        + "     <td style='padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //CODIGO ESTUDIANTE
                        + "    border-top-right-radius:5px;'> " + "Codigo Estudiante" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //NOMBRES
                        + "    border-top-right-radius:5px;'> " + "Nombres" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //APELLIDOS
                        + "    border-top-right-radius:5px;'> " + "Apellidos" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //FACULTAD
                        + "    border-top-right-radius:5px;'> " + "Facultad" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //PROYECTO CURRICULAR
                        + "    border-top-right-radius:5px;'> " + "Proyecto Currciular" + "</td>"
                        + "</tr>";
                while (tabla.next()) {
                    error = error + "<tr style='border: 2px solid black;'>"
                            + "     <td style=' border: 2px solid black;'>" + tabla.getInt(1) + " </td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getString(2) + "</td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getInt(3) + "</td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getString(4) + "</td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getString(5) + "</td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getString(6) + "</td>"
                            + "     <td style=' border: 2px solid black;'> " + tabla.getString(7) + "</td>"
                            + "</tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "Privilegio DAO " + "Consultar priveligos Sistema" + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        } else if (consFacultad.equals("Todos") && !consProyCurri.equals("Todos")) {
            try {
                String strSQL = "SELECT s.k_idsolicitud, s.e_estsolicitud, "
                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
                        + "f.n_nomfacultad, pc.n_nomproycurricular "
                        + "FROM solicitud s,estudiante e, facultad f, proyectocurricular pc WHERE "
                        + "s.k_est_codestudiante=e.k_codestudiante AND "
                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
                        + "pc.k_proy_facultad=f.k_facultad AND pc.n_nomproycurricular=?"
                        + " ORDER BY s.k_idsolicitud";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.setString(1, consProyCurri);
                prepStmt.executeQuery();
                tabla = prepStmt.getResultSet();
                error = error + "<tr style='  border: 1px solid black;'>"
                         //TD CODIGO ESTUDIANTE
                        + "     <td  style=' padding:15px;\n" 
                        + " color:#fff;\n" 
                        + "    text-shadow:1px 1px 1px #568F23;\n" 
                        + "    border:1px solid #93CE37;\n" 
                        + "    border-bottom:3px solid #9ED929;\n" 
                        + "    background-color:#9DD929;\n" 
                        + "    background:-webkit-gradient(\n" 
                        + "    linear,\n" 
                        + "    left bottom,\n" 
                        + "    left top,\n" 
                        + "    color-stop(0.02, rgb(123,192,67)),\n" 
                        + "        color-stop(0.51, rgb(139,198,66)),\n" 
                        + "        color-stop(0.87, rgb(158,217,41))\n" +
                        "        );\n"
                        + "    background: -moz-linear-gradient(\n" 
                        + "        center bottom,\n" 
                        + "        rgb(123,192,67) 2%,\n" 
                        + "        rgb(139,198,66) 51%,\n" 
                        + "        rgb(158,217,41) 87%\n" 
                        + "        );\n" 
                        + "    -webkit-border-top-left-radius:5px;\n" 
                        + "    -webkit-border-top-right-radius:5px;\n" 
                        + "    -moz-border-radius:5px 5px 0px 0px;\n" 
                        + "    border-top-left-radius:5px;\n" 
                        // CODIGO SOLICITUD
                        + "    border-top-right-radius:5px;'>" + "Codigo Solicitud" + " </td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        // ESTADO SOLICITUD
                        + "    border-top-right-radius:5px; '> " + "Estado Solicitud" + "</td>" + "     "
                        + "     <td style='padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //CODIGO ESTUDIANTE
                        + "    border-top-right-radius:5px;'> " + "Codigo Estudiante" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //NOMBRES
                        + "    border-top-right-radius:5px;'> " + "Nombres" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //APELLIDOS
                        + "    border-top-right-radius:5px;'> " + "Apellidos" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //FACULTAD
                        + "    border-top-right-radius:5px;'> " + "Facultad" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //PROYECTO CURRICULAR
                        + "    border-top-right-radius:5px;'> " + "Proyecto Currciular" + "</td>"
                        + "</tr>";
                while (tabla.next()) {
                    error = error + "<tr style=' border: 1px solid black;'>"
                            + "     <td style=' border: 1px solid black;'>" + tabla.getInt(1) + " </td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getString(2) + "</td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getInt(3) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(4) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(5) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(6) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(7) + "</td>"
                            + "</tr>";
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
        
        else if (!consFacultad.equals("Todos") && consProyCurri.equals("Todos")) {
            try {
                String strSQL = "SELECT s.k_idsolicitud, s.e_estsolicitud, "
                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
                        + "f.n_nomfacultad, pc.n_nomproycurricular "
                        + "FROM solicitud s,estudiante e, facultad f, proyectocurricular pc WHERE "
                        + "s.k_est_codestudiante=e.k_codestudiante AND "
                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
                        + "pc.k_proy_facultad=f.k_facultad AND f.n_nomfacultad=?"
                        + " ORDER BY s.k_idsolicitud";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.setString(1, consFacultad);
                prepStmt.executeQuery();
                tabla = prepStmt.getResultSet();
                error = error + "<tr style='  border: 1px solid black;'>"
                         //TD CODIGO ESTUDIANTE
                        + "     <td  style=' padding:15px;\n" 
                        + " color:#fff;\n" 
                        + "    text-shadow:1px 1px 1px #568F23;\n" 
                        + "    border:1px solid #93CE37;\n" 
                        + "    border-bottom:3px solid #9ED929;\n" 
                        + "    background-color:#9DD929;\n" 
                        + "    background:-webkit-gradient(\n" 
                        + "    linear,\n" 
                        + "    left bottom,\n" 
                        + "    left top,\n" 
                        + "    color-stop(0.02, rgb(123,192,67)),\n" 
                        + "        color-stop(0.51, rgb(139,198,66)),\n" 
                        + "        color-stop(0.87, rgb(158,217,41))\n" +
                        "        );\n"
                        + "    background: -moz-linear-gradient(\n" 
                        + "        center bottom,\n" 
                        + "        rgb(123,192,67) 2%,\n" 
                        + "        rgb(139,198,66) 51%,\n" 
                        + "        rgb(158,217,41) 87%\n" 
                        + "        );\n" 
                        + "    -webkit-border-top-left-radius:5px;\n" 
                        + "    -webkit-border-top-right-radius:5px;\n" 
                        + "    -moz-border-radius:5px 5px 0px 0px;\n" 
                        + "    border-top-left-radius:5px;\n" 
                        // CODIGO SOLICITUD
                        + "    border-top-right-radius:5px;'>" + "Codigo Solicitud" + " </td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        // ESTADO SOLICITUD
                        + "    border-top-right-radius:5px; '> " + "Estado Solicitud" + "</td>" + "     "
                        + "     <td style='padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //CODIGO ESTUDIANTE
                        + "    border-top-right-radius:5px;'> " + "Codigo Estudiante" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //NOMBRES
                        + "    border-top-right-radius:5px;'> " + "Nombres" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //APELLIDOS
                        + "    border-top-right-radius:5px;'> " + "Apellidos" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //FACULTAD
                        + "    border-top-right-radius:5px;'> " + "Facultad" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //PROYECTO CURRICULAR
                        + "    border-top-right-radius:5px;'> " + "Proyecto Currciular" + "</td>"
                        + "</tr>";
                while (tabla.next()) {
                    error = error + "<tr style=' border: 1px solid black;'>"
                            + "     <td style=' border: 1px solid black;'>" + tabla.getInt(1) + " </td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getString(2) + "</td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getInt(3) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(4) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(5) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(6) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(7) + "</td>"
                            + "</tr>";
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
        
        else if (!consFacultad.equals("Todos") && !consProyCurri.equals("Todos")) {
             try { 
                String strSQL = "SELECT s.k_idsolicitud, s.e_estsolicitud, "
                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
                        + "f.n_nomfacultad, pc.n_nomproycurricular "
                        + "FROM solicitud s,estudiante e, facultad f, proyectocurricular pc WHERE "
                        + "s.k_est_codestudiante=e.k_codestudiante AND "
                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
                        + "pc.k_proy_facultad=f.k_facultad AND pc.n_nomproycurricular=? AND "
                        + "f.n_nomfacultad=? ORDER BY s.k_idsolicitud";
                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
                PreparedStatement prepStmt;
                prepStmt = conexion.prepareStatement(strSQL);
                prepStmt.setString(1, consProyCurri);
                prepStmt.setString(2, consFacultad);
                prepStmt.executeQuery();
                tabla = prepStmt.getResultSet();
                error = error + "<tr style='  border: 1px solid black;'>"
                         //TD CODIGO ESTUDIANTE
                        + "     <td  style=' padding:15px;\n" 
                        + " color:#fff;\n" 
                        + "    text-shadow:1px 1px 1px #568F23;\n" 
                        + "    border:1px solid #93CE37;\n" 
                        + "    border-bottom:3px solid #9ED929;\n" 
                        + "    background-color:#9DD929;\n" 
                        + "    background:-webkit-gradient(\n" 
                        + "    linear,\n" 
                        + "    left bottom,\n" 
                        + "    left top,\n" 
                        + "    color-stop(0.02, rgb(123,192,67)),\n" 
                        + "        color-stop(0.51, rgb(139,198,66)),\n" 
                        + "        color-stop(0.87, rgb(158,217,41))\n" +
                        "        );\n"
                        + "    background: -moz-linear-gradient(\n" 
                        + "        center bottom,\n" 
                        + "        rgb(123,192,67) 2%,\n" 
                        + "        rgb(139,198,66) 51%,\n" 
                        + "        rgb(158,217,41) 87%\n" 
                        + "        );\n" 
                        + "    -webkit-border-top-left-radius:5px;\n" 
                        + "    -webkit-border-top-right-radius:5px;\n" 
                        + "    -moz-border-radius:5px 5px 0px 0px;\n" 
                        + "    border-top-left-radius:5px;\n" 
                        // CODIGO SOLICITUD
                        + "    border-top-right-radius:5px;'>" + "Codigo Solicitud" + " </td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        // ESTADO SOLICITUD
                        + "    border-top-right-radius:5px; '> " + "Estado Solicitud" + "</td>" + "     "
                        + "     <td style='padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //CODIGO ESTUDIANTE
                        + "    border-top-right-radius:5px;'> " + "Codigo Estudiante" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //NOMBRES
                        + "    border-top-right-radius:5px;'> " + "Nombres" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //APELLIDOS
                        + "    border-top-right-radius:5px;'> " + "Apellidos" + "</td>"
                        + "     <td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //FACULTAD
                        + "    border-top-right-radius:5px;'> " + "Facultad" + "</td>" + "     "
                        + "<td style=' padding:15px;\n"
                        + "    color:#fff;\n"
                        + "    text-shadow:1px 1px 1px #568F23;\n"
                        + "    border:1px solid #93CE37;\n"
                        + "    border-bottom:3px solid #9ED929;\n"
                        + "    background-color:#9DD929;\n"
                        + "    background:-webkit-gradient(\n"
                        + "        linear,\n"
                        + "        left bottom,\n"
                        + "        left top,\n"
                        + "        color-stop(0.02, rgb(123,192,67)),\n"
                        + "        color-stop(0.51, rgb(139,198,66)),\n"
                        + "        color-stop(0.87, rgb(158,217,41))\n"
                        + "        );\n"
                        + "    background: -moz-linear-gradient(\n"
                        + "        center bottom,\n"
                        + "        rgb(123,192,67) 2%,\n"
                        + "        rgb(139,198,66) 51%,\n"
                        + "        rgb(158,217,41) 87%\n"
                        + "        );\n"
                        + "    -webkit-border-top-left-radius:5px;\n"
                        + "    -webkit-border-top-right-radius:5px;\n"
                        + "    -moz-border-radius:5px 5px 0px 0px;\n"
                        + "    border-top-left-radius:5px;\n"
                        //PROYECTO CURRICULAR
                        + "    border-top-right-radius:5px;'> " + "Proyecto Currciular" + "</td>"
                        + "</tr>";
                while (tabla.next()) {
                    error = error + "<tr style=' border: 1px solid black;'>"
                            + "     <td style=' border: 1px solid black;'>" + tabla.getInt(1) + " </td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getString(2) + "</td>"
                            + "     <td style='border: 1px solid black;'> " + tabla.getInt(3) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(4) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(5) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(6) + "</td>"
                            + "     <td style=' border: 1px solid black;'> " + tabla.getString(7) + "</td>"
                            + "</tr>";
                }
                error = error + "</table>";
                prepStmt.close();
                ServiceLocator.getInstance(user).commit();
            } catch (SQLException ex) {
                error = "SolicitudDAO " + "Consultar Solitudes por Funcionario: " + ex.getMessage();
            } finally {
                ServiceLocator.getInstance(user).liberarConexion();
            }

        }

        return error;
    }

    //    public String[][] buscarSolicitudFuncionario2(String consFacultad, String consProyCurri, Usuario user) {
//        String error="";
//        int i=0;
//        ArrayList<ArrayList<String>> tablaResult = new ArrayList<ArrayList<String>>();
//        ResultSet tabla = null;
//        if (consFacultad.equals("Todos") && consProyCurri.equals("Todos")) {
//            try {
//                String strSQL = "SELECT s.k_idsolicitud, s.e_estsolicitud, "
//                        + "e.k_codEstudiante,e.n_nomestudiante, e.n_apeestudiante,"
//                        + "f.n_nomfacultad, pc.n_nomproycurricular "
//                        + "FROM solicitud s,estudiante e, facultad f, proyectocurricular pc WHERE "
//                        + "s.k_est_codestudiante=e.k_codestudiante AND "
//                        + "e.k_est_proycurricular=pc.k_proycurricular AND "
//                        + "pc.k_proy_facultad=f.k_facultad ORDER BY s.k_idsolicitud";
//
//                Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
//                PreparedStatement prepStmt;
//                prepStmt = conexion.prepareStatement(strSQL);
//                prepStmt.executeQuery();
//                tabla = prepStmt.getResultSet();
//                
//                while (tabla.next()) {
//                    tablaResult.add(tabla.getInt(1));
//                    tablaResult.add(tabla.getString(2));
//                    tablaResult.add(tabla.getInt(3));
//                    tablaResult.add(tabla.getString(4));
//                    tablaResult.add(tabla.getString(5));
//                    tablaResult.add(tabla.getString(6));
//                    tablaResult.add(tabla.getString(7));
//                    i++;
//                }
//                prepStmt.close();
//                ServiceLocator.getInstance(user).commit();
//            } catch (SQLException ex) {
//                error = "Privilegio DAO " + "Consultar priveligos Sistema" + ex.getMessage();
//            } finally {
//                ServiceLocator.getInstance(user).liberarConexion();
//            }
//
//        } 
//              return tablaResult;
//    }

}
