<%-- 
    Document   : Alumno_Eliminar
    Created on : 21/05/2019, 03:57:46 PM
    Author     : alumno04
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Alumno</title>
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
            String visible = "display:none";
            String buscar = "display:inline";
            String editable = "";

            String matricula = request.getParameter("matricula");
            String nombre = request.getParameter("nombre");
            String appaterno = request.getParameter("ApPaterno");
            String apmaterno = request.getParameter("ApMaterno");
            String carrea = request.getParameter("Carrera");
            String semestre = request.getParameter("Semestre");
            String img = request.getParameter("IMG");

            if (mensaje == null) {
                mensaje = "";
                matricula = "";
                nombre = "";
                appaterno = "";
                apmaterno = "";
                carrea = "";
                semestre = "";
                img = "img/user2.png";
            } else {
                if (mensaje.equals("1")) {
                    System.out.println("REGRESO BIEN");
                    buscar = "display:none";
                    visible = "display:inline";
                    editable = "readonly=" + "readonly " + " ";
                    mensaje = "";
                }

                if (mensaje.equals("2")) {
                    editable = "";
                    System.out.println("REGRESO BIEN x 2");
                    buscar = "display:inline";
                    visible = "display:none";
                    mensaje = "Alumno Eliminado";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";

                }

                if (mensaje.equals("3")) {
                    mensaje = "El Alumno No Existe ";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";
                }
                if (mensaje.equals("4")) {
                    mensaje = "La matricula excede el tamaño de 8";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    carrea = "";
                    semestre = "";
                    img = "img/user2.png";

                }
            }

        %>


        <form action="Control_Alumno_Eliminar.jsp"  method="post" class="FormEliminar"> 
            <label for="txtUsuario" class="AgregarAlumno">Eliminar Alumno </label>
            <br>

            <table border="0">

                <tr  border="0">
                    <td rowspan="7" WIDTH="20" HEIGHT="250"> </td>
                    <td rowspan="6" width="200" height="240" >  <img src="<%=img%>" width="190" height="230"/> </td>
                    <td class="texto"  height="20">Matricula: </td>
                    <td><input <%out.print(editable);%> type="text"   name="txtMatricula" value="<%=matricula%>" placeholder="Matricula" required="" class="caja"></td>
                    <td  WIDTH="50" HEIGHT="20" ><input  align="center" style="<%=buscar%>" type="submit" name="Buscar" value="Buscar" class="boton">  </td>
                </tr>

                <tr>
                    <td class="texto" height="20"> Nombre: </td>
                    <td WIDTH="220" ><input type="text" name="txtNombre" value="<%=nombre%>" id="" placeholder="Nombre" readonly="readonly" class="caja"></td>
                    <td  WIDTH="50" HEIGHT="20" > <input style="display:none" type="text" name="imagen" value="<%=img%>" > </td>

                </tr>


                <tr>
                    <td class="texto" height="20">Ap Paterno: </td>
                    <td  ><input type="text" name="txtApPaterno" id="" value="<%out.print(appaterno);%>" placeholder="Apellido Paterno" readonly="readonly" class="caja"></td>

                </tr>
                <tr>
                    <td class="texto" height="20">Ap Materno: </td>
                    <td WIDTH="220" ><input type="text" name="txtApMaterno" id="" value="<%out.print(apmaterno);%>" placeholder="Apellido Materno" readonly="readonly" class="caja"></td>

                </tr>
                <tr> 
                    <td class="texto" height="20" >Semestre: </td>
                    <td><input readonly="readonly" type="text" name="txtSemestre" id="" placeholder="Semestre" value="<%=semestre%>" class="caja"> </td>
                </tr>

                <tr> 
                    <td class="texto" height="20" >Carrera: </td>
                    <td><input readonly="readonly" type="text" name="txtCarrera" id="" placeholder="Carrera" value="<%=carrea%>" class="caja">  </td>
                </tr>






            </table>


            <table border="0">
                <tr>
                    <td  WIDTH="20"  HEIGHT="50"> </td>
                    <td  WIDTH="300" HEIGHT="50" ></td>
                    <td  WIDTH="100" HEIGHT="50" > <center> <a class="boton" href="<%=cancelar%>">Regresar</a>   </center>  </td>
                <td  WIDTH="100"  HEIGHT="50" > <input align="center" style="<%=visible%>" type="submit" name="Eliminar" value="Eliminar" class="boton">  </td>

                </tr>

            </table>


            <table  border="0">
                <tr>

                    <td  WIDTH="640" HEIGHT="20" class="texto"> <b><center> <%= mensaje%>   </center> </b></td>

                </tr>

            </table>

        </form>
    </body>
</html>
