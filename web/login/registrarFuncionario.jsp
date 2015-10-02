<%-- 
    Document   : registrarUsuario
    Created on : 27/09/2015, 11:38:37 AM
    Author     : Brandon
--%>

<%@page import="Negocio.Funcionario"%>
<%@page import="Datos.FuncionarioDAO"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="Negocio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>

<%if (request.getParameter("fruser") != null && request.getParameter("frpass") != null) {
      session.setAttribute("USUARIO", request.getParameter("fruser"));
      session.setAttribute("CONT", request.getParameter("frpass"));
    }
    Usuario user = new Usuario();
    Usuario user2 = new Usuario();

    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));

    user2.setUser("APOYOUD");
    user2.setPasswd("APOYOUD");

    FuncionarioDAO funci = new FuncionarioDAO();
    UsuarioDAO us = new UsuarioDAO();
    Funcionario funciUser = new Funcionario();
    funciUser = funci.buscarFuncionario(user.getUser(), user2);
    out.print(funci.buscarFuncionario(user.getUser(), user2).getK_idFuncionario());

    if (funciUser.getK_idFuncionario() == Integer.valueOf(user.getUser())) {
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>");
        out.print("<td>" + "crear usuario" + us.crearUsuarioFuncionario(user2, user) + "</td>");
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>" + us.asignarConnectFuncionario(user.getUser(), user2) + "</td>");
        out.print("<td>" + "SI SE PUEDE REGISTRAR" + "</td>" + us.asignarRolFuncionario(user.getUser(), user2) + "</td>");
    } else {
        out.println("NO SE PUEDE REGISTRAR");
        out.println(funciUser.getK_idFuncionario()+ "+" +Integer.valueOf(user.getUser()));
    }
    out.println("</tr>");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>


