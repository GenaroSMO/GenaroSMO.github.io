<%-- 
    Document   : Registro_de_Horas_Eliminar
    Created on : 20/08/2019, 12:44:57 PM
    Author     : DELL02



--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/EstilosRegistroDeHoras.css">
        <title>Registro de horas</title>
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

            String matric = request.getParameter("matric");
            String Mensaje = request.getParameter("mensaje");
            String Alumno = request.getParameter("nombre");
            // String Apellidos = request.getParameter("apellidos");
            // String Carrera = request.getParameter("carrera");
            String IMGAlumno = request.getParameter("IMG");
            String Hora_de_Entrada = request.getParameter("Hora_de_Entrada");;

            String IMGCarrera = "background: url('Fondos_De_Las_Carreras/ELIMINAR.png');";

            String visible = "display:none";
            String buscar = "display:inline";

            if (Mensaje == null) {
                Mensaje = "";
                Alumno = "";
                IMGAlumno = "img/user2.png";
                Hora_de_Entrada = "";

            } else {

                if (Mensaje.equals("1")) {
                    // si  encontro el alumno
                    Mensaje = "Alumno Dentro de biblioteca";
                    visible = "display:inline";
                    buscar = "display:none";
                }

                if (Mensaje.equals("2")) {
                    // el alumno no esta dentro de biblioteca
                    Alumno = "";
                    IMGAlumno = "img/user2.png";
                    Hora_de_Entrada = "";

                    Mensaje = "el alumno no esta dentro de biblioteca";
                }

                if (Mensaje.equals("3")) {

                    Alumno = "";
                    IMGAlumno = "img/user2.png";
                    Hora_de_Entrada = "";

                    Mensaje = "La matricula exede el tamaño";
                }

                if (Mensaje.equals("4")) {

                    Alumno = "";
                    IMGAlumno = "img/user2.png";
                    Hora_de_Entrada = "";

                    Mensaje = "Se Elimino Registro de alumno";
                }

            }

        %>


        <form action="Control_Registro_de_Horas_Eliminar.jsp"  method="post" style="<%=IMGCarrera%>" > 
            <br>
            <table border="0">
                <tr  >     
                    <td WIDTH="10" HEIGHT="250"> </td>
                    <td WIDTH="200"> <img src="<%=IMGAlumno%>" width="190" height="240"/> </td>
                    <td WIDTH="100"> 
                        <table border="0">
                            <tr> 
                                <td  WIDTH="100"  HEIGHT="100">  <img src="Fondos_De_Las_Carreras/escudo.jpg" width="90" height="90"/></td>
                            </tr>  
                            <tr> 
                                <td   HEIGHT="150"></td>
                            </tr>
                        </table>
                    </td>
                    <td WIDTH="490"> 
                        <table border="0">
                            <tr> 
                                <td WIDTH="490" HEIGHT="50" class="LBbiblioteca" ><label> <b> B I B L I O T E C A </b></label> </td>
                            </tr>  
                            <tr> 
                                <td   HEIGHT="10"> <input type="text" name="txtMatriAux"  style="display:none" value="<%=matric%>" > </td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30" class="Nombre_Del_Alumno"  >  <%= Alumno%>  </td>
                            </tr>


                            <tr> 
                                <td   HEIGHT="30" class="Apellidos_Del_Alumno"> <%=Hora_de_Entrada%> </td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30" class="Mensaje" >  <%= Mensaje%> </td>
                            </tr>



                            <tr> 
                                <td   HEIGHT="30"></td>
                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

            <br>

            <table border="0">
                <tr>     
                    <td  WIDTH="10"  HEIGHT="30"></td>
                    <td  WIDTH="200"> <input type="text" name="txtMatricula"   class="caja" autofocus> </td>
                    <td  WIDTH="50" HEIGHT="20" ><input  align="center" style="<%=buscar%>" type="submit" name="Buscar" value="Buscar" class="boton">  </td>
                    <td  WIDTH="200"  ></td>
                    <td   HEIGHT="30" class="Mensaje" > <input align="center" style="<%=visible%>" type="submit" name="Eliminar" value="Eliminar Registro" class="boton_Eliminar">  </td>


                </tr>
            </table>

            <br>

            <table border="0">
                <tr>     
                    <td  WIDTH="10"  HEIGHT="30"></td>
                    <td  WIDTH="200"  HEIGHT="50">  <center> <a class="boton" href="<%=cancelar%>" >Regresar</a>   </center></td>
                    <td  WIDTH="300"  HEIGHT="50"></td>
                    <td  WIDTH="300" class="Carrera" style="color:rgb(255,255,255);" > Eliminar Registro </td>
                </tr>
            </table>

        </form>


    </body>
</html>
