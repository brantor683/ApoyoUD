<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>
<!DOCTYPE html>
<html lang="en">
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
                <section id="main-content">
                    <section class="wrapper">


                        <div class="wrapper">
                            <div class="box">
                                <div class="row">
                                    <!-- main -->
                                    <div class="column col-sm-9" id="main">
                                        <div class="padding">

                                            <div class="full col-sm-9">

                                                <!--/-->
                                                <div class="col-sm-10" id="Registrarapor">  
                                                    <div class="page-header text-muted divider">
                                                        Iniciar Sesión Correo Electrónico GMAIL
                                                        
                                                    </div>
                                                    <form action="EnviarCorreoRTA.jsp" method="post">
                                                        <div class="form-group">
                                                            <label for="CedulaInput">Cuenta</label>
                                                            <input name="cuenta" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">

                                                            <label for="CedulaInput">Contraseña</label>
                                                            <input name="pass" style="width:200px;height:25px" type="password" class="form-control" id="cedulaInput">

                                                            <label for="CedulaInput">Para:</label>
                                                            <input name="to" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">

                                                            <label for="CedulaInput">Asunto</label>
                                                            <input name="subjet" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">

                                                            <label for="CedulaInput">Mensaje</label>
                                                            <input name="msg" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">

                                                            <label for="CedulaInput">Adjunto</label>
                                                            <input name="archivo" style="width:500px;height:35px" type="file" class="form-control" id="cedulaInput"><br><br>

                                                            <div align="left"><button class="btn btn-success">Enviar</button></div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="row divider">  
                                                </div><!-- /col-9 -->
                                            </div><!-- /padding -->
                                        </div>
                                        <!-- /main -->

                                    </div>
                                </div>
                            </div>
                    </section>
                </section>
                <footer class="site-footer">
                    <div class="text-center">
                        2015 
                        <a href="menuFuncionario.jsp#" class="go-top">
                            <i class="fa fa-angle-up"></i>
                        </a>
                    </div>
                </footer>
                <!--footer end-->
            </section>
            <!-- script references -->
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
        </body>
    </html>





















    <!-- main 
    <div class="column col-sm-9" id="main">
        <div class="padding">

            <div class="full col-sm-9">-->

    <!--/Registrar aportes-
    <div class="col-sm-10" id="Registrarapor">  
        <div class="page-header text-muted divider">
            Iniciar Sesión Correo Electrónico
        </div>
        <form action="EnviarCorreoRTA.jsp" method="post">
            <div class="form-group">
                <label for="CedulaInput">Cuenta</label>
                <input name="cuenta" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                
                <label for="CedulaInput">Contraseña</label>
                <input name="pass" style="width:200px;height:25px" type="password" class="form-control" id="cedulaInput">
                
                <label for="CedulaInput">Para:</label>
                <input name="to" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                
                <label for="CedulaInput">Asunto</label>
                 <input name="subjet" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">

                <label for="CedulaInput">Mensaje</label>
                <input name="msg" style="width:200px;height:25px" type="text" class="form-control" id="cedulaInput">
                 
                <label for="CedulaInput">Adjunto</label>
                <input name="archivo" style="width:500px;height:35px" type="file" class="form-control" id="cedulaInput"><br><br>
    
                <div align="left"><button class="btn btn-success">Enviar</button></div>
            </div>
        </form>
    </div>
    <div class="row divider">  
    </div>--><!-- /col-9 
</div>--><!-- /padding 
</div>-->
    <!-- /main 


script references 
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>-->