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

                us.crearUsuarioFuncionario(user2, user);
                us.asignarConnectFuncionario(user.getUser(), user2);
                us.asignarRolFuncionario(user.getUser(), user2);


        %>
    <center><h3>Se registró correctamente, ya puedes iniciar sesión </h3>
        <button class="bg-success" type="submit" ><a href="Ubottons/funcionario.jsp">Regresar</a></button></center>

    <%} else {%>
    <center><h3>No se puede registrar</h3>
        <button class="bg-success" type="submit" ><a href="Ubottons/funcionario.jsp">Regresar</a></button></center>

    <%}%>


</body>
</html>


