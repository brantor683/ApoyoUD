/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import Negocio.Estudiante;
import Negocio.Usuario;
import Util.RHException;
import Util.ServiceLocator;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {

    public UsuarioDAO() {

    }

    public String ingresar(Usuario user) throws RHException {

        String strSQL = "SELECT user FROM dual";
        String sa = null;

        try {
            Connection conexion;
            conexion = new ServiceLocator(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            ResultSet tabla = null;
            tabla = prepStmt.executeQuery(strSQL);

            while (tabla.next()) {
                sa = tabla.getString(1);
            }
            prepStmt.close();
        } catch (SQLException ex) {
            sa = "Este es el error" + ex.getMessage();
        }

        return sa;
    }

    public String crearUsuarioFuncionario(Usuario userInicial, Usuario nuevoUsuario) {
        String error = null;

        try {
            String strSQL = "CREATE USER " + "f" + nuevoUsuario.getUser() + " IDENTIFIED BY " + nuevoUsuario.getPasswd() + " DEFAULT TABLESPACE USERAPOYOALIMENTARIODEF TEMPORARY TABLESPACE USERAPOYOALIMENTARIOTEMP";
            Connection conexion = ServiceLocator.getInstance(userInicial).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(userInicial).commit();
            error = "Usuario Registrado: " + nuevoUsuario.getUser();

        } catch (SQLException e) {

            error = "Usuario_DAO_Funcionario " + " Crear USER " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(userInicial).liberarConexion();
        }
        return error;
    }

    public String crearUsuarioEstudiante(Usuario userInicial, Usuario nuevoUsuario) {
        String error = null;

        try {
            String strSQL = "CREATE USER " + "e" + nuevoUsuario.getUser() + " IDENTIFIED BY " + nuevoUsuario.getPasswd() + " DEFAULT TABLESPACE USERAPOYOALIMENTARIODEF TEMPORARY TABLESPACE USERAPOYOALIMENTARIOTEMP";
            Connection conexion = ServiceLocator.getInstance(userInicial).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(userInicial).commit();
            error = "Usuario Registrado: " + nuevoUsuario.getUser();

        } catch (SQLException e) {

            error = "Usuario_DAO " + " Crear USER " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(userInicial).liberarConexion();
        }
        return error;
    }
     public String asignarConnectFuncionario(String idFuncionario, Usuario user) {
        String error = null;

        try {
            String strSQL = "GRANT CONNECT TO " + "f" + idFuncionario;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            error = "Se puede CONECTAR";
        } catch (SQLException e) {
            // throw new RHException("Socio_DAO", "No pudo crear el USER" + e.getMessage());
            error = "Usuario_DAO " + "Asignar CONNECT " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        //  System.out.println(error);
        return error;
    }
    public String asignarConnect(String idEstudiante, Usuario user) {
        String error = null;

        try {
            String strSQL = "GRANT CONNECT TO " + "e" + idEstudiante;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            error = "Se puede CONECTAR";
        } catch (SQLException e) {
            // throw new RHException("Socio_DAO", "No pudo crear el USER" + e.getMessage());
            error = "Usuario_DAO " + "Asignar CONNECT " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        //  System.out.println(error);
        return error;
    }

    
    public String asignarRolEstudiante(String idEstudiante, Usuario user) {
        String error = null;

        try {
            String strSQL = "GRANT ROL_ESTUDIANTE TO " + "e" + idEstudiante;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            error = "¡ asignado rol estudiante " + idEstudiante + " !";
        } catch (SQLException e) {
            // throw new RHException("Socio_DAO", "No pudo crear el USER" + e.getMessage());
            error = "Usuario_DAO " + "Asignar ROLE " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        // System.out.println(error);
        return error;
    }
    
    

    public String asignarRolFuncionario(String idFuncionario, Usuario user) {
        String error = null;

        try {
            String strSQL = "GRANT ROL_FUNCIONARIO TO " + "f" + idFuncionario;
            Connection conexion = ServiceLocator.getInstance(user).tomarConexion();
            PreparedStatement prepStmt = conexion.prepareStatement(strSQL);
            prepStmt.executeUpdate();
            prepStmt.close();
            ServiceLocator.getInstance(user).commit();
            error = "¡ asignado rol funcionario " + idFuncionario + " !";
        } catch (SQLException e) {
            // throw new RHException("Socio_DAO", "No pudo crear el USER" + e.getMessage());
            error = "Usuario_DAO_Funcionario " + "Asignar ROLE " + e.getMessage();
        } finally {
            ServiceLocator.getInstance(user).liberarConexion();
        }
        // System.out.println(error);
        return error;
    }

}
