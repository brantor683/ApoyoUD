/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Datos;


import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import oracle.jdbc.OracleCallableStatement;
import oracle.jdbc.OracleTypes;
/**
 *
 * @author LORENA MANZANO
 */
public class BeneficiarioDAO {
    String correos = "";
    public String consultar_Beneficiarios(Usuario user) {
        String respuesta = "<table style='border: 2px solid black;'>";
        ResultSet tabla = null;
        String pmerror = null;
        int pcerror = 0, cantidad_total=0;
        try {
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            CallableStatement cstmt = conexion.prepareCall("{call S_PR_LIST_BENEFICIARIOS(?,?,?)}");
            cstmt.registerOutParameter(1, OracleTypes.CURSOR);
            cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
            cstmt.registerOutParameter(3, java.sql.Types.NUMERIC);
            cstmt.execute();

            pmerror=cstmt.getString(2);
            pcerror=cstmt.getInt(3);
            
            tabla = ((OracleCallableStatement)cstmt).getCursor(1);
            
            //TITULOS DE LA TABLA-----------------------------------------------

            respuesta = respuesta + "<tr style='width:80%;  border: 1px solid black; text-align: center;"
                    + "'>"
                                  + "<td style='width:40%; border: 1px solid black;'>" + "<span style='font-weight:bold;'>CODIGO</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'>" + "<span style='font-weight:bold;'>NOMBRES</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'>" + "<span style='font-weight:bold;'>APELLIDOS</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'> " + "<span style='font-weight:bold;'>PUNTAJE TOTAL</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'> " + "<span style='font-weight:bold;'>PROMEDIO</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'> " + "<span style='font-weight:bold;'>MATRICULAS</span>" + "</td>"
                                  + "<td style='width:40%; border: 1px solid black;'> " + "<span style='font-weight:bold;'>ESTADO</span>" + "</td>";
                   respuesta = respuesta + "</tr>";
            //------------------------------------------------------------------
            while (tabla.next()) {
                    respuesta = respuesta + "<tr style='width:80%;  border: 1px solid black;'>"     
                                          + "<td style='width:40%; border: 1px solid black;'>" + tabla.getString("CODIGO")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'>" + tabla.getString("NOMBRE")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'>" + tabla.getString("APELLIDO")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'> " + tabla.getString("PUNTAJETOTAL")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'> " + tabla.getString("PROMEDIO")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'> " + tabla.getString("MATRICULAS")+"</td>"
                                          + "<td style='width:40%; border: 1px solid black;'> " + tabla.getString("ESTADO")+"</td>";
                   respuesta = respuesta + "</tr>";
            }
            respuesta = respuesta + "</table>";
            tabla.close();
            tabla=null;
            cstmt.close();
            cstmt=null;
            ServiceLocator.getInstance(user).commit();
            
        } catch (SQLException e) {
            //throw new RHException("Socio_DAO", "No pudo crear el Socio" + e.getMessage());
            respuesta = "BeneficiarioDAO " + " consultar Beneficiarios:  " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        
        return respuesta;
    }
    
    public String Generar_Beneficiario_Archivo(Usuario user) {

        String respuesta="";
        try {
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            CallableStatement cstmt = conexion.prepareCall("{call S_PR_CREAR_ARCH_SOLICITUD(?)}");
            cstmt.registerOutParameter(1, OracleTypes.LONGVARCHAR);
            cstmt.execute();
            
            correos =cstmt.getString(1);
            respuesta=correos;
            
            cstmt.close();
            cstmt=null;
            ServiceLocator.getInstance(user).commit();
            
        } catch (SQLException e) {
            //throw new RHException("Socio_DAO", "No pudo crear el Socio" + e.getMessage());
            respuesta = "BeneficiarioDAO " + " Generar_Beneficiario_Archivo:  " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        
        return respuesta;
    }
}
