<%-- 
    Document   : Alumno_Configuracion_de_Hora_Agric
    Created on : 5/09/2019, 11:25:43 AM
    Author     : DELL02
--%>

<%@page import="Biblioteca.Unpa.LB.EL.Configuracion_De_Hora"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Biblioteca.Unpa.LB.EL.Registro_Hora"%>
<%@page import="java.util.List"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">

        <TITLE> Agregar Alumno</TITLE>
    </head>
    <body  >
        <%

            if (session.getAttribute("Usuario") == null) {
        %>
        <jsp:forward page="index.jsp"> 
            <jsp:param name="mensaje" value="Lo Sentimos, No han iniciado sesion " />
        </jsp:forward> 
        <%
            }
            System.out.println("************************************ Alumno_Configuracion_de_Hora **************************************************");
            String mensaje = request.getParameter("mensaje");
            if (mensaje == null) {
                mensaje = "";
            }
            String matriz[][] = new String[10][5];
            List<Configuracion_De_Hora> Configuracion_De_Hora_Lst = new ArrayList<Configuracion_De_Hora>();
            try {
                TEST_Alumno TA = new TEST_Alumno();

                Configuracion_De_Hora_Lst = TA.Alumno_Configuracion_de_HoraLista(4);

                matriz[0][0] = "<option >1</option> ";
                matriz[0][1] = "<option >2</option> ";
                matriz[0][2] = "<option >3</option> ";
                matriz[0][3] = "<option >4</option> ";
                matriz[0][4] = "<option >5</option> ";

                matriz[1][0] = "<option >1</option> ";
                matriz[1][1] = "<option >2</option> ";
                matriz[1][2] = "<option >3</option> ";
                matriz[1][3] = "<option >4</option> ";
                matriz[1][4] = "<option >5</option> ";

                matriz[2][0] = "<option >1</option> ";
                matriz[2][1] = "<option >2</option> ";
                matriz[2][2] = "<option >3</option> ";
                matriz[2][3] = "<option >4</option> ";
                matriz[2][4] = "<option >5</option> ";

                matriz[3][0] = "<option >1</option> ";
                matriz[3][1] = "<option >2</option> ";
                matriz[3][2] = "<option >3</option> ";
                matriz[3][3] = "<option >4</option> ";
                matriz[3][4] = "<option >5</option> ";

                matriz[4][0] = "<option >1</option> ";
                matriz[4][1] = "<option >2</option> ";
                matriz[4][2] = "<option >3</option> ";
                matriz[4][3] = "<option >4</option> ";
                matriz[4][4] = "<option >5</option> ";

                matriz[5][0] = "<option >1</option> ";
                matriz[5][1] = "<option >2</option> ";
                matriz[5][2] = "<option >3</option> ";
                matriz[5][3] = "<option >4</option> ";
                matriz[5][4] = "<option >5</option> ";

                matriz[6][0] = "<option >1</option> ";
                matriz[6][1] = "<option >2</option> ";
                matriz[6][2] = "<option >3</option> ";
                matriz[6][3] = "<option >4</option> ";
                matriz[6][4] = "<option >5</option> ";

                matriz[7][0] = "<option >1</option> ";
                matriz[7][1] = "<option >2</option> ";
                matriz[7][2] = "<option >3</option> ";
                matriz[7][3] = "<option >4</option> ";
                matriz[7][4] = "<option >5</option> ";

                matriz[8][0] = "<option >1</option> ";
                matriz[8][1] = "<option >2</option> ";
                matriz[8][2] = "<option >3</option> ";
                matriz[8][3] = "<option >4</option> ";
                matriz[8][4] = "<option >5</option> ";

                matriz[9][0] = "<option >1</option> ";
                matriz[9][1] = "<option >2</option> ";
                matriz[9][2] = "<option >3</option> ";
                matriz[9][3] = "<option >4</option> ";
                matriz[9][4] = "<option >5</option> ";

                int z = 0;
                for (int a = 0; a < Configuracion_De_Hora_Lst.size(); a++) {

                    if (Configuracion_De_Hora_Lst.get(a).getSemestre1() == 1) {
                        matriz[z][0] = "<option selected> 1 </option>";
                    } else {
                        if (Configuracion_De_Hora_Lst.get(a).getSemestre1() == 2) {
                            matriz[z][1] = "<option selected> 2 </option>";
                        } else {
                            if (Configuracion_De_Hora_Lst.get(a).getSemestre1() == 3) {
                                matriz[z][2] = "<option selected> 3 </option>";
                            } else {
                                if (Configuracion_De_Hora_Lst.get(a).getSemestre1() == 4) {
                                    matriz[z][3] = "<option selected> 4 </option>";
                                } else {
                                    if (Configuracion_De_Hora_Lst.get(a).getSemestre1() == 5) {
                                        matriz[z][4] = "<option selected> 5 </option>";
                                    }
                                }
                            }
                        }
                    }

                    z++;
                }

            } catch (Exception e) {
                System.out.println("------A problem occurred while connecting to the database.");
                System.out.println(e.toString());
            }


        %>

        <form class="formConfiguracionDeHora" action="Control_Alumno_configuracion_de_Hora.jsp"   method="post" >
            <label for="txtUsuario" class="AgregarAlumno"> Configuracion de hora de biblioteca </label>
            <H2>
                <b style="color:#FF0000;"> Advertencia: </b> Esta funcion Cambiara automaticamente las horas de biblioteca por carrera pero no debe de haber horas registradas en el sistema
                <br>

            </H2>




            <table border="0">

                <tr>
                    <td  WIDTH="20" HEIGHT="60"  > </td>
                    <td class="texto" height="20" >1° Semestre </td>
                    <td>
                        <select name="JopS001" class="caja" >
                            <%                                out.print(matriz[0][0]);
                                out.print(matriz[0][1]);
                                out.print(matriz[0][2]);
                                out.print(matriz[0][3]);
                                out.print(matriz[0][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>

                    <td class="texto" height="20" >2° Semestre </td>

                    <td>
                        <select name="JopS002" class="caja" >
                            <%
                                out.print(matriz[1][0]);
                                out.print(matriz[1][1]);
                                out.print(matriz[1][2]);
                                out.print(matriz[1][3]);
                                out.print(matriz[1][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>
                </tr>

                <tr>
                    <td  WIDTH="20" HEIGHT="60"  > </td>
                    <td class="texto" height="20" >3° Semestre </td>
                    <td>
                        <select name="JopS003" class="caja" >
                            <%
                                out.print(matriz[2][0]);
                                out.print(matriz[2][1]);
                                out.print(matriz[2][2]);
                                out.print(matriz[2][3]);
                                out.print(matriz[2][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>

                    <td class="texto" height="20" >4° Semestre </td>

                    <td>
                        <select name="JopS004" class="caja" >
                            <%
                                out.print(matriz[3][0]);
                                out.print(matriz[3][1]);
                                out.print(matriz[3][2]);
                                out.print(matriz[3][3]);
                                out.print(matriz[3][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>
                </tr>

                <tr>
                    <td  WIDTH="20" HEIGHT="60"  > </td>
                    <td class="texto" height="20" >5° Semestre </td>
                    <td>
                        <select name="JopS005" class="caja" >
                            <%
                                out.print(matriz[4][0]);
                                out.print(matriz[4][1]);
                                out.print(matriz[4][2]);
                                out.print(matriz[4][3]);
                                out.print(matriz[4][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>

                    <td class="texto" height="20" >6° Semestre </td>

                    <td>
                        <select name="JopS006" class="caja" >
                            <%
                                out.print(matriz[5][0]);
                                out.print(matriz[5][1]);
                                out.print(matriz[5][2]);
                                out.print(matriz[5][3]);
                                out.print(matriz[5][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>
                </tr>

                <tr>
                    <td  WIDTH="20" HEIGHT="60"  > </td>
                    <td class="texto" height="20" >7° Semestre </td>
                    <td>
                        <select name="JopS007" class="caja" >
                            <%
                                out.print(matriz[6][0]);
                                out.print(matriz[6][1]);
                                out.print(matriz[6][2]);
                                out.print(matriz[6][3]);
                                out.print(matriz[6][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>

                    <td class="texto" height="20" >8° Semestre </td>

                    <td>
                        <select name="JopS008" class="caja" >
                            <%
                                out.print(matriz[7][0]);
                                out.print(matriz[7][1]);
                                out.print(matriz[7][2]);
                                out.print(matriz[7][3]);
                                out.print(matriz[7][4]);
                            %>
                        </select>
                    </td>
                    

                    <td  WIDTH="20" HEIGHT="20"  > </td>
                    
                    
                </tr>
                
                <tr>
                    <td  WIDTH="20" HEIGHT="60"  > </td>
                    <td class="texto" height="20" >9° Semestre </td>
                    <td>
                        <select name="JopS009" class="caja" >
                            <%
                                out.print(matriz[8][0]);
                                out.print(matriz[8][1]);
                                out.print(matriz[8][2]);
                                out.print(matriz[8][3]);
                                out.print(matriz[8][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>

                    <td class="texto" height="20" >10° Semestre </td>

                    <td>
                        <select name="JopS0010" class="caja" >
                            <%
                                out.print(matriz[9][0]);
                                out.print(matriz[9][1]);
                                out.print(matriz[9][2]);
                                out.print(matriz[9][3]);
                                out.print(matriz[9][4]);
                            %>
                        </select>
                    </td>

                    <td  WIDTH="20" HEIGHT="20"  > </td>
                </tr>

            </table>



            <table border="0">
                <tr>
                    <td  WIDTH="20" HEIGHT="20"  > </td>
                    <td WIDTH="200" HEIGHT="20"  > <input type="text" name="IdCarrera" value="C004" style="display:none" ></td>
                    <td WIDTH="200" HEIGHT="20"  > <input type="text" name="Ventana" value="Alumno_Configuracion_de_Hora_Agric.jsp"  style="display:none"> </td>
                    <td  WIDTH="100" HEIGHT="20" > <center> <a class="boton" href="Menu_Administrador.jsp">Regresar</a>  </center> </td>
                <td  WIDTH="100" HEIGHT="20" > <input align="center" class="boton" type="submit"   value="Aceptar" > </td>
                </tr>

            </table>

            

            <table border="0" >
                <tr>
                    <td  WIDTH="690" HEIGHT="30" class="texto" ><b> <center>  <%= mensaje%> </center> </b> </td>

                </tr>             

            </table>





        </form>



    </body>
</html>

