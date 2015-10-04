<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Negocio.Convocatoria"%>
<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Solicitud"%>
<%@page import="Datos.SolicitudDAO"%>
<%@page import="java.sql.*"%>
<%@page import="java.lang.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Usuario user = new Usuario();
    UsuarioDAO u = new UsuarioDAO();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    String periodo="";
    String ano="";
    String codConvocatoria="";
    String fechaInicio, fInicio="";
    String fechaFin, fFin="";
    Convocatoria nConvocatoria = new Convocatoria();
    ConvocatoriaDAO nConvDAO = new ConvocatoriaDAO();

 
  
      
    fechaInicio = request.getParameter("fInicioConvocatoria");
    fInicio = fechaInicio.substring(8)+'/'+fechaInicio.substring(5,7)+'/'+fechaInicio.substring(0,4);
     nConvocatoria.setF_inicioConvocatoria(fInicio);
   int mes= Integer.valueOf(fechaInicio.substring(5,7));
    if(mes >=0 && mes <= 6){
    periodo="1";}else{
        periodo="3";
    }
    nConvocatoria.setPeriodo(Integer.valueOf(periodo));
     
    ano=fechaInicio.substring(0,4);
         nConvocatoria.setD_anoConvocatoria(Integer.valueOf(ano));
         
      fechaFin = request.getParameter("fFinConvocatoria");
    fFin = fechaFin.substring(8)+'/'+fechaFin.substring(5,7)+'/'+fechaFin.substring(0,4);
     
    nConvocatoria.setF_finConvocatoria(fFin);
        
    codConvocatoria = ano+periodo;
     nConvocatoria.setK_convocatoria(Integer.valueOf(codConvocatoria));
      nConvocatoria.setD_cuposCategoriaA(Integer.valueOf(request.getParameter("cuposConvocatoriaA")));
      nConvocatoria.setD_cuposCategoriaB(Integer.valueOf(request.getParameter("cuposConvocatoriaB")));
      nConvocatoria.setD_cuposCategoriaC(Integer.valueOf(request.getParameter("cuposConvocatoriaC")));
      

    nConvDAO.registarConvocatoria(nConvocatoria, user);  
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
                    <h3><i class="fa fa-angle-right"></i>Se abrio la Convocatoria Correctamente</h3>

                    <br>



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
        <script type="text/javascript" src="bootstrap-datepicker.de.js" charset="UTF-8"></script>

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



    </body>
</html>