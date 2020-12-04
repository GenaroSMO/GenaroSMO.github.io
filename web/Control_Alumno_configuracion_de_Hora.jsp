<%-- 
    Document   : Control_Alumno_configuracion_de_Hora
    Created on : 14/08/2019, 04:43:23 PM
    Author     : DELL02
--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%
    System.out.println("************************************ Control_Alumno_configuracion_de_Hora **************************************************");

    int S001 = Integer.parseInt(request.getParameter("JopS001"));
    int S002 = Integer.parseInt(request.getParameter("JopS002"));
    int S003 = Integer.parseInt(request.getParameter("JopS003"));
    int S004 = Integer.parseInt(request.getParameter("JopS004"));
    int S005 = Integer.parseInt(request.getParameter("JopS005"));
    int S006 = Integer.parseInt(request.getParameter("JopS006"));
    int S007 = Integer.parseInt(request.getParameter("JopS007"));
    int S008 = Integer.parseInt(request.getParameter("JopS008"));
    int S009 = Integer.parseInt(request.getParameter("JopS009"));
    int S0010 = Integer.parseInt(request.getParameter("JopS0010"));
    

    String carrera = request.getParameter("IdCarrera");
    String Pantalla = request.getParameter("Ventana");

    

    System.out.println(S001);
    System.out.println(S002);
    System.out.println(S003);
    System.out.println(S004);
    System.out.println(S005);
    System.out.println(S006);
    System.out.println(S007);
    System.out.println(S008);
    System.out.println(S009);
    System.out.println(S0010);

    try {
        TEST_Alumno TA = new TEST_Alumno();

        int res = TA.Alumno_Configuracion_De_Hora_Actualizar(S001, S002, S003, S004, S005, S006, S007, S008, S009, S0010, carrera);

        if (res == 0) {
            System.out.println("SIII");
%>
<jsp:forward page="<%=Pantalla%>"> 
    <jsp:param name="mensaje" value="Se cambio la configuracion de horas correcatamente" />  
</jsp:forward> 

<%
    }

    if (res == -1) {
%>
<jsp:forward page="<%=Pantalla%>"> 
    <jsp:param name="mensaje" value="Error,Hay alumnos que tienes horas ya registradas" />  
</jsp:forward> 

<%
        }

    } catch (Exception e) {
        System.out.println("------A problem occurred while connecting to the database.");
        System.out.println(e.toString());
    }


%>

