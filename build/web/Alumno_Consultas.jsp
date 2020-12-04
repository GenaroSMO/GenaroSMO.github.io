<%-- 
    Document   : Alumno_Consultas
    Created on : 22/05/2019, 03:47:51 PM
    Author     : alumno04
--%>

<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/MenuInicio.css">
        <title>Lista de alumnos</title>
    </head>
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


    %>

    <body>
        <form  method="post">
            <div  id="div1" >
                <table border="1">



                    <%                        
                        String filas = "";
                        int numColumnas = 0;
                        List<Alumno> Alumno_Lst = new ArrayList<Alumno>();
                        try {
                            TEST_Alumno TA = new TEST_Alumno();

                            Alumno_Lst = TA.AlumnoLista();

                            numColumnas = Alumno_Lst.size();

                            String carrera = "Acuicultura";
                            int semestre = Integer.parseInt(Alumno_Lst.get(0).getSemestre());
                            //System.out.println(semestre + "      " + carrera);
                            int z = 1;
                            filas = filas + "<tr bgcolor= " + "#077B64" + " style= " + "color:rgb(255,255,255);" + " >   ";
                            filas = filas + "<td colspan=" + 7 + ">" + semestre + "°" + " " + carrera + "</td>";
                            filas = filas + "</tr>";

                            filas = filas + "<td WIDTH=" + 50 + ">" + z + "</td>";
                            filas = filas + "<td WIDTH=" + 150 + ">" + Alumno_Lst.get(0).getMatricula() + "</td>";

                            filas = filas + "<td WIDTH=" + 300 + ">" + Alumno_Lst.get(0).getAP_Paterno() + " " + Alumno_Lst.get(0).getAP_Materno() + "</td>";
                            filas = filas + "<td WIDTH=" + 300 + ">" + Alumno_Lst.get(0).getNombre() + "</td>";
                            filas = filas + "<td WIDTH=" + 100 + ">" + Alumno_Lst.get(0).getHE() + "</td>";
                            filas = filas + "<td WIDTH=" + 100 + ">" + Alumno_Lst.get(0).getHA() + "</td>";

                            for (int b = 1; b < numColumnas; b++) {
                                //colspan="2"
                                if (carrera.equals(Alumno_Lst.get(b).getCarrera())) {
                                    if (semestre == Integer.parseInt(Alumno_Lst.get(b).getSemestre())) {

                                        //System.out.println(Alumno_Lst.get(b).getMatricula() + " " + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + " " + Alumno_Lst.get(b).getNombre() + " " + Alumno_Lst.get(b).getHE() + " " + Alumno_Lst.get(b).getHA() + " ");
                                        filas = filas + "<tr>";
                                        filas = filas + "<td>" + z + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getMatricula() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getNombre() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getHE() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getHA() + "</td>";
                                        filas = filas + "</tr>";
                                        z++;
                                    } else {
                                        semestre = Integer.parseInt(Alumno_Lst.get(b).getSemestre());
                                        z = 1;
                                        //System.out.println(semestre + "      " + carrera);
                                        filas = filas + "<tr bgcolor= " + "#077B64" + " style= " + "color:rgb(255,255,255);" + " >   ";
                                        filas = filas + "<td colspan=" + 7 + ">" + semestre + "°" + " " + carrera + "</td>";
                                        filas = filas + "</tr>";
                                        //System.out.println(Alumno_Lst.get(b).getMatricula() + " " + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + " " + Alumno_Lst.get(b).getNombre() + " " + Alumno_Lst.get(b).getHE() + " " + Alumno_Lst.get(b).getHA() + " ");
                                        filas = filas + "<tr>";
                                        filas = filas + "<td>" + z + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getMatricula() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getNombre() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getHE() + "</td>";
                                        filas = filas + "<td>" + Alumno_Lst.get(b).getHA() + "</td>";
                                        filas = filas + "</tr>";
                                        z++;
                                    }

                                } else {
                                    carrera = Alumno_Lst.get(b).getCarrera();
                                    semestre = Integer.parseInt(Alumno_Lst.get(b).getSemestre());
                                    z = 1;
                                    //System.out.println(semestre + "      " + carrera);
                                    filas = filas + "<tr bgcolor= " + "#077B64" + " style= " + "color:rgb(255,255,255);" + " >   ";
                                    filas = filas + "<td colspan=" + 7 + ">" + semestre + "°" + " " + carrera + "</td>";
                                    filas = filas + "</tr>";
                                    // System.out.println(Alumno_Lst.get(b).getMatricula() + " " + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + " " + Alumno_Lst.get(b).getNombre() + " " + Alumno_Lst.get(b).getHE() + " " + Alumno_Lst.get(b).getHA() + " ");
                                    filas = filas + "<tr>";
                                    filas = filas + "<td>" + z + "</td>";
                                    filas = filas + "<td>" + Alumno_Lst.get(b).getMatricula() + "</td>";
                                    filas = filas + "<td>" + Alumno_Lst.get(b).getAP_Paterno() + " " + Alumno_Lst.get(b).getAP_Materno() + "</td>";
                                    filas = filas + "<td>" + Alumno_Lst.get(b).getNombre() + "</td>";
                                    filas = filas + "<td>" + Alumno_Lst.get(b).getHE() + "</td>";
                                    filas = filas + "<td>" + Alumno_Lst.get(b).getHA() + "</td>";
                                    filas = filas + "</tr>";
                                    z++;
                                }

                            }

                            out.print(filas);

                        } catch (Exception e) {
                            System.out.println("------A problem occurred while connecting to the database.");
                            System.out.println(e.toString());
                        }


                    %>

                </table>

            </div>


            <center> <a class="boton" href="<%=cancelar%>" >Regresar</a>   </center>  





        </form>


    </body>
</html>
