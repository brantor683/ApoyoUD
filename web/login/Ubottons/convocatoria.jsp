<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Negocio.Convocatoria"%>
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
                    <h3><i class="fa fa-angle-right"></i>Abrir Convocatoria Apoyo Alimentario</h3>
                    <br>
                    <form  action="abrirconvocatoria.jsp" method="post" >
                    <!-- BASIC FORM ELELEMNTS -->

                    <div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">Periodo Convocatoria:</label>
                        <div class="col-sm-5">
                            <select   name="periodoConvocatoria"  id="periodoConvocatoria" class="form-control">
                                <option value="1">Primer semestre</option>
                                <option value="3">Segundo semestre</option>
                            </select>

                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">Cupos Categoria A:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="cuposConvocatoriaA" value="0" id="cuposConvocatoriaA">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">Cupos Categoria B:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="cuposConvocatoriaB" value="0" id="cuposConvocatoriaB">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label class="col-sm-2 col-sm-2 control-label">Cupos Categoria C:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="cuposConvocatoriaC" value="0" id="cuposConvocatoriaC">
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label   class="col-sm-3 col-sm-3" for="CedulaInput">Fecha de Inicio:</label>
                        <input style="width:200px;height:25px" type="date" class="form-control"  name="fInicioConvocatoria"  id="fInicioConvocatoria"><br>
                    </div>
                    <br>
                    <br>
                    <div class="form-group">
                        <label   class="col-sm-3 col-sm-3" for="CedulaInput">Fecha de Fin Convocatoria:</label>
                        <input style="width:200px;height:25px" type="date" data-date-format="DD MMMM YYYY" class="form-control" name="fFinConvocatoria"  id="fFinConvocatoria"><br>
                    </div>
                    <br>
                    <br>

                    <button type="submit"  class="btn btn-round btn-success"  >Abrir Convocatoria</button>

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