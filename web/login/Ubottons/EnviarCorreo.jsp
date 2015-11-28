<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
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
 %>


<!DOCTYPE html>
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
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <h3><i class="fa fa-angle-right"></i>INICIA SESIÓN</h3>
                    <br>
                    Inicia sesión con tu cuenta de Gmail para enviar los correos a las personas beneficiadas del programa apoyo Alimentario
                    <!-- BASIC FORM ELELEMNTS -->
                    <form class="form-group" action="EnviarCorreo.jsp">
                        <table class="table-condensed">
                            <td>
                        <div class="row mt">
                            <div class="col-lg-10">
                                <label ></label>
                              
                            </div><!-- col-lg-12-->
                        </div>
                            </td>
                            <td>
                        <div class="row mt">
                            <div class="col-lg-11">
                                <label >Prueba</label>
                                <form action="EnviarCorreoRTA.jsp" method="post">
                                        <div class="form-group">
                                            <label for="CedulaInput">Cuenta</label>
                                            <input name="cuenta" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Contraseña</label>
                                            <input name="pass" style="width:200px;height:25px" type="password" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Para:</label>
                                            <input name="to" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Asunto</label>
                                            <input name="subjet" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                            
                                            <label for="CedulaInput">Mensaje</label>
                                            <input name="msg" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                             
                                            <label for="CedulaInput">Adjunto</label>
                                            <input name="archivo" style="width:500px;height:35px" type="file" class="form-control" id="cedulaInput"><br><br>
                                
                                            <div align="left"><button class="btn btn-success">Enviar</button></div>
                                        </div>
                                    </form>
                                
                            </div><!-- col-lg-12-->

                        </div><!-- /row -->
                        </td>
                        </table>
                    </form>
                
                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 
                    <a href="MenuFuncionario.jsp#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

        <!--custom switch-->
        <script src="assets/js/bootstrap-switch.js"></script>

        <!--custom tagsinput-->
        <script src="assets/js/jquery.tagsinput.js"></script>

        <!--custom checkbox & radio-->

        <script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="assets/js/form-component.js"></script>   
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
      


        <script>
            //custom select box
            $(function() {
                $('select.styled').customSelect();
            });
        </script>

    </body>
</html>

       
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

                 


                    <!-- main 
                    <div class="column col-sm-9" id="main">
                        <div class="padding">

                            <div class="full col-sm-9">-->

                                <!--/Registrar aportes-
                                <div class="col-sm-10" id="Registrarapor">  
                                    <div class="page-header text-muted divider">
                                        Iniciar Sesión Correo Electrónico
                                    </div>
                                    <form action="EnviarCorreoRTA.jsp" method="post">
                                        <div class="form-group">
                                            <label for="CedulaInput">Cuenta</label>
                                            <input name="cuenta" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Contraseña</label>
                                            <input name="pass" style="width:200px;height:25px" type="password" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Para:</label>
                                            <input name="to" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                            
                                            <label for="CedulaInput">Asunto</label>
                                             <input name="subjet" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                            
                                            <label for="CedulaInput">Mensaje</label>
                                            <input name="msg" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                                             
                                            <label for="CedulaInput">Adjunto</label>
                                            <input name="archivo" style="width:500px;height:35px" type="file" class="form-control" id="cedulaInput"><br><br>
                                
                                            <div align="left"><button class="btn btn-success">Enviar</button></div>
                                        </div>
                                    </form>
                                </div>
                                <div class="row divider">  
                                </div>--><!-- /col-9 
                            </div>--><!-- /padding 
                        </div>-->
                        <!-- /main 

           
           script references 
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
    </body>
</html>-->s