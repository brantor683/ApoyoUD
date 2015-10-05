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
                                        Solicitud solicitud = new Solicitud();
                                        Solicitud solicitudValidar = new Solicitud();
                                        SolicitudDAO solicituddao = new SolicitudDAO();
                                        Socioeconomico socioeconomi = new Socioeconomico();
                                        SocioeconomicoDAO soli_sociDAO = new SocioeconomicoDAO();
                                        Convocatoria convActual = new Convocatoria();
                                        ConvocatoriaDAO convDAO = new ConvocatoriaDAO();

                                        user.setUser((String) session.getAttribute("USUARIO"));
                                        user.setPasswd((String) session.getAttribute("CONT"));

                                        convActual = convDAO.buscarConvocatoria("Activa", user);

                                        solicitud.setK_conv_convocatoria(convActual.getK_convocatoria());
                                        String codEstudiante = user.getUser().substring(1);
                                        solicitud.setK_est_codEstudiante(Integer.valueOf(codEstudiante));
                                        solicitudValidar = solicituddao.buscarSolicitudConvocatoria(codEstudiante, solicitud.getK_conv_convocatoria(), user);
                                        if (solicitudValidar.getK_est_codEstudiante() == Integer.valueOf(codEstudiante)) {
                                    %> 
                                    <center><h3>Ud ya tiene un solicitud registrada en esta convocatoria</h3> 
                                        <button class="btn btn-link" type="button"><a href="MenuInicial.jsp">Volver</a></button></center>


                                    <%
                                    } else {
                                        solicituddao.registrarSolicitud(solicitud, user);%>
                                         <center><h3>Se registró correctamente</h3> 
                                        <button class="btn btn-link" type="button"><a href="MenuInicial.jsp">Volver</a></button></center>

                                        
                                     



                                    <%    boolean isMultipart = ServletFileUpload.isMultipartContent(request);

                                            if (!isMultipart) {
                                            } else {

                                                Directorio dir = new Directorio();
                                                String directorio = "";
                                                String directorioFinal = "";

                                                FileItemFactory factory = new DiskFileItemFactory();
                                                ServletFileUpload upload = new ServletFileUpload(factory);
                                                List items = null;
                                                try {
                                                    items = upload.parseRequest(request);
                                                } catch (FileUploadException e) {
                                                    e.printStackTrace();
                                                }
                                                Iterator itr = items.iterator();
                                                while (itr.hasNext()) {
                                                    String name = "";

                                                    FileItem item = (FileItem) itr.next();
                                                    if (item.isFormField()) {

                                                        name = item.getFieldName();

                                                        String valor = item.getString();
                                                        directorioFinal = "C:/DatosAPOYO/" + user.getUser() + "/" + name + "/";
                                                        dir.generarDirectorio(directorio);

                                                        socioeconomi.setK_soc_socioeconomica(Integer.parseInt(valor));

                                                    } else {

                                                        try {

                                                            String itemName = item.getName();

                                                            directorioFinal = "C:/DatosAPOYO/" + user.getUser() + "/" + name + "/" + itemName;

                                                            File savedFile = new File(directorioFinal);
                                                            item.write(savedFile);

                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }
                                                    }

                                                    socioeconomi.setD_soporte(directorioFinal);
                                                    soli_sociDAO.registrarSocioeconomica(socioeconomi, user);
                                                }
                                            }
                                        }
                                    %>
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

