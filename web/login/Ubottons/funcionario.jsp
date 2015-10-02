<%-- 
    Document   : login
    Created on : 
    Author     : LORENA MANZANO
--%>

<%@page import="Negocio.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Panel de Usuario</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

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

        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

        <div id="login-page">
            <label class="portalfuncionario">BIENVENIDO AL PORTAL DE FUNCIONARIOS</label>
            <div class="container">
                
                <table class="table">
                    <td>
                        <form class="form-login" action="../../login/registrarFuncionario.jsp" method="post">

                            <h2 class="form-login-heading">Registrese Aquí</h2>
                            <div class="login-wrap">
                                <input type="text" class="form-control"  name="fruser"   autofocus>
                                <br>
                                <input type="password" class="form-control"  name="frpass" >
                                <label class="checkbox">
                                    <span class="pull-right">
                                        <a data-toggle="modal" href="login.jsp#myModal"> Olvidaste La Contraseña?</a>

                                    </span>
                                </label>
                                <button class="btn btn-theme btn-block" href="#" type="submit"><i class="fa fa-lock"></i>Registrarse</button>
                            </div>

                            <!-- Modal -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Olvidaste tu Contraseña?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Digite su email.</p>
                                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                                        </div>
                                        <div class="modal-footer">
                                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                            <button class="btn btn-theme" type="button">Enviar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- modal -->

                        </form>
                    </td>
                    <td>   	  	
                        <form class="form-login" action="login/Ubottons/MenuFuncionario.jsp" method="post">

                            <h2 class="form-login-heading">Iniciar Sesion</h2>
                            <div class="login-wrap">
                                <input type="text" class="form-control" placeholder="Usuario" autofocus>
                                <br>
                                <input type="password" class="form-control" placeholder="Contraseña">
                                <label class="checkbox">
                                    <span class="pull-right">
                                        <a data-toggle="modal" href="login.jsp#myModal"> Olvidaste La Contraseña?</a>

                                    </span>
                                </label>
                                <button class="btn btn-theme btn-block" href="MenuInicial.jsp" type="submit"><i class="fa fa-lock"></i>Iniciar Sesión</button>
                            </div>

                            <!-- Modal -->
                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title">Olvidaste tu Contraseña?</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p>Digite su email.</p>
                                            <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">

                                        </div>
                                        <div class="modal-footer">
                                            <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                            <button class="btn btn-theme" type="button">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- modal -->

                        </form>
                    </td>
                </table>
            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("assets/img/body1.jpg", {speed: 500});
        </script>


    </body>
</html>






