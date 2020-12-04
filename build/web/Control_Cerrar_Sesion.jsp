<%-- 
    Document   : Control_Cerrar_Sesion
    Created on : 8/07/2019, 01:33:41 PM
    Author     : alumno04
onchange="preview(this)
--%>

<%

    session.setAttribute("Usuario", null);
%>
<jsp:forward page="index.jsp"> 
    <jsp:param name="mensaje" value="Sesion cerrada" />
</jsp:forward> 

