<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<%@page import="Negocio.Usuario"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    if (request.getParameter("fluser") != null && request.getParameter("flpass") != null) {
        session.setAttribute("USUARIO", "f"+request.getParameter("fluser"));
        session.setAttribute("CONT", request.getParameter("flpass"));
    }
    Usuario user = new Usuario();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    UsuarioDAO u = new UsuarioDAO();
  
   %>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Panel de Funcionarios</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>

    </head>

    <body>

        <section id="container" >

            <!-- **********************************************************************************************************************************************************
             MAIN SIDEBAR MENU
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
                            <center><h3>BIENVENIDO AL PANEL DE FUNCIONARIOS</h3></center> 
                            	
                               <div class="row mt">
                                <!--CUSTOM CHART START -->
                                <div class="border-head">
                                    
                                    <br><div class="imagenesInicio"><IMG SRC="images/ud.png" align="center"></div>
                                  
                                </div><!-- /border-head -->	
                                
                            </div><!-- /row -->	

                        </div><!-- /col-lg-9 END SECTION MIDDLE -->


                        <!-- **********************************************************************************************************************************************************
                        RIGHT SIDEBAR CONTENT
                        *********************************************************************************************************************************************************** -->                  

                        <div class="col-lg-3 ds">
                           
                            <!-- CALENDAR-->
                            <div id="calendar" class="mb">
                                <div class="panel green-panel no-margin">
                                    <div class="panel-body">
                                        <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                                            <div class="arrow"></div>
                                            <h3 class="popover-title" style="disadding: none;"></h3>
                                            <div id="date-popover-content" class="popover-content"></div>
                                        </div>
                                        <div id="my-calendar"></div>
                                    </div>
                                </div>
                            </div><!-- / calendar -->

                        </div><!-- /col-lg-3 -->
                    </div><!--/row -->
                </section>
            </section>

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015- Apoyo Alimentario Universidad Distrital
                    <a href="index.html#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jquery-1.8.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="assets/js/jquery.sparkline.js"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <script type="text/javascript" src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

        <!--script for this page-->
        <script src="assets/js/sparkline-chart.js"></script>    
        <script src="assets/js/zabuto_calendar.js"></script>	
        <script type="application/javascript">
            $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
            $(this).hide();
            });

            $("#my-calendar").zabuto_calendar({
            action: function () {
            return myDateFunction(this.id, false);
            },
            action_nav: function () {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [
            {type: "text", label: "Special event", badge: "00"},
            {type: "block", label: "Regular event", }
            ]
            });
            });


            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }
        </script>


    </body>
</html>