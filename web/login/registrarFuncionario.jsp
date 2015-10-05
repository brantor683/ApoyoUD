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
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Panel de Usuario</title>

        <!-- Bootstrap core CSS -->
        <link href="Ubottons/assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="Ubottons/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="Ubottons/assets/css/style.css" rel="stylesheet">
        <link href="Ubottons/assets/css/style-responsive.css" rel="stylesheet">
    </head>

    <body>

        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

        <div id="login-page">
            <center><label class="portalfuncionario">BIENVENIDO AL PORTAL DE FUNCIONARIOS</label></center>
            <div class="container">

                <table class="table">
                    <td>
                        <form class="form-login" action="registrarFuncionario.jsp" method="post">
                            <h2 class="form-login-heading">Registrese Aquí</h2>
                            <div class="login-wrap">
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
                                   // out.print(funci.buscarFuncionario(user.getUser(), user2).getK_idFuncionario());

                                    if (funciUser.getK_idFuncionario() == Integer.valueOf(user.getUser())) {

                                        us.crearUsuarioFuncionario(user2, user);
                                        us.asignarConnectFuncionario(user.getUser(), user2);
                                        us.asignarRolFuncionario(user.getUser(), user2);

                                %>
                                <center><h5>Se registró correctamente, ya puedes iniciar sesión </h5></center>
                                 <!--   <button class="bg-success" type="submit" ><a href="Ubottons/funcionario.jsp">Regresar</a></button></center>
-->
                                <%} else {%>
                                <center><h5>No se puede registrar</h5></center>
                                   <!-- <button class="bg-success" type="submit" ><a href="Ubottons/funcionario.jsp">Regresar</a></button></center>
-->
                                <%}%>

                                <input type="text" class="form-control"  name="fruser"   autofocus>
                                <br>
                                <input type="password" class="form-control"  name="frpass" >
                                <label class="checkbox">
                                    <span class="pull-right">
                                        <a data-toggle="modal" href="#myModal"> Olvidaste La Contraseña?</a>

                                    </span>
                                </label>
                                <button class="btn btn-theme btn-block" href="#" type="submit"><i class="fa fa-lock"></i>Registrarse</button>
                            </div>

                            <!-- Modal -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Olvidaste tu Contraseña?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Digite su email.</p>
                                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                                        </div>
                                        <div class="modal-footer">
                                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                            <button class="btn btn-theme" type="button">Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- modal -->

                        </form>
                    </td>
                    <td>   	  	
                        <form class="form-login" action="Ubottons/MenuFuncionario.jsp" method="post">

                            <h2 class="form-login-heading">Iniciar Sesion</h2>
                            <div class="login-wrap">
                                <input type="text" name="fluser" class="form-control" placeholder="Usuario" autofocus>
                                <br>
                                <input type="password" name="flpass" class="form-control" placeholder="Contraseña">
                                <label class="checkbox">
                                    <span class="pull-right">
                                        <a data-toggle="modal" href="#myModal"> Olvidaste La Contraseña?</a>

                                    </span>
                                </label>
                                <button class="btn btn-theme btn-block" href="#" type="submit"><i class="fa fa-lock"></i>Iniciar Sesión</button>
                            </div>

                            <!-- Modal -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Olvidaste tu Contraseña?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Digite su email.</p>
                                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                                        </div>
                                        <div class="modal-footer">
                                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                            <button class="btn btn-theme" type="button">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- modal -->

                        </form>
                    </td>
                </table>
            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("images/body1.jpg", {speed: 500});
        </script>


    </body>
</html>

