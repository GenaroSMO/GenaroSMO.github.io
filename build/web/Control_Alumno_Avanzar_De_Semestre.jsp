<%-- 
    Document   : Control_Alumno_Avanzar_De_Semestre
    Created on : 30/05/2019, 04:58:49 PM
    Author     : alumno04
--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    TEST_Alumno ta = new TEST_Alumno();

    if (ta.AlumnoAvanzarSemestre() == 1) {

%>
<jsp:forward page="AvanzarDeSemestre.jsp"> 
    <jsp:param name="mensaje" value="Los alumnos avanzaron al siguiente Semestre" />
</jsp:forward>
<%    } else {

%>
<jsp:forward page="AvanzarDeSemestre.jsp"> 
    <jsp:param name="mensaje" value="Error" />
</jsp:forward>
<%


    }


%>


