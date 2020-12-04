<%-- 
    Document   : Control_Alumno_Eliminar
    Created on : 26/05/2019, 03:23:41 PM
    Author     : alumno04
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="java.util.LinkedList"%>

<%
    //paso1
    System.out.println("************************************* Control_Alumno_Eliminar ******************************************************");
    String matricula = request.getParameter("txtMatricula");
    if (matricula.length() > 8) {
        System.out.println("ENTRO ------");
%>
<jsp:forward page="Alumno_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="4" />
</jsp:forward>

<%
    }

    if (request.getParameter("Buscar") != null) {
        System.out.println("ENTRO A BUSCAR");

        try {
            LinkedList<Alumno> a = new LinkedList();
            TEST_Alumno tl = new TEST_Alumno();

            a = tl.Alumno(matricula);
            //System.out.println("leng:" + a.size());

            if (a.get(1) != null) {

                System.out.println("Nombre " + a.get(1));
                System.out.println("AP Paterno " + a.get(2));
                System.out.println("AP Materno " + a.get(3));
                System.out.println("Semestre " + a.get(4));
                System.out.println("Carrera " + a.get(5));
                System.out.println("ruta imagen " + a.get(6));
                String nom = "", app = "", apm = "", imge = "";
                nom = a.get(1) + "";
                app = a.get(2) + "";
                apm = a.get(3) + "";
                imge = a.get(6) + "";
                nom = nom.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
                app = app.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
                apm = apm.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
                imge = imge.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

%>
<jsp:forward page="Alumno_Eliminar.jsp"> 

    <jsp:param name="matricula" value="<%= matricula%>" />
    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="ApPaterno" value="<%=app%>" />
    <jsp:param name="ApMaterno" value="<%=apm%>" />  
    <jsp:param name="Semestre" value="<%=a.get(4)%>" />  
    <jsp:param name="Carrera" value="<%=a.get(5)%>" /> 
    <jsp:param name="IMG" value="<%=imge%>" />  
    <jsp:param name="mensaje" value="1" />  

</jsp:forward> 
<%

} else {
    System.out.println("No existe el alumno");
%>
<jsp:forward page="Alumno_Eliminar.jsp"> 

    <jsp:param name="mensaje" value="3" />
</jsp:forward> 
<%
            }

        } catch (Exception e) {
            System.out.println("------A problem occurred while connecting to the database.");
            System.out.println(e.toString());
        }

    }

    if (request.getParameter("Eliminar") != null) {
        //paso1 imagen
        String imagen = request.getParameter("imagen");
        System.out.println("IMG(" + imagen + ")");
        imagen = imagen.substring(imagen.lastIndexOf("/") + 1, imagen.length());
        if (!imagen.equals("user2.png")) {
            //File fichero = new File("C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\" + imagen);
            File fichero = new File("C:\\Tomcat\\webapps\\BISUCO\\img\\tmp\\" + imagen);
            fichero.delete();
        }

        try {

            TEST_Alumno ta = new TEST_Alumno();
            if (ta.elimnarAlumno(matricula) == 1) {

                //JOptionPane.showMessageDialog(null, "Alumno Eliminado");
%>
<jsp:forward page="Alumno_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="2" />  
</jsp:forward> 

<%            } else {

                //JOptionPane.showMessageDialog(null, "Error no existe el Alumno");
            }
        } catch (Exception e) {
            System.out.println("------A problem occurred while connecting to the database.");
            System.out.println(e.toString());
        }

    }


%>

