<%-- 
    Document   : Control_Alumno_Actualizar
    Created on : 26/05/2019, 03:23:41 PM
    Author     : alumno04
--%>

<%@page import="java.io.File"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="java.util.LinkedList"%>

<%
    //paso1
    System.out.println("******************************************************Control_Alumno_Actualizar***********************************************************************");
    String matricula = request.getParameter("txtMatricula");
    if (matricula.length() > 8) {
        System.out.println("ENTRO ------");
%>
<jsp:forward page="Alumno_Actualizar.jsp"> 
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
<jsp:forward page="Alumno_Actualizar.jsp"> 

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
<jsp:forward page="Alumno_Actualizar.jsp"> 

    <jsp:param name="mensaje" value="3" />
</jsp:forward> 
<%
            }

        } catch (Exception e) {
            System.out.println("------A problem occurred while connecting to the database.");
            System.out.println(e.toString());
        }

    }

    if (request.getParameter("Actualizar") != null) {
        System.out.println("ENTRO A ACTUALIZAR");

        String nombre = request.getParameter("txtNombre");
        String appaterno = request.getParameter("txtApPaterno");
        String apmaterno = request.getParameter("txtApMaterno");
        String semestre = request.getParameter("JopSemestre");
        String carrea = request.getParameter("JopCarrera");

        System.out.println("nombre      :" + nombre);
        System.out.println("appaterno   :" + appaterno);
        System.out.println("apmaterno   :" + apmaterno);
        System.out.println("semestre    :" + semestre);
        System.out.println("carrea      :" + carrea);

        TEST_Alumno tl = new TEST_Alumno();

        Alumno alumno = new Alumno();

        alumno.setMatricula(matricula);
        alumno.setNombre(nombre);
        alumno.setAP_Paterno(appaterno);
        alumno.setAP_Materno(apmaterno);
        //alumno.setSemestre(semestre);

        if (carrea.equals("Computacion")) {
            alumno.setCarrera("C001");
        }
        if (carrea.equals("Mecatronica")) {
            alumno.setCarrera("C002");
        }
        if (carrea.equals("Diseno")) {
            alumno.setCarrera("C003");
        }
        if (carrea.equals("Agricola")) {
            alumno.setCarrera("C004");
        }
        if (carrea.equals("Zootecnia")) {
            alumno.setCarrera("C005");
        }
        if (carrea.equals("Acuicultura")) {
            alumno.setCarrera("C006");
        }
        if (carrea.equals("Matematicas")) {
            alumno.setCarrera("C007");
        }

        if (semestre.equals("1")) {
            alumno.setSemestre("S001");
        }
        if (semestre.equals("2")) {
            alumno.setSemestre("S002");
        }
        if (semestre.equals("3")) {
            alumno.setSemestre("S003");
        }
        if (semestre.equals("4")) {
            alumno.setSemestre("S004");
        }
        if (semestre.equals("5")) {
            alumno.setSemestre("S005");
        }
        if (semestre.equals("6")) {
            alumno.setSemestre("S006");
        }
        if (semestre.equals("7")) {
            alumno.setSemestre("S007");
        }
        if (semestre.equals("8")) {
            alumno.setSemestre("S008");
        }
        if (semestre.equals("9")) {
            alumno.setSemestre("S009");
        }
        if (semestre.equals("10")) {
            alumno.setSemestre("S010");
        }

        System.out.println("Matricula  :" + alumno.getMatricula());
        System.out.println("Nombre     :" + alumno.getNombre());
        System.out.println("AP Paterno :" + alumno.getAP_Paterno());
        System.out.println("AP Materno :" + alumno.getAP_Materno());
        System.out.println("Semestre   :" + alumno.getSemestre());
        System.out.println("Carrera    :" + alumno.getCarrera());
        
        int aux=tl.actualizarAlumno(alumno);


        if (aux == 1) {
            System.out.println("Alumno Actualizado");
%>
<jsp:forward page="Alumno_Actualizar.jsp"> 

    <jsp:param name="mensaje" value="2" />
</jsp:forward> 
<%
        } 

         if (aux == 0) {
            
%>
<jsp:forward page="Alumno_Actualizar.jsp"> 

    <jsp:param name="mensaje" value="5" />
</jsp:forward> 
<%
        } 

    }


%>

