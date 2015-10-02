<%-- 
    Document   : menu
    Created on : 23/03/2015, 09:02:16 AM
    Author     : 
--%>

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
                <li><a class="logout" href="../../index.jsp">Cerrar Sesión</a></li>
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
                <h5 class="centered">Hola, <%out.print(session.getAttribute("USUARIO"));%></h5>


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
                        <span>Ver Solicitud</span>
                    </a>

                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>

</html>