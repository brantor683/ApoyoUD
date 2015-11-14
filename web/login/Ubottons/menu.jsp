<%-- 
    Document   : menu
    Created on : 23/03/2015, 09:02:16 AM
    Author     : 
--%>

<%@page import="Datos.EstudianteDAO"%>
<%@page import="Negocio.Estudiante"%>
<%@page import="Negocio.Usuario"%>

<%
    Usuario userEstu = new Usuario();
    userEstu.setUser((String) session.getAttribute("USUARIO"));
    userEstu.setPasswd((String) session.getAttribute("CONT"));
    
    Estudiante estuMenu = new Estudiante();
    EstudianteDAO estuDAOMenu = new EstudianteDAO();
    estuMenu=estuDAOMenu.buscarEstudiante(estuDAOMenu.consultarIdEstudiante(userEstu.getUser(), userEstu),userEstu);
%>
<!DOCTYPE html>
<html lang="en">

    <!-- **********************************************************************************************************************************************************
               TOP BAR CONTENT & NOTIFICATIONS
               *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
        <div class="sidebar-toggle-box">
            <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Menu Apoyo Alimentario"></div>
        </div>
        <!--logo start-->
        <a href="MenuInicial.jsp" class="logo"><b>Panel Usuario</b></a>
        <!--logo end--> 
        <div class="top-menu">
            <ul class="nav pull-right top-menu">
                <li><a class="logout" href="../../index.jsp">Cerrar Sesión </a> </li>
            </ul>
        </div>
    </header>
    <!-- **********************************************************************************************************************************************************
   MAIN SIDEBAR MENU
   *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
        <div id="sidebar"  class="nav-collapse ">
            <!-- sidebar menu start-->
            <ul class="sidebar-menu" id="nav-accordion">
                <p class="centered"><a href="#"><img src="assets/img/fr-02.jpg" class="img-circle" width="60"></a></p>              
                <h5 class="centered">Hola, <%out.print(estuMenu.getN_nomEstudiante()+" "+estuMenu.getN_apeEstudiante());%></h5>


                <li class="sub-menu">
                    <a class="" href="registrarSolicitud.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Registrar Solicitud</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="" href="datospersonales.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Datos Personales</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="" href="versolicitud.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Ver Solicitud Actual</span>
                    </a>

                </li>

                 <li class="sub-menu">
                    <a class="" href="convocatoria.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Convocatoria</span>
                    </a>
                </li>
            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>

</html>