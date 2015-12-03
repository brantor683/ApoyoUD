<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="Negocio.Email"%>
<%@page import="Datos.BeneficiarioDAO"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Solicitud"%>
<%@page import="Datos.SolicitudDAO"%>
<%@page import="java.sql.*"%>
<%    Usuario user1 = new Usuario();
    user1.setUser((String) session.getAttribute("USUARIO"));
    user1.setPasswd((String) session.getAttribute("CONT"));

    Email email = new Email();
    email.setUsername(request.getParameter("cuenta"));
    email.setPassWord(request.getParameter("pass"));

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta name="description" content="">
            <meta name="author" content="Dashboard">
            <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

            <title>Panel Apoyo Alimentario</title>

            <!-- Bootstrap core CSS -->
            <link href="assets/css/bootstrap.css" rel="stylesheet">
            <!--external css-->
            <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
            <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
            <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />

            <!-- Custom styles for this template -->
            <link href="assets/css/style.css" rel="stylesheet">
            <link href="assets/css/style-responsive.css" rel="stylesheet">

            <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
            <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
              <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
        </head>
        <body>

            <section id="container" >
                <!-- **********************************************************************************************************************************************************
                TOP BAR CONTENT & NOTIFICATIONS
                *********************************************************************************************************************************************************** -->

                <%@ include file="menuFuncionarios.jsp" %>  
                <!-- **********************************************************************************************************************************************************
                MAIN CONTENT
                *********************************************************************************************************************************************************** -->
                <section id="main-content">
                    <section class="wrapper">

                        <div class="wrapper">
                            <div class="box">
                                <div class="row">
                                    <!-- main -->
                                    <div class="column col-sm-9" id="main">
                                        <div class="padding">

                                            <div class="full col-sm-9">

                                                <!--/Registrar Credito-->
                                                <div class="col-sm-10" id="Registrarapor">  
                                                    <div class="page-header text-muted divider">
                                                        Envio de notificación de Admitidos
                                                    </div>
                                                    <form method="post">
                                                        <div class="form-group">
                                                            <%email.setTo(request.getParameter("to"));
                                                                email.setSubject(request.getParameter("subjet"));
                                                                email.setMensage(request.getParameter("msg"));
                                                                out.print(email.SendMail());
                                                             //   out.print(email.SendMail3(request.getParameter("archivo")));
                                                            %>

                                                            <br><div align="left"><a class="btn btn-success" href="MenuFuncionario.jsp" role="button">Volver</a></div>
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
                        </div>
                    </section>
                </section>
            </section>







            <!-- script references -->
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
        </body>
    </html>