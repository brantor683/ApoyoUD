<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="Negocio.Email"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Solicitud"%>
<%@page import="Datos.SolicitudDAO"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario user = new Usuario();
    UsuarioDAO u = new UsuarioDAO();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    
     Email email = new Email();
    email.setUsername(request.getParameter("cuenta"));
    email.setPassWord(request.getParameter("pass"));
 %>



<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Registrar Socio</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--[if lt IE 9]>
                <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="css/styles1.css" rel="stylesheet">
    </head>
    <body>


        <div class="wrapper">
            <div class="box">
                <div class="row">

                    <!-- sidebar -->
                    <div class="column col-sm-3 sidebar-offcanvas" id="sidebar">
                        <h3><%out.print(user.getUser());//out.print(session.getAttribute("USUARIO"));%></h3>
                        <ul class="nav">

                            <li class="active"><a href="RegistrarCredito.jsp"><h4>Registrar Credito</h4></a>
                            </li>
                            <li class="active">
                            </li>
                        </ul>

                        <div id="cerrar" align="center"><a class="btn btn-primary" href="../../index.jsp" role="button">Cerrar Sesion</a>
                            <a class="btn btn-primary" href="MenuFuncionario.jsp" role="button">Volver</a>
                        </div>
                    </div>
                    <!-- /sidebar -->

                    <!-- main -->
                    <div class="column col-sm-9" id="main">
                        <div class="padding">

                            <div class="full col-sm-9">

                                <!--/Registrar Credito-->
                                <div class="col-sm-10" id="Registrarapor">  
                                    <div class="page-header text-muted divider">
                                        Registrar Credito Socios
                                    </div>
                                    <form method="post">
                                        <div class="form-group">
                                            <%email.setTo(request.getParameter("to"));
                                                email.setSubject(request.getParameter("subjet"));
                                                email.setMensage(request.getParameter("msg"));
                                                out.print(email.SendMail3(request.getParameter("archivo")));
                                            %>
                                            <br><div align="left"><a class="btn btn-success" href="MenuFuncionario.jsp" role="button">Aceptar</a></div>
                                        </div>
                                    </form>
                                </div>
                                <div class="row divider">  
                                </div><!-- /col-9 -->
                            </div><!-- /padding -->
                        </div>
                        <!-- /main -->

                    </div>
                </div>
            </div>







            <!-- script references -->
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>