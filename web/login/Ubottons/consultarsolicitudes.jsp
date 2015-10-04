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
    
    
    String filtroF = request.getParameter("FiltroSolicitudF");
    if (filtroF == null) {
        filtroF = "Todos";
    } else {
        filtroF = request.getParameter("FiltroSolicitudF");
    }
    
    String filtroPC = request.getParameter("FiltroSolicitudPC");
    if (filtroPC == null) {
        filtroPC = "Todos";
    } else {
        filtroPC = request.getParameter("FiltroSolicitudPC");
    }


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
                    <h3><i class="fa fa-angle-right"></i>Ver Socilitudes</h3>
                    <br>
                    Selecciona como quiere filtrar la solicitud
                    <!-- BASIC FORM ELELEMNTS -->
                    <form class="form-group" action="consultarsolicitudes.jsp">
                        <table class="table-responsive">
                            <td>
                        <div class="row mt">
                            <div class="col-lg-11">
                                <label >Filtrar por Facultad</label>
                                <select  name="FiltroSolicitudF"  id="FiltroSolicitud" class="form-control">
                                    <option value="Todos">Todos</option>
                                    <option value="Ingenieria">Ingenieria</option>
                                    <option value="Ciencias y Educacion">Ciencia de la Educacion</option>
                                    <option value="Artes">ASAB</option>		                         
                                    <option value="Medio Ambiente">Vivero</option>
                                    <option value="Tecnologica">Tecnológica</option> 
                                </select>
                               
                            </div><!-- col-lg-12-->
                        </div>
                            </td>
                            <td>
                        <div class="row mt">
                            <div class="col-lg-11">
                                <label >Filtrar por Proyecto Curricular</label>
                                <select  name="FiltroSolicitudPC"  id="FiltroSolicitud" class="form-control">
                                    <option value="Todos">Todos</option> 
                                    <option value="Ingenieria de sistemas">Ingenieria de Sistemas</option>
                                    <option value="Ingenieria Catastral">Ingeniería Catastral</option>
                                    <option value="Ingenieria Industrial">Ingenieria Industrial</option>		                         
                                    <option value="Ingenieria Electronica">Ingenieria Electrónica</option>
                                    <option value="Ingenieria Electrica">Ingenieria Electrica</option>

                                    <option value="Administracion Deportiva">Administración Deportiva</option>
                                    <option value="Administracion Ambiental">Administración Ambiental</option>
                                    <option value="Ingenieria Ambiental">Ingenieria Ambiental</option>
                                    <option value="Ingenieria Forestal">Ingenieria Forestal</option>
                                    <option value="Ingenieria Sanitaria">Ingenieria Sanitaria</option>
                                    <option value="Ingenieria Topografica">Ingenieria Topografica</option>
                                    
                                    <option value="Arte Danzario">Arte Danzario</option>		                         
                                    <option value="Artes Escénicas">Artes Escénicas</option>
                                    <option value="Artes Musicales">Artes Musicales</option>
                                    <option value="Artes Plasticas y Visuales">Artes Plásticas y visuales</option>
                                    
                                    <option value="Tecnologia Industrial">Tecnología Industrial</option>
                                    <option value="Tecnologia Electrónica">Ingenieria Mecanica</option>
                                    <option value="Tecnologia en Contrucciones Civiles">Ingenieria Mecanica</option>
                                    <option value="Tecnologia en Electricidad">Tecnologia en Electricidad</option>
                                    <option value="Tecnologia Mecanica">Tecnologia  Mecanica</option>
                                    <option value="Tecnologia en Sistematizacion de Datos">Tecnologia en Sistematizacion de Datos</option>
                                    
                                    <option value="Licenciatura en Biología">Licenciatura en Biología</option>		                         
                                    <option value="Licenciatura en Ciencias Sociales">Licenciatura en Educación Básica con Enfasis en Ciencias Sociales</option>
                                    <option value="Licenciatura en Artistica">Licenciatura en Educación Básica con Enfasis en Artistica</option>
                                    <option value="Licenciatura en Humanidades">Licenciatura en Educación Básica con Enfasis en Humanidades y Lengua Castellana</option>		                         
                                    <option value="Licenciatura en Ingles">Licenciatura en Educación Básica con Enfasis en Inglés</option>
                                    <option value="Licenciatura en Matematica">Licenciatura en Educación Básica con Enfasis en Matemática</option> 
                                    <option value="Licenciatura en Fisica">Licenciatura en Fisica</option>		                         
                                    <option value="Licenciatura en Pedagogia Infantil">Licenciatura en Pedagogia Infantil</option>
                                    <option value="Licenciatura en Quimica">Licenciatura en Quimica</option> 
                                     <option value="Matematicas">Matemáticas</option> 
                                   
                                    
                                </select>
                            </div><!-- col-lg-12-->
 
                        </div><!-- /row -->
                        
                        </td>
                        <td><br>
                            <br>
                            <br>
                            <button type="submit" href="#" class="btn btn-round"  ><a>Consultar</a></button>
                        </td>
                        </table>
                    </form>
                    <div class="container" aling="center">
                        <table class="table-responsive">
                            <%                         //request.getParameter("privilegio")
                                SolicitudDAO solicitud = new SolicitudDAO();
                                out.println("<tr>");
                                out.print("<td>" + solicitud.buscarSolicitudFuncionario(filtroF, filtroPC, user) + "</td>");
                                out.println("</tr>");
                            %>
                        </table></div>

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


        <script>
            //custom select box

            $(function() {
                $('select.styled').customSelect();
            });

        </script>

    </body>
</html>