/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;


import Negocio.Funcionario;
import Negocio.Usuario;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FuncionarioDAO {
    
    public Funcionario buscarFuncionario(String id_funcionario, Usuario user) {
        Funcionario funcionario = new Funcionario();  
         String error="";
        try {       
            //Instancia el objeto para retornar los datos del empleado
            String strSQL = "SELECT * FROM S_FUNCIONARIO WHERE K_IDFUNCIONARIO=?";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.setInt(1, Integer.parseInt(id_funcionario));
            ResultSet rs = prepStmt.executeQuery();
            while (rs.next()) {
                funcionario.setK_idFuncionario(rs.getInt(1));
                funcionario.setN_nomFuncionario(rs.getString(2));
            }
            return funcionario;
        } catch (SQLException e) {
            error = "Funcionario DAO " + "Buscar Id Funcionario " + e.getMessage();
          
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        return funcionario;
    }
    
    public String consultarIdFuncionario(String username, Usuario user) {

        String error = null;
        ResultSet tabla = null;
        String sSubCadena = username.substring(1);

        try {
            String strSQL = "SELECT K_IDFUNCIONARIO FROM S_FUNCIONARIO WHERE K_IDFUNCIONARIO='" + sSubCadena + "'";
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt;
            prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            tabla = prepStmt.getResultSet();
            while (tabla.next()) {
                error = tabla.getString(1);
            }
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();

        } catch (SQLException ex) {
            error = "Funcionario DAO " + "Consultar Id Funcionario " + ex.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();

        }

        //   System.out.println(error);
        return error;
    }
}
