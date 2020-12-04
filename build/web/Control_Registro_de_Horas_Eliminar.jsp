<%-- 
    Document   : Control_Registro_de_Horas_Eliminar
    Created on : 20/08/2019, 12:56:01 PM
    Author     : DELL02
--%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Registro_De_Horas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="Biblioteca.Unpa.LB.EL.Registro_Hora"%>
<%

    System.out.println("********************************* Registro_de_Horas_Eliminar ***********************************************");

    String matricula = request.getParameter("txtMatricula");

    if (matricula.length() > 8) {
        System.out.println("ENTRO ------");
%>
<jsp:forward page="Registro_de_Horas_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="3" />
</jsp:forward> 
<%
    }
    //String matricula = request.getParameter("txtMatricula");
    System.out.println("matricula: " + matricula);
    if (request.getParameter("Buscar") != null) {
        System.out.println("Buscar");
        try {

            List<Registro_Hora> Registro_Hora_Lst = new ArrayList<Registro_Hora>();

            TEST_Registro_De_Horas trdh = new TEST_Registro_De_Horas();

            Registro_Hora_Lst = trdh.Registro_Horas_Lista_Alumno(matricula);

            if (Registro_Hora_Lst.size() == 0) {
                System.out.println("NO SE Encotro alumno");
%>
<jsp:forward page="Registro_de_Horas_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="2" />
</jsp:forward> 

<%
} else {
    System.out.println(Registro_Hora_Lst.get(0).getMatricula());
    System.out.println(Registro_Hora_Lst.get(0).getNombres());
    System.out.println(Registro_Hora_Lst.get(0).getFecha());
    System.out.println(Registro_Hora_Lst.get(0).getHora_de_entrada());
    System.out.println(Registro_Hora_Lst.get(0).getStatus_alumno());
    String nom=Registro_Hora_Lst.get(0).getNombres().replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
    String img=Registro_Hora_Lst.get(0).getFoto().replace("á", "&aacute;").replace("é", "&eacute;").replace("í", "&iacute;").replace("ó", "&oacute;").replace("ú", "&uacute;").replace("Á", "&Aacute;").replace("É", "&Eacute;").replace("Í", "&Iacute;").replace("Ó", "&Oacute;").replace("Ú", "&Uacute;").replace("Ñ", "&Ntilde;").replace("ñ", "&ntilde;");
%>
<jsp:forward page="Registro_de_Horas_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="1" />
    <jsp:param name="matric" value="<%=matricula%>" />
    <jsp:param name="nombre" value="<%=nom%>" />
    <jsp:param name="IMG" value="<%=img%>" />
    <jsp:param name="mensaje" value="<%=Registro_Hora_Lst.get(0).getFecha()%>" />
    <jsp:param name="Hora_de_Entrada" value="<%= Registro_Hora_Lst.get(0).getHora_de_entrada()%>" />
    <jsp:param name="Status" value="<%=Registro_Hora_Lst.get(0).getStatus_alumno()%>" />
</jsp:forward> 

<%
            }

        } catch (Exception e) {
            System.out.println("------A problem occurred while connecting to the database.");
            System.out.println(e.toString());
        }
    }

    if (request.getParameter("Eliminar") != null) {
        System.out.println("ELIMINAR");
        String matric = request.getParameter("txtMatriAux");
        System.out.println("MATRICULA :" + matric);
        try {

            TEST_Alumno ta = new TEST_Alumno();
            if (ta.ElimnarRegistro(matric) == 1) {

                //JOptionPane.showMessageDialog(null, "Alumno Eliminado");
%>
<jsp:forward page="Registro_de_Horas_Eliminar.jsp"> 
    <jsp:param name="mensaje" value="4" />  
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