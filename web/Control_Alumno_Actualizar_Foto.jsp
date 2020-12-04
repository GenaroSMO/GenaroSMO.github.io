<%-- 
    Document   : Control_Alumno_Actualizar_Foto
    Created on : 9/08/2019, 11:12:43 AM
    Author     : DELL02
--%>

<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    //paso1
    System.out.println("************************************ALUMNO BUSCAR INFORMACION *******************************************************");

    if (request.getParameter("Buscar") != null) {
        String matricula = request.getParameter("txtMatricula");

        System.out.println("Esta a punto de entrar al if matricula=" + matricula);
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
<jsp:forward page="Alumno_Actualizar_Imagen.jsp"> 

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
<jsp:forward page="Alumno_Actualizar_Imagen.jsp"> 

    <jsp:param name="mensaje" value="3" />
</jsp:forward> 
<%
            }

        } catch (Exception e) {
            System.out.println("------A problem occurred while connecting to the database.");
            System.out.println(e.toString());
        }

    }

    String RutaIMGBD = "";
    String RutaIMG = "";

    String Matricula = "", imagen = "";

    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    List items = upload.parseRequest(request);
    System.out.println("************************************ALUMNO ACTUALIZAR IMAGEN *******************************************************");
    File fichero = null;
// Se recorren todos los items, que son de tipo FileItem

    for (Object item : items) {
        FileItem uploaded = (FileItem) item;
        // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
        // subido donde nos interese
        if (!uploaded.isFormField()) {
            // No es campo de formulario, guardamos el fichero en algún sitio

            String aux = uploaded.getName();
            aux = aux.substring(aux.lastIndexOf("\\") + 1, aux.length());
            System.out.println(aux);
            RutaIMGBD = "img/tmp/" + aux;
            //System.out.println(uploaded.getName().lastIndexOf("\\"));
            //fichero = new File("C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\"+ aux);
            fichero = new File("C:\\Tomcat\\webapps\\BISUCO\\img\\tmp\\"+ aux);
            RutaIMG = fichero + "";
            System.out.println("Archivo   :" + uploaded.getName());
            System.out.println("RUTABD    :" + RutaIMGBD);
            System.out.println("RUTA      :" + RutaIMG);
            if (!fichero.exists()) {
                System.out.println("Se logro copiar y mover el archivo");
                uploaded.write(fichero);

            } else {
                System.out.println("Ya existe un archivo con ese nombre");
%>
<jsp:forward page="Alumno_Actualizar_Imagen.jsp"> 
    <jsp:param name="mensaje" value="4" />
</jsp:forward>
<%              }

            //System.out.println("entro");
        } else {
            // es un campo de formulario, podemos obtener clave y valor
            String key = uploaded.getFieldName();
            String valor = uploaded.getString();
            System.out.println("key: (" + key + ") valor: (" + valor + ")");
            if (key.equals("txtMatri")) {
                Matricula = valor;
            }
            if (key.equals("txtImagen")) {
                imagen = valor;
            }
        }
    }

    //
    System.out.println("Matricula : " + Matricula);
    imagen = imagen.substring(imagen.lastIndexOf("/") + 1, imagen.length());
    //System.out.println("imagen    : C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\(" + imagen + ")");
    System.out.println("RutaIMGBD : " + RutaIMGBD);

    if (!imagen.equals("user2.png")) {
        //File aux = new File("C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\"+ imagen);
        File aux = new File("C:\\Tomcat\\webapps\\BISUCO\\img\\tmp\\"+ imagen);
        aux.delete();
    }

    TEST_Alumno ta = new TEST_Alumno();

    if (ta.actualizarFotoDeAlumno(Matricula, RutaIMGBD) == 1) {
%>
<jsp:forward page="Alumno_Actualizar_Imagen.jsp"> 
    <jsp:param name="mensaje" value="2" />
</jsp:forward>
<%
    }

%>