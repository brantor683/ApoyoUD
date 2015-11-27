<%-- 
    Document   : condicionesFamiliares.jsp
    Created on : 26/11/2015, 05:33:46 PM
    Author     : Brandon
--%>

<%@page import="Negocio.Socioeconomico"%>
<%@page import="Datos.SocioeconomicoDAO"%>
<%@page import="Negocio.Usuario"%>
<%@ page language="java" contentType="application/pdf; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import= "java.io.*" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@page import="java.io.FileInputStream"%>
<%@page import="Datos.UsuarioDAO"%>


<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>


<%
            Usuario user = new Usuario();
            UsuarioDAO u = new UsuarioDAO();
            SocioeconomicoDAO socioEcoDAO = new SocioeconomicoDAO();
            Socioeconomico soc = new Socioeconomico();
            user.setUser((String) session.getAttribute("USUARIO"));
            user.setPasswd((String) session.getAttribute("CONT"));
            int parametro = Integer.valueOf(request.getParameter("pam"));
            int idSolicitud = Integer.valueOf(request.getParameter("idSol"));

            soc = socioEcoDAO.buscarDocumento(parametro, idSolicitud, user);
            out.print(soc.getD_soporte());
            String nombreArchivo="";
            nombreArchivo=soc.getD_soporte().substring(54);
             out.print(nombreArchivo);
           //  out.print(codEstudiante+ "gf "+ idSol);
    //CODIGO JSP 
              FileInputStream ficheroInput = new FileInputStream(soc.getD_soporte());
            int tamanoInput = ficheroInput.available();
            byte[] datosPDF = new byte[tamanoInput];
            ficheroInput.read(datosPDF, 0, tamanoInput);

            response.setHeader("Content-disposition", "inline; filename="+nombreArchivo+"");
            response.setContentType("application/pdf");
            response.setContentLength(tamanoInput);
            response.getOutputStream().write(datosPDF);

            ficheroInput.close();

        %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Visor PDF</title>
</head>
<body>
 
</body>
</html>