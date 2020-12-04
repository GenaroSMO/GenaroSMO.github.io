<%-- 
    Document   : RH_Control_Planta_Alta
    Created on : 28/08/2019, 09:40:32 PM
    Author     : DELL02
--%>


<%@page import="Biblioteca.Unpa.LB.EL.Registro_Hora"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Registro_De_Horas"%>
<%@page import="java.util.LinkedList"%>

<%
    //obtener todos los datos del login

    String matricula = request.getParameter("txtMatricula");
    String ap = "", nom = "", img = "";

    //String matricula = request.getParameter("txtMatricula");
    if (matricula.length() > 8) {
        System.out.println("ENTRO ------");
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 
    <jsp:param name="mensaje" value="La matricula excede el tama&ntilde;o" />
</jsp:forward> 

<%
    }
    try {
        //Registro_Hora registro_hora = new Registro_Hora();
        LinkedList<String> a = new LinkedList();
        TEST_Registro_De_Horas trdh = new TEST_Registro_De_Horas();
        TEST_Alumno TA = new TEST_Alumno();
        //registro_hora.setMatricula(matricula);
        // System.out.println("Mensaje: "+trdh.Registro_Hora(registro_hora));

        switch (trdh.Registro_De_Hora_Planta_Alta(matricula)) {

            case -1:
                System.out.println("ENTRO -1");
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="" />
    <jsp:param name="apellidos" value="" />
    <jsp:param name="mensaje" value="" />
    <jsp:param name="T_Horas" value="" />  
</jsp:forward> 
<%          break;
    case 0:
        System.out.println("ENTRO 0");
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 
    <jsp:param name="mensaje" value="EL ALUMN@ NO EXISTE" />
</jsp:forward> 
<%          break;
    case 1:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");


%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="mensaje" value="EL ALUMN@ NO DEBE HORAS" />
    <jsp:param name="IMG" value="<%=img%>" />
    <jsp:param name="T_Horas" value="" />  
</jsp:forward> 
<%          break;
    case 2:
        System.out.println("ENTRO 2");
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");


%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="mensaje" value="EL ALUMN@ NO ACOMPLETA LA HORA" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="IMG" value="<%=img%>" />
    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
    case 3:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="mensaje" value="HORAS REGISTRADAS" />
    <jsp:param name="IMG" value="<%= img%>" />
    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
    case 4:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="mensaje" value="HORAS REGISTRADAS" />
    <jsp:param name="IMG" value="<%= img%>" />
    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
    case 5:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

        //Total_de_Horas_Adeudadas = TA.AlumnoHorasAdeudadas(matricula) + "";
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="IMG" value="<%= img%>" />
    <jsp:param name="mensaje" value="HORAS REGISTRADAS" />

    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
    case 6:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

        //Total_de_Horas_Adeudadas = TA.AlumnoHorasAdeudadas(matricula) + "";
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 
    <jsp:param name="valor" value="1" />
    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="IMG" value="<%= img%>" />
    <jsp:param name="mensaje" value="HORAS REGISTRADAS" />
    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
    case 7:
        a = TA.Alumno(matricula);
        nom = a.get(1).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        ap = a.get(2) + " " + a.get(3);
        ap = ap.replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
        img = a.get(6).replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");

        //Total_de_Horas_Adeudadas = TA.AlumnoHorasAdeudadas(matricula) + "";
%>
<jsp:forward page="Registro_de_Horas_a_Planta_Alta.jsp"> 

    <jsp:param name="valor" value="7" />
    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="apellidos" value="<%=ap%>" />
    <jsp:param name="carrera" value="<%= a.get(5)%>" />
    <jsp:param name="IMG" value="<%= img%>" />
    <jsp:param name="mensaje" value="ALUMN@ ESTA ENTRANDO" />
    <jsp:param name="T_Horas" value="<%= a.get(7)%>" />  
</jsp:forward> 
<%          break;
        }
    } catch (Exception e) {
        System.out.println("------A problem occurred while connecting to the database.");
        System.out.println(e.toString());
    }


%>

