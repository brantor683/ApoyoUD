<%-- 
    Document   : descargarLista
    Created on : 2/12/2015, 05:39:04 PM
    Author     : Brandon
--%>

<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Negocio.Convocatoria"%>
<%@page import="java.io.FileInputStream"%>
<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import= "java.io.*" %>
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

            <%@ include file="menu.jsp" %> 

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

                                        user.setUser((String) session.getAttribute("USUARIO"));
                                        user.setPasswd((String) session.getAttribute("CONT"));

                                        Convocatoria convocatoria = new Convocatoria();
                                        ConvocatoriaDAO ConvDAO = new ConvocatoriaDAO();

                                        convocatoria = ConvDAO.buscarFListado("Actual", user);
                                        if (convocatoria.getF_listado() != null) {
%><center><h2>La lista ha sido descargada</h2> </center>
<%
                                            String filename = "Beneficiarios_ApoyoUD.pdf";

                                            response.setContentType("application/pdf");
                                            response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

                                            FileInputStream fileInputStream = new FileInputStream("C:/MIDIRECTORIO/Beneficiarios_ApoyoUD.pdf");

                                            int i;
                                            while ((i = fileInputStream.read()) != -1) {
                                                out.write(i);
                                            }
                                            fileInputStream.close();
                                   } else {%>
                                    <center><h2>No se encuentra disponible el archivo del listado</h2></center>

    <%}%>
    <center>   <button class="btn btn-link" type="button"><a href="MenuFuncionario.jsp">Volver</a></button></center>
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

