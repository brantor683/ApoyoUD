<%-- 
    Document   : form_component
    Created on : 27/09/2015, 07:20:48 PM
    Author     : LORENA MANZANO
--%>

<%@page import="Datos.SocioeconomicoDAO"%>
<%@page import="Negocio.Socioeconomico"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Datos.ItemSocioeconomicoDAO"%>
<%@page import="Negocio.ItemSocioeconomico"%>
<%@page import="Datos.ConvocatoriaDAO"%>
<%@page import="Negocio.Convocatoria"%>
<%@page import="Negocio.Estudiante"%>
<%@page import="Datos.SolicitudDAO"%>
<%@page import="Negocio.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Datos.UsuarioDAO"%>
<%@page import="Util.RHException"%>
<%@page import="java.io.IOException"%>
<%@page import="Util.ServiceLocator"%>
<%@page import="Negocio.Usuario"%>

<%@page import="Datos.EstudianteDAO"%>
<%@page import="java.sql.*"%>



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
            <%@ include file="menuFuncionarios.jsp" %>  


            <!-- **********************************************************************************************************************************************************
            MAIN CONTENT
            *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">


                    <!-- BASIC FORM ELELEMNTS -->
                    <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Informacion solicitud</h4>
                                <form class="form-horizontal style-form" method="post">
                                    <%
                                        Usuario user = new Usuario();
                                        UsuarioDAO u = new UsuarioDAO();

                                        user.setUser((String) session.getAttribute("USUARIO"));
                                        user.setPasswd((String) session.getAttribute("CONT"));

                                        String codEstudiante = request.getParameter("cod");

                                        int p1, p2, p3, p4 = 0;
                                        Solicitud solicitud = new Solicitud();
                                        Solicitud solicitudValidar = new Solicitud();
                                        SolicitudDAO soliDAO = new SolicitudDAO();
                                        Estudiante estuser = new Estudiante();
                                        EstudianteDAO estu = new EstudianteDAO();
                                        Convocatoria convActual = new Convocatoria();
                                        ConvocatoriaDAO convDAO = new ConvocatoriaDAO();
                                        SocioeconomicoDAO socioEcoDAO = new SocioeconomicoDAO();
                                        
                                        Socioeconomico soc1 = new Socioeconomico();
                                        Socioeconomico soc2 = new Socioeconomico();
                                        Socioeconomico soc3 = new Socioeconomico();
                                        Socioeconomico soc4 = new Socioeconomico();

                                        ItemSocioeconomicoDAO ItemDAO = new ItemSocioeconomicoDAO();
                                        ItemSocioeconomico param1 = new ItemSocioeconomico();
                                        ItemSocioeconomico param2 = new ItemSocioeconomico();
                                        ItemSocioeconomico param3 = new ItemSocioeconomico();
                                        ItemSocioeconomico param4 = new ItemSocioeconomico();
                                        
                                      

                                        convActual = convDAO.buscarConvocatoria("Pendiente", user);
                                        solicitud.setK_conv_convocatoria(convActual.getK_convocatoria());

                                        estuser = estu.buscarEstudiante(codEstudiante, user);

                                        solicitud.setK_est_codEstudiante(Integer.valueOf(codEstudiante));

                                        solicitudValidar = soliDAO.buscarSolicitudConvocatoria(codEstudiante, solicitud.getK_conv_convocatoria(), user);

                                        List listaSocioeconomicos = new ArrayList<Integer>();
                                        listaSocioeconomicos = ItemDAO.buscarSolicitudSocioeconomica(solicitudValidar.getK_idSolicitud(), user);

                                        p1 = (Integer) listaSocioeconomicos.get(0);
                                        p2 = (Integer) listaSocioeconomicos.get(1);
                                        p3 = (Integer) listaSocioeconomicos.get(2);
                                        p4 = (Integer) listaSocioeconomicos.get(3);

                                        param1 = ItemDAO.buscarItemSocioeconomica(p1, user);
                                        param2 = ItemDAO.buscarItemSocioeconomica(p2, user);
                                        param3 = ItemDAO.buscarItemSocioeconomica(p3, user);
                                        param4 = ItemDAO.buscarItemSocioeconomica(p4, user);
                                        
                                      
                                          soc1=socioEcoDAO.buscarDocumento(p1, solicitudValidar.getK_idSolicitud(), user);
                                          soc2=socioEcoDAO.buscarDocumento(p2, solicitudValidar.getK_idSolicitud(), user);
                                          soc3=socioEcoDAO.buscarDocumento(p3, solicitudValidar.getK_idSolicitud(), user);
                                          soc4=socioEcoDAO.buscarDocumento(p4, solicitudValidar.getK_idSolicitud(), user);
                                          

                                    %>
                                   
                                     <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Código de estudiante</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getK_codEstudiante());%>>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Documento de Identificación</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getD_identificacion());%>>
                                        </div>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Nombre</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getN_nomEstudiante());%> >
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Apellidos</label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" readonly="readonly" value=<%out.print(estuser.getN_apeEstudiante());%> >
                                        </div>
                                    </div>
                                    <br>

                                </form>


                            </div>
                        </div><!-- col-lg-12-->      	
                    </div><!-- /row -->
                    <!-- INPUT MESSAGES -->
                     <form class="form-group" action="registrarValidacion_RTA.jsp" method="post" >
             
                                            <input type="hidden" name="idSolicitud" class="form-control" readonly="readonly" value=<%out.print(solicitudValidar.getK_idSolicitud());%> >
                                            <input type="hidden" name="idSoc1" class="form-control" readonly="readonly" value=<%out.print(p1);%> >
                                            <input type="hidden" name="idSoc2" class="form-control" readonly="readonly" value=<%out.print(p2);%> >
                                            <input type="hidden" name="idSoc3" class="form-control" readonly="readonly" value=<%out.print(p3);%> >
                                            <input type="hidden" name="idSoc4" class="form-control" readonly="readonly" value=<%out.print(p4);%> >
                                        
                         <div class="row mt">
                        <div class="col-lg-12">
                            <div class="form-panel">
                                <h4 class="mb"><i class="fa fa-angle-right"></i>Ingresos Familiares</h4>
                                <div class="row mt"
                                <div class="form">
                                   
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" readonly="readonly"   value="<%out.print(param1.getD_descSocioeconomica());%>">
                                    </div>
                                </div>
                                <br>
                                <br><div class="form-group">
                                    <label class="col-sm-2 col-sm-2 control-label">Documento de respaldo</label>
                                  
                                     <%  if(soc1.getD_soporte().length()>51 ) {%>
                                     <a href="archivos/ingresosFamiliares.jsp?pam=<%=p1+"&idSol="+solicitudValidar.getK_idSolicitud()%>"  TARGET="_new">Documento Ingresos Familiares</a>
                                  <%}else{%>
                                    El estudiante NO adjunto documento de soporte
                                   <% }%>
                                    <br>    </div>
                                <br><div class="form-group">
                                    <label class="col-lg-9 col-lg-9 ">Seleccione si es válido o NO es válido el documento
                                        presentado por el estudiante para el item: Ingresos familiares</label>
                                    <select  name="valIngresosfamiliares"  id="valIngresosfamiliares" class="form-control" required>
                                      <option value="">Seleccione el estado de la condición </option>
                                        <option value="S">VÁLIDO</option>
                                        <option value="N">NO VÁLIDO</option>
                                     
                                    </select> 
                                </div></div>
                             
                                <br>
                                 
                                 <div class="form-panel">
                                     <h4 class="mb"><i class="fa fa-angle-right"></i>Condiciones Familiares</h4>
                                     <div class="form-group">
                                          <div class="col-sm-5">
                                        <input type="text" class="form-control" readonly="readonly" value="<%out.print(param2.getD_descSocioeconomica());%>">
                                    </div>
                                </div>
                                    <br><br>
                                    <br>
                                             <div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Documento de respaldo</label>
                                  <%  if(soc2.getD_soporte().length()>54 ) {%>
                                     <a href="archivos/condicionesFamiliares.jsp?pam=<%=p2+"&idSol="+solicitudValidar.getK_idSolicitud()%>"  TARGET="_new">Documento Condiciones Familiares</a>
                                  <%}else{%>
                                    El estudiante NO adjunto documento de soporte
                                   <% }%>
                                    <br>    </div>
                                <br><div class="form-group">
                                    <label class="col-lg-9 col-lg-9 ">Seleccione si es válido o NO es válido el documento
                                        presentado por el estudiante para el item: Condiciones familiares</label>
                                    <select  name="valCondicionesFamiliares"  id="valCondicionesFamiliares" class="form-control" required>
                                        <option value="">Seleccione el estado de la condición </option>
                                        <option value="S">VÁLIDO</option>
                                        <option value="N">NO VÁLIDO</option>
                                    
                                    </select> 
                                </div> </div>
                             
                                <br><div class="form-panel">     
                                    <h4 class="mb"><i class="fa fa-angle-right"></i>Procedencia y lugar de residencia</h4><div class="form-group">
                                 
                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" readonly="readonly" value="<%out.print(param3.getD_descSocioeconomica());%>">
                                    </div>
                                </div>
                                <br>
                                <br><div class="form-group">
                                    <br>
                                    <label class="col-sm-2 col-sm-2 control-label">Documento de respaldo</label>
                                     <%  if(soc3.getD_soporte().length()>44 ) {%>
                                     <a href="archivos/procedencia.jsp?pam=<%=p3+"&idSol="+solicitudValidar.getK_idSolicitud()%>"  TARGET="_new">Documento Procedencia y lugar de residencia</a>
                                  <%}else{%>
                                    El estudiante NO adjunto documento de soporte
                                   <% }%>
                                    <br>    </div>
                                <br><div class="form-group">
                                    <label class="col-lg-9 col-lg-9 ">Seleccione si es válido o NO es válido el documento
                                        presentado por el estudiante para el item: Procedencia y lugar de residencia</label>
                                    <select  name="valProcedencia"  id="valProcedencia" class="form-control" required>
                                        <option value="">Seleccione el estado de la condición </option>
                                        <option value="S">VÁLIDO</option>
                                        <option value="N">NO VÁLIDO</option>
                                     
                                    </select> 
                                </div></div>
                                <br>
                               
                                <div class="form-panel">
                                    <h4 class="mb"><i class="fa fa-angle-right"></i>Condiciones de salud</h4><div class="form-group">
                                    <div class="form-group">

                                    <div class="col-sm-5">
                                        <input type="text" class="form-control" readonly="readonly" value="<%out.print(param4.getD_descSocioeconomica());%>">
                                    </div>
                                    <br><br>
                                    <br><div class="form-group">
                                        <label class="col-sm-2 col-sm-2 control-label">Documento de respaldo</label>
                                       <%  if(soc4.getD_soporte().length()>38 ) {%>
                                     <a href="archivos/condicionesSalud.jsp?pam=<%=p4+"&idSol="+solicitudValidar.getK_idSolicitud()%>"  TARGET="_new">Documento condición de salud</a>
                                  <%}else{%>
                                    El estudiante NO adjunto documento de soporte
                                   <% }%>
                                        <br>    </div>
                                    <br><div class="form-group">
                                        <label class="col-lg-9 col-lg-9 ">Seleccione si es válido o NO es válido el documento
                                            presentado por el estudiante para el item: Condiciones de salud</label>
                                        <select  name="valCondicionesSalud"  id="valCondicionesSalud" class="form-control">
                                            <option value="">Seleccione el estado de la condición </option>
                                            <option value="S">VÁLIDO</option>
                                            <option value="N">NO VÁLIDO</option>
                                          
                                        </select> 
                                    </div></div>
                                   



 
                                </div><!-- /form-panel -->

                            </div><!-- /col-lg-12 -->



                        </div><!-- /row -->

                        <br><center><button type="submit" class="btn btn-theme04"   >Validar Solicitud</button></center>

                                </form>
                                    <center>   <br>  <button type="button" class="btn btn-link"  ><a href="MenuFuncionario.jsp"> Regresar</a></button></center>
                </section><! --/wrapper -->
            </section><!-- /MAIN CONTENT -->

            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2015 
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





</body>
</html>

