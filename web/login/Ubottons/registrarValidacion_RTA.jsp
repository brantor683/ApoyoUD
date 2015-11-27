<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>

<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Negocio.Convocatoria"%>
<%@page import="Negocio.Socioeconomico"%>
<%@page import="Datos.SocioeconomicoDAO"%>
<%@page import="Util.Directorio"%>
<%@page import="Datos.SolicitudDAO"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>

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

                    <div class="row">
                        <div class="col-lg-9 main-chart">                         
                            <div class="row mt">
                                <!--CUSTOM CHART START -->
                                <div class="border-head">
                                    <%
                                      Usuario user = new Usuario();
                                        Solicitud solicitud = new Solicitud();
                                       String estVal1="";
                                       String estVal2="";
                                       String estVal3="";
                                       String estVal4="";
                                       
                                       
                                       int idSolicitud=0;
                                       int idSoc1=0;
                                       int idSoc2=0;
                                       int idSoc3=0;
                                       int idSoc4=0;
                                       
                                       
                                        user.setUser((String) session.getAttribute("USUARIO"));
                                        user.setPasswd((String) session.getAttribute("CONT"));
                                      
                                        String aux = user.getUser().substring(1);
                                        int idFuncionario = Integer.valueOf(aux);
                                        
                                     idSolicitud =Integer.valueOf(request.getParameter("idSolicitud"));
                                     idSoc1 =Integer.valueOf(request.getParameter("idSoc1"));
                                     idSoc2 =Integer.valueOf(request.getParameter("idSoc2"));
                                     idSoc3 =Integer.valueOf(request.getParameter("idSoc3"));
                                     idSoc4 =Integer.valueOf(request.getParameter("idSoc4"));
                                     
                                     
                                     estVal1 = request.getParameter("valIngresosfamiliares");
                                     estVal2 = request.getParameter("valCondicionesFamiliares");
                                     estVal3 = request.getParameter("valProcedencia");
                                     estVal4 = request.getParameter("valCondicionesSalud");   
                                
                                     SocioeconomicoDAO socioDAO = new SocioeconomicoDAO();
                                     SolicitudDAO solicitudDAO = new SolicitudDAO();
                                     
                                     socioDAO.validarCondicion(idSoc1, idSolicitud, estVal1, user);
                                     socioDAO.validarCondicion(idSoc2, idSolicitud, estVal2, user);
                                     socioDAO.validarCondicion(idSoc3, idSolicitud, estVal3, user);
                                     socioDAO.validarCondicion(idSoc4, idSolicitud, estVal4, user);
                                     
                                     solicitudDAO.validarSolicitud(idSolicitud, idFuncionario, user);
                                     
                                     
                                    %>
                                    <center><h2>La validación ha sido registrada automaticamente</h2> 
                                        <button class="btn btn-link" type="button"><a href="MenuFuncionario.jsp">Volver</a></button></center>


                                </div><!-- /border-head -->	
                            </div><!-- /row -->	
                        </div><!-- /col-lg-9 END SECTION MIDDLE -->
                    </div><!--/row -->
                </section>
            </section>


            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 - Apoyo Alimentario Universidad Distrital
                    <a href="form_component.html#" class="go-top">
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


        <script>
            //custom select box

            $(function() {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>

