<%-- 
    Document   : registrarUsuario
    Created on : 27/09/2015, 11:38:37 AM
    Author     : Brandon
--%>

<%@page import="Negocio.Estudiante"%>
<%@page import="Datos.EstudianteDAO"%>
<%@page import="Util.RHException"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Negocio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%if (request.getParameter("ruser") != null && request.getParameter("rpasswd") != null) {
        session.setAttribute("USUARIO", request.getParameter("ruser"));
        session.setAttribute("CONT", request.getParameter("rpasswd"));
    }
    Usuario user = new Usuario();
    Usuario user2 = new Usuario();

    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));

    user2.setUser("APOYOUD");
    user2.setPasswd("APOYOUD");

    EstudianteDAO estu = new EstudianteDAO();
    UsuarioDAO us = new UsuarioDAO();
    Estudiante estuser = new Estudiante();
    String codEstudiante = user.getUser();
    estuser = estu.buscarEstudiante(codEstudiante, user2);
    out.print(estu.buscarEstudiante(codEstudiante, user2).getK_codEstudiante());
    out.print(session.getAttribute("USUARIO"));
    out.print(session.getAttribute("CONT"));
    if (estuser.getK_codEstudiante() == Integer.valueOf(codEstudiante)) {
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>");
        out.print("<td>" + "crear usuario" + us.crearUsuarioEstudiante(user2, user) + "</td>");
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>" + us.asignarConnect(user.getUser(), user2) + "</td>");
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>" + us.asignarRolEstudiante(user.getUser(), user2) + "</td>");

    } else {

        out.println("NO SE PUEDE REGISTRAR");
    }
    out.println("</tr>");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VALIDAR</title>
    </head>
    <body>
        <%
            if (estuser.getK_codEstudiante() == Integer.valueOf(codEstudiante)) {
                %>
                <center><h3>Se registró correctamente, ya puedes iniciar sesión </h3>
                <button class="bg-success" type="submit" ><a href="../index.jsp#iniciosesion">Regresar</a></button></center>

            
   <% }

    else {

            out.println("NO SE PUEDE REGISTRAR");
             
            
   }%>
</body>
</html>
    