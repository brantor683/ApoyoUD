<%-- 
    Document   : upload_file_multipale
    Created on : 2/10/2015, 12:39:28 PM
    Author     : Brandon
--%>

 <%@page import="Util.Directorio"%>
<%@page import="Negocio.Usuario"%>
<%@ page import="java.util.List" %>
   <%@ page import="java.util.Iterator" %>
   <%@ page import="java.io.File" %>
   <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
   <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
   <%@ page import="org.apache.commons.fileupload.*"%>
   <%@ page contentType="text/html;charset=UTF-8" language="java" %>
   <center>
<table border="2">
        <tr>
        <td>
	<h1>Your files  uploaded </h1>
	</td>
	</tr>
   <%
 boolean isMultipart = ServletFileUpload.isMultipartContent(request);
 if (!isMultipart) {
 } else {
     
   Usuario user = new Usuario();
    user.setUser((String) session.getAttribute("USUARIO"));
    user.setPasswd((String) session.getAttribute("CONT"));
    Directorio dir = new Directorio();
    String directorio = "C:/PRUEBA/"+user.getUser()+"/IngresosFamiliares/";
    dir.generarDirectorio(directorio);     
     
	   FileItemFactory factory = new DiskFileItemFactory();
	   ServletFileUpload upload = new ServletFileUpload(factory);
	   List items = null;
	   try {
		   items = upload.parseRequest(request);
	   } catch (FileUploadException e) {
		   e.printStackTrace();
	   }
	   Iterator itr = items.iterator();
	   while (itr.hasNext()) {
	   FileItem item = (FileItem) itr.next();
	   if (item.isFormField()) {
	   } else {
		   try {
			   String itemName = item.getName();
			    File savedFile = new File(directorio+itemName);
                             item.write(savedFile);  
		          out.println("<tr><td><b>Your file has been saved at the loaction:</b></td></tr><tr><td><b>"+"uploadedFiles"+"\\"+itemName+"</td></tr>");
		   } catch (Exception e) {
			   e.printStackTrace();
		   }
	   }
	   }
   }
   %>
    </table>
   </center>