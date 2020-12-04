<%--Document   : Control_De_Sesion
    Created on : 9/05/2019, 11:55:31 PM
    Author     : labsoft005
--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Login"%>
<%@page import="Biblioteca.Unpa.LB.EL.LoginUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            //obtener todos los datos del login
            String usuario = request.getParameter("txtUsuario");
            String contrasenia = request.getParameter("txtPassword");

            LoginUsuario LU = new LoginUsuario();
            LU.setNombre(usuario);
            LU.setPassw(contrasenia);

            TEST_Login tl = new TEST_Login();

            if (tl.Login(LU) == 0) {
                session.setAttribute("Usuario", 0);
        %>
        <jsp:forward page="Menu_Administrador.jsp"> 
            <jsp:param name="idusuario" value="" />
        </jsp:forward> 

        <% }

            if (tl.Login(LU) == 1) {
                session.setAttribute("Usuario", 1);
        %>
        <jsp:forward page="Menu_Usuario.jsp"> 
            <jsp:param name="idusuario" value="" />
        </jsp:forward> 

        <% }

            if (tl.Login(LU) == 2) {
        %>
        <jsp:forward page="index.jsp"> 
            <jsp:param name="mensaje" value="LO SENTIMOS,No existe el usuario en el sistema" />
        </jsp:forward> 

        <% }%>


    </body>
</html>
