<%-- 
    Document   : AvanzarDeSemestre
    Created on : 29/05/2019, 04:21:23 PM
    Author     : alumno04

--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">
        <title>Avanzar de semestre</title>
    </head>
    <body>

        <%
            if (session.getAttribute("Usuario") == null) {
        %>
        <jsp:forward page="index.jsp"> 
            <jsp:param name="mensaje" value="Lo Sentimos, No han iniciado sesion " />
        </jsp:forward> 

        <%
            }
            String mensaje = request.getParameter("mensaje");
            if (mensaje == null) {
                mensaje = "";
            }

            TEST_Alumno alum = new TEST_Alumno();

            String Fecha = alum.CambioDeFecha(2);


        %>

        <form method="post" class="formAvanzarDeSemestre" action="Control_Alumno_Avanzar_De_Semestre.jsp" >
            <label for="txtUsuario" class="AgregarAlumno">Avanzar de Semestre </label>

            <H2>
                <b style="color:#FF0000;"> Advertencia: </b> Esta funcion pasara automaticamente a los alumnos
                al siguiente semestre. Los alumnos que pasen a 9° semestre seran eliminados del sistema 
                <br>
                Ultima Fecha de modificacion: <%=Fecha%>
            </H2>
            <br>
            <br>
            <table border="0">
                <tr>
                    <td  WIDTH="20" HEIGHT="20"> </td>
                    <td  WIDTH="300" HEIGHT="20" ></td>
                    <td  WIDTH="100" HEIGHT="20" ><center> <a class="boton" href="Menu_Administrador.jsp">Regresar</a> </center> </td>
                <td  WIDTH="100" HEIGHT="20" > <input align="center" class="boton" type="submit"   value="Aceptar" > </td>
                </tr>
            </table>

            <br>

            <table border="0" >
                <tr>
                    <td  WIDTH="590" HEIGHT="30" class="texto" > <center>  <%= mensaje%> </center> </td>
                </tr>

            </table>

        </form>
    </body>
</html>
