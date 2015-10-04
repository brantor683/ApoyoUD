<%-- 
    Document   : menu
    Created on : 23/03/2015, 09:02:16 AM
    Author     : 
--%>
<%@page import="Negocio.Usuario"%>
<%@page import="Negocio.Funcionario"%>
<%@page import="Datos.FuncionarioDAO"%>
<!DOCTYPE html>

<%       
    Usuario userFunc = new Usuario();
    userFunc.setUser((String) session.getAttribute("USUARIO"));
    userFunc.setPasswd((String) session.getAttribute("CONT"));
    
    Funcionario func = new Funcionario();
    FuncionarioDAO funcDAO = new FuncionarioDAO();
    func=funcDAO.buscarFuncionario(funcDAO.consultarIdFuncionario(userFunc.getUser(), userFunc),userFunc);
    
%>
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
        <a href="MenuFuncionario.jsp" class="logo"><b>Panel de Funcionarios</b></a>
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
                <p class="centered"><a href="MenuFuncionario.jsp"><img src="assets/img/fr-02.jpg" class="img-circle" width="60"></a></p>              
                <h5 class="centered">Hola, <%out.print(func.getN_nomFuncionario());%></h5>


                <li class="sub-menu">
                    <a class="" href="convocatoria.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Convocatoria</span>
                    </a>
                </li>
                <li class="sub-menu">
                    <a class="" href="consultarsolicitudes.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Consultar</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="consultarsolicitudes.jsp">Consultar Información</a></li>
                        <li><a  href="consultarsolicitudes.jsp">Consultar Solicitudes</a></li>                       
                    </ul>
                </li>
                <li class="sub-menu">
                    <a class="" href="convocatoria.jsp" >
                        <i class="fa fa-tasks"></i>
                        <span>Asignar</span>
                    </a>
                    <ul class="sub">
                        <li><a  href="convocatoria.jsp">Asignar Puntaje</a></li>
                        <li><a  href="convocatoria.jsp">Asignar Actividad</a></li>
                    </ul>

                </li>

            </ul>
            <!-- sidebar menu end-->
        </div>
    </aside>

</html>