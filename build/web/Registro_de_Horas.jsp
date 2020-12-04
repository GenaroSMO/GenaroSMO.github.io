<%-- 
    Document   : Registro_de_Horas
    Created on : 10/05/2019, 12:44:05 AM
    Author     : labsoft005
iso-8859-1
iso-8859-8

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
            System.out.println("********************************************************************************");
            String Alumno = request.getParameter("nombre");
            String Apellidos = request.getParameter("apellidos");
            String Carrera = request.getParameter("carrera");
            String IMGAlumno = request.getParameter("IMG");
            String Mensaje = request.getParameter("mensaje");
            String T_Horas = request.getParameter("T_Horas");

            String IMGCarrera = "";

            String F_Carrera = "";

            if (Alumno == null) {
                System.out.println("ENTRO AL IF ....");
                Alumno = "";
                Apellidos = "";
                Carrera = "";
                System.out.println("Mensaje: " + Mensaje);

                if (Mensaje == null) {
                    Mensaje = "";
                }

                T_Horas = "";
                IMGAlumno = "img/user2.png";
                F_Carrera = "NULL";
            } else {
                F_Carrera = Carrera;
            }

            IMGCarrera = "background: url('Fondos_De_Las_Carreras/" + F_Carrera + ".png') ;";
            if (!T_Horas.equals("")) {
                if (Integer.parseInt(T_Horas) > 0) {
                    T_Horas = "El alumno debe " + T_Horas + " hrs";
                } else {
                    T_Horas = "El alumno no debe horas";
                }
            }
            System.out.println("IMG Carrera: " + IMGCarrera);
            System.out.println("TOTAL DE HORAS: " + T_Horas);

           


        %>


        <form action="RH_Control.jsp"  method="post" style="<%=IMGCarrera%>" > 
            <br/>
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
                                <td   HEIGHT="10"></td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30" class="Nombre_Del_Alumno" >  <%= Alumno%>  </td>
                            </tr>


                            <tr> 
                                <td   HEIGHT="30" class="Apellidos_Del_Alumno"> <%out.print(Apellidos);%> </td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30" class="Mensaje" >  <%= Mensaje%> </td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30" class="Mensaje" > <%= T_Horas%></td>
                            </tr>

                            <tr> 
                                <td   HEIGHT="30"></td>
                            </tr>

                        </table>

                    </td>
                </tr>
            </table>

            <br />

            <table border="0">
                <tr>     
                    <td  WIDTH="10"  HEIGHT="30"></td>
                    <td  WIDTH="200"> <input type="text" name="txtMatricula"   placeholder="Matricula" required class="caja" autofocus> </td>
                </tr>
            </table>

            <br />


            <table border="0">
                <tr>     
                    <td  WIDTH="10"  HEIGHT="30"></td>
                    <td  WIDTH="200"  HEIGHT="50">  <center> <a class="boton" href="<%=cancelar%>" >Regresar</a>   </center></td>
                <td  WIDTH="390"  HEIGHT="50"></td>
                <td  WIDTH="210" class="Carrera" style="color:rgb(255,255,255);" name="txtCarrera"> <%=Carrera%> </td>
                </tr>
            </table>

        </form>


    </body>
</html>
