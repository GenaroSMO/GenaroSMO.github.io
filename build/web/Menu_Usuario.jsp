<%-- 
    Document   : Menu_Usuario
    Created on : 6/07/2019, 01:56:05 PM
    Author     : alumno04
--%>

<%@page import="Biblioteca.Unpa.LB.EL.Registro_Hora"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Registro_De_Horas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="JS/js.js" type="text/javascript" ></script>
        <link rel="stylesheet"  href="CSS/Menu_Inicio_Usuario.css">
        <title>Menu Usuario</title>
    </head>
    <%
        if (session.getAttribute("Usuario") == null) {
    %>
    <jsp:forward page="index.jsp"> 
        <jsp:param name="mensaje" value="Lo Sentimos, No han iniciado sesion " />
    </jsp:forward> 

    <%
        }
    %>


    <body>
        MENU USUARIO
        <br>

        <div id="header">
            <ul class="nav">

                <li><a >Registros</a>
                    <ul>
                        <li><a href="Registro_de_Horas.jsp">Regitros de horas</a></li>
                        <li><a href="Registro_de_Horas_Eliminar.jsp">Eliminar Registro de hora</a></li>
                        <li><a href="Registro_de_Horas_a_Planta_Alta.jsp">Registro de hora a cubiculos</a></li>
                    </ul>
                </li>
                <li><a >Gestion del alumno</a>
                    <ul>
                        <li><a href="Alumno_Agregar.jsp">Agregar alumno</a></li>
                        <li><a href="Alumno_Eliminar.jsp">Eliminar alumno</a></li>
                        <li><a href="Alumno_Actualizar.jsp">Actualizar alumno</a></li>
                        <li><a href="Alumno_Consultas.jsp">Consultar alumno</a></li>


                    </ul>
                </li>
                
                <li><a >Gestión de horas</a>
                    <ul>
                        <li><a href="Alumno_Generar_Reporte.jsp">Generar Reporte</a></li>
                        

                    </ul>

                </li>



                <li><a href="Control_Cerrar_Sesion.jsp">Cerrar Sesión</a></li>



            </ul>
        </div>

        <div  id="div2" >
            <table border="1">


                <tr  bgcolor= "#077B64" style="color:rgb(255,255,255);" >
                    <td WIDTH="38" > N° </td>
                    <td WIDTH="98" > Matricula </td>
                    <td WIDTH="250" > Alumno </td>
                    <td WIDTH="100" > Fecha</td>
                    <td WIDTH="50"  > Semana </td>
                    <td WIDTH="100" > Hora Entrada</td>
                    <td WIDTH="100" > Hora Salida</td>
                    <td WIDTH="130" > Status del alumno</td>
                </tr>


                <tbody id="filas">  

                </tbody>

            </table>

        </div>







    </body>
</html>
