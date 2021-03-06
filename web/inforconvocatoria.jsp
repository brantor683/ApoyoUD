<%@page import="Negocio.Convocatoria"%>
<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Negocio.Usuario"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie ie6 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="en">
    <!--<![endif]-->
    <head>

        <meta charset="UTF-8"/>

        <title>Programa Apoyo Alimentario UD</title>

        <meta name="description" content="Onepage Multipurpose Bootstrap HTML Template">
        <meta name="author" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
        <link rel="stylesheet" type="text/css" media="screen" href="../css/bootstrap.css">
        <link rel="stylesheet" href="css/font-awesome.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/theme.css">
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>

    </head>
    <body>
        <!--wrapper start-->
        <div class="wrapper" id="wrapper">

            <!--header-->
            <header>
                <div class="banner row" id="banner">		
                    <div class="parallax text-center" style="background-image: url(http://wowthemes.net/demo/leroy/img/dummy1.jpg);">
                        <div class="parallax-pattern-overlay">
                            <div class="container text-center" style="height:580px;padding-top:170px;">
                                <a href="#"><img id="site-title" class=" wow fadeInDown" wow-data-delay="0.0s" wow-data-duration="0.9s" src="img/ud.png" alt="logo"/></a>
                                <h2 class="intro wow zoomIn" wow-data-delay="0.4s" wow-data-duration="0.9s">Programa Apoyo Alimentario</h2>
                            </div>
                        </div>
                    </div>
                </div>	
                <div class="menu">
                    <div class="navbar-wrapper">
                        <div class="container">
                            <div class="navwrapper">
                                <div class="navbar navbar-inverse navbar-static-top">
                                    <div class="container">
                                        <div class="navArea">
                                            <div class="navbar-collapse collapse">
                                                <ul class="nav navbar-nav">
                                                    <li class="menuItem active"><a href="#wrapper">Home</a></li>
                                                    <li class="menuItem"><a href="#aboutus">Acerca de Nosotros</a></li>
                                                    <li class="menuItem"><a href="#informacion">Informaci�n Convocatoria</a></li>
                                                    <li class="menuItem"><a href="#registrarse">Registrarse</a></li>
                                                    <li class="menuItem"><a href="#iniciosesion">Iniciar Sesi�n</a></li>                                                   
                                                    <li class="menuItem"><a href="login/Ubottons/funcionario.jsp">Portal Funcionarios</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>	
            </header>

            <!--about us-->
            <section class="aboutus" id="aboutus">
                <div class="container">
                    <div class="heading text-center">
                        <img class="dividerline" src="img/sep.png" alt="">
                        <h2>Acerca de Nosotros</h2>
                        <img class="dividerline" src="img/sep.png" alt="">
                        <h3>Dentro de la pol�tica de la secci�n de Bienestar Institucional, de la Universidad Distrital, Francisco Jos� de Caldas, se han implementado programas deportivos y otros para el mejoramiento de la calidad de vida de la comunidad universitaria, entre ellos el programa de Apoyo alimentario��.

                            La ejecuci�n de este programa que lleva varios semestres en ejecuci�n logrando una amplia cobertura de estudiantes, de diferentes carreras de la Universidad.

                            Actualmente la Universidad Distrital se encuentra realizando una nueva convocatoria para acceder a este programa, para el cual si usted es estudiante debe cumplir con algunos requisitos</h3>
                    </div>			
                    <div class="row">
                        <div class="col-md-6">
                            <div class="papers text-center">
                                <img src="http://wowthemes.net/demo/leroy/img/dummies/18.jpg" alt=""><br/>

                                <h4 class="notopmarg nobotmarg">John Martinez</h4>

                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="papers text-center">
                                <img src="http://wowthemes.net/demo/leroy/img/dummies/19.jpg" alt=""><br/>

                                <h4 class="notopmarg nobotmarg">Carlos Montero</h4>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!--informacion-->
            <section class="informacion" id="informacion">
                <div class="container">
                    <div class="heading text-center">
                        <img class="dividerline" src="img/sep.png" alt="">
                        <h2>Informaci�n Convocatoria</h2>
                        <img class="dividerline" src="img/sep.png" alt="">
                        <h3>El apoyo alimentario  para el perioro 2015-III se realizar� dentro de las fechas Siguientes:</h3>
                    </div>
                    <form>
                 <%
                            Usuario userInicial = new Usuario();
                            userInicial.setUser("APOYOUD");
                            userInicial.setPasswd("APOYOUD");

                            ConvocatoriaDAO conv = new ConvocatoriaDAO();
                            Convocatoria c = new Convocatoria();
                            //Buscar convocatoria activa
                            c = conv.buscarConvocatoria("Activa", userInicial);
                        %>
                        <div class="convocatoria">
                            <label for="CedulaInput">A�o Convocatoria:  <%out.print(c.getD_anoConvocatoria());%> </label><br>
                            <label for="CedulaInput">Periodo Convocatoria:  <%out.print(c.getPeriodo());%></label><br>
                            <label for="CedulaInput">Fecha de Inicio:  <%out.print(c.getF_inicioConvocatoria());%></label><br>
                            <label for="CedulaInput">Fecha de finalizacion:  <%out.print(c.getF_finConvocatoria());%></label><br>      
                        </div>
                    </form>

                </div>


        </div>
    </div>
</section>

<!---->
<section class="registrarse" id="registrarse">
    <div class="container w960">
        <div class="heading">
            <img class="dividerline" src="img/sep.png" alt="">
            <h2>Registrarse</h2>
            <img class="dividerline" src="img/sep.png" alt="">
            <h3>Digite su codigo para iniciar el proceso de Registro al Apoyo Alimentario de la Universidad Distrital Francisco Jos� de Caldas<br>
            </h3>
        </div>
        <div class="row">
            <form class="form-login" action="login/registrarUsuario.jsp" method="post" >

                <input type="text" name='ruser' class="form-control" placeholder="C�digo Estudiante"  required>
                <br>
                <input type="password" name='rpasswd' class="form-control" placeholder="Contrase�a"  required>
                <button class="btn btn-theme btn-block" href="#" type="submit"><i class="fa fa-lock"></i>Enviar</button>
                <hr>	         		         
            </form>
        </div>
    </div>
</section>

<!--iniciosesion-->
<section class="iniciosesion" id="iniciosesion">
    <div class="container">
        <div class="heading">
            <img class="dividerline" src="img/sep.png" alt="">
            <h2>Iniciar Sesion</h2>
            <img class="dividerline" src="img/sep.png" alt="">
        </div>
    </div>
    <div class="container w960">
        <div class="row">

            <form class="form-login" action="login/Ubottons/MenuInicial.jsp" method="post">

                <input type="text" class="form-control" name="user" placeholder="C�digo Estudiante" required>


                <br>
                <input type="password" name='passwd' class="form-control" placeholder="Contrase�a"  required>


                <label class="checkbox">
                    <span class="pull-right">
                        <a data-toggle="modal" href="login.html#myModal"> Olvido su contrase�a?</a>

                    </span>
                </label>
                <button class="btn btn-theme btn-block"  type="submit" name="submit"><i class="fa fa-lock"></i>Iniciar Sesi�n</button>
                <hr>

            </form>


            <div class="login-social-link centered">
                <p>Siganos en nuestras redes sociales</p>
                <button class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</button>
                <button class="btn btn-twitter" type="submit"><i class="fa fa-twitter"></i> Twitter</button>
            </div>
            <div class="registration">
                No te has registrado?<br/>
                <a href="#registrarse">
                    Registrate aqu�
                </a>
            </div>
            <!-- Modal -->
            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title">Olvido su Contrase�a ?</h4>
                        </div>
                        <div class="modal-body">
                            <p>Digite su email para recuperar su contrase�a.</p>
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

        </div>
    </div>
</section>

<!--footer-->
<section class="footer" id="footer">
    <p class="text-center">
        <a href="#wrapper" class="gototop"><i class="fa fa-angle-double-up fa-2x"></i></a>
    </p>
    <div class="container">
        <ul>
            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
            <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
            <li><a href="#"><i class="fa fa-flickr"></i></a></li>
        </ul>
        <p>
            &copy; 2015 Copyright<br>

        </p>
    </div>
</section>

</div><!--wrapper end-->

<!--Javascripts-->
<script src="js/jquery.js"></script>
<script src="js/modernizr.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/menustick.js"></script>
<script src="js/parallax.js"></script>
<script src="js/easing.js"></script>
<script src="js/wow.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/masonry.js"></script>
<script src="js/imgloaded.js"></script>
<script src="js/classie.js"></script>
<script src="js/colorfinder.js"></script>
<script src="js/gridscroll.js"></script>
<script src="js/contact.js"></script>
<script src="js/common.js"></script>

<script type="text/javascript">
    jQuery(function($) {
        $(document).ready(function() {
            //enabling stickUp on the '.navbar-wrapper' class
            $('.navbar-wrapper').stickUp({
                parts: {
                    0: 'banner',
                    1: 'aboutus',
                    2: 'informacion',
                    3: 'registrarse',
                    4: 'iniciosesion',
                },
                itemClass: 'menuItem',
                itemHover: 'active',
                topMargin: 'auto'
            });
        });
    });
</script>
</body>
</html>
