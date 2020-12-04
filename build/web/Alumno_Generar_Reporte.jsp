<%-- 
    Document   : Alumno_Generar_Reporte
    Created on : 30/05/2019, 05:31:13 PM
    Author     : alumno04
constrasta

--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">
        <title>Generar Reporte</title>
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
            
            
            String x = session.getAttribute("Usuario") + "";
            String cancelar = "";
            if (x.equals("0")) {
                cancelar = "Menu_Administrador.jsp";
            }

            if (x.equals("1")) {
                cancelar = "Menu_Usuario.jsp";
            }

            String mensaje = request.getParameter("mensaje");
            if (mensaje == null) {
                mensaje = "";
            }

            TEST_Alumno alum = new TEST_Alumno();

            String Fecha = alum.CambioDeFecha(1);

        %>

        <form method="post" class="formGenerarReporte" action="Control_Generar_Reporte.jsp" >
            <label for="txtUsuario" class="AgregarAlumno">Generar Reporte De Horas </label>

            <H2>
                <b style="color:#FF0000;"> Advertencia: </b> Esta funcion generara un reporte con el total de 
                horas hechas en el periodo 
                <br>
                Ultima Fecha de modificacion: <%=Fecha%>
            </H2>


            

            <table border="0">
                <tr>
                    <td  WIDTH="20" HEIGHT="50"> </td>
                    <td  WIDTH="100" HEIGHT="20" ></td>
                    <td  WIDTH="200" HEIGHT="20" >Fecha de corte de reporte: </td>
                    <td  WIDTH="100" HEIGHT="20" >   <input class="caja" required="" id="date" type="date" name="FechaFin"> </td>
                </tr>

                <tr>
                    <td  WIDTH="20" HEIGHT="50"> </td>
                    <td  WIDTH="200" HEIGHT="20" ></td>
                    <td  WIDTH="100" HEIGHT="20" >Fecha de inicio de reporte: </td>
                    <td  WIDTH="100" HEIGHT="20" >   <input class="caja" required="" id="date" type="date" name="FechaInicio"> </td>

                </tr>
                
                <tr>
                    <td  WIDTH="20" HEIGHT="50"> </td>
                    <td  WIDTH="200" HEIGHT="20" ></td>
                    <td  WIDTH="100" HEIGHT="20" >       Horas restantes: </td>
                    <td  WIDTH="100" HEIGHT="20" >  <input class="caja"  type="number" value="0" name="Horas_Restantes"> </td>
                    
                </tr>
                
            </table>


            <br>

            <table border="0">
                <tr>
                    <td  WIDTH="20" HEIGHT="20"> </td>
                    <td  WIDTH="300" HEIGHT="20" ></td>
                    <td  WIDTH="100" HEIGHT="20" ><center> <a class="boton" href="<%=cancelar%>" >Regresar</a> </center> </td>
                    <td  WIDTH="100" HEIGHT="20" > <input align="center" class="boton" type="submit"   value="Aceptar" > </td>
                    </tr>
            </table>

            <br>
            <table border="0" >
                <tr>
                    <td  WIDTH="590" HEIGHT="30" class="texto" > <b> <center>  <%= mensaje%> </center> </b></td>
                </tr>

            </table>

        </form>
    </body>
</html>
