<%--Document   : index
    Created on : 9/05/2019, 11:22:24 PM
    Author     : labsoft005
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/estilos.css">
        <title>Biblioteca UNPA LB</title>
    </head>

    <body>
        <%
            String mensaje = request.getParameter("mensaje");
            if (mensaje == null) {
                mensaje = "";
            }
        %>
        <form action="Control_De_Sesion.jsp"  method="post">
            <label for="txtUsuario"> Inicio de sesión </label><br>
            <input type="text" name="txtUsuario" id="txtUsuario" placeholder="USUARIO"  value="BIBLIOTECA_UNPA_LB"  required> <br>
            <input type="password" name="txtPassword" id="txtPassword" placeholder="CONTRASENA"   value="r00tadmin" required> <br>
            <table border="0">
                <td  WIDTH="350" HEIGHT="30"><center> <b> <%=mensaje%> </b> </center>    </td>
            </table>
            <br>
            <center> <input align="center" type="submit" name="Entrar" value="Aceptar"> </center> 
        </form>
    </body>
</html>
