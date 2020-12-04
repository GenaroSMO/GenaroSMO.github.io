<%-- 
    Document   : Alumno_Actualizar
    Created on : 21/05/2019, 03:57:46 PM
    Author     : alumno04
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">
        <title>Actualizar Alumno</title>
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

            String[] Semestre = {"<option >1</option> ", "<option >2</option> ", "<option >3</option> ", "<option >4</option> ", "<option >5</option> ", "<option >6</option> ", "<option >7</option> ", "<option >8</option>" , "<option >9</option> ", "<option >10</option>"};

            String[] Carrera = {"<option >Acuicultura</option> ", "<option >Agricola</option>", "<option >Computacion</option> ", "<option >Diseno</option> ", "<option >Matematicas</option> ", "<option >Mecatronica</option> ", "<option >Zootecnia</option> "};

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
                    // System.out.println("Esta a punto de entrar a los if de carerra");
                    if (carrea.equals("Acuicultura")) {
                        Carrera[0] = "<option selected>Acuicultura</option>";
                    }
                    if (carrea.equals("Agricola")) {
                        Carrera[1] = "<option selected>Agricola</option>";
                    }
                    if (carrea.equals("Computacion")) {
                        Carrera[2] = "<option selected>Computacion</option>";
                    }
                    if (carrea.equals("Diseno")) {
                        Carrera[3] = "<option selected>Diseno</option>";
                    }
                    if (carrea.equals("Matematicas")) {
                        Carrera[4] = "<option selected>Matematicas</option>";
                    }
                    if (carrea.equals("Mecatronica")) {
                        Carrera[5] = "<option selected>Mecatronica</option>";
                    }
                    if (carrea.equals("Zootecnia")) {
                        Carrera[6] = "<option selected>Zootecnia</option>";
                    }

                    System.out.println("Esta a punto de entrar a los if de carerra");
                    if (semestre.equals("1")) {
                        Semestre[0] = "<option selected>1</option>";
                    }
                    if (semestre.equals("2")) {
                        Semestre[1] = "<option selected>2</option>";
                    }
                    if (semestre.equals("3")) {
                        Semestre[2] = "<option selected>3</option>";
                    }
                    if (semestre.equals("4")) {
                        Semestre[3] = "<option selected>4</option>";
                    }
                    if (semestre.equals("5")) {
                        Semestre[4] = "<option selected>5</option>";
                    }
                    if (semestre.equals("6")) {
                        Semestre[5] = "<option selected>6</option>";
                    }
                    if (semestre.equals("7")) {
                        Semestre[6] = "<option selected>7</option>";
                    }
                    if (semestre.equals("8")) {
                        Semestre[7] = "<option selected>8</option>";
                    }
                    if (semestre.equals("9")) {
                        Semestre[8] = "<option selected>9</option>";
                    }
                    if (semestre.equals("10")) {
                        Semestre[9] = "<option selected>10</option>";
                    }

                }

                if (mensaje.equals("2")) {
                    editable = "";
                    System.out.println("REGRESO BIEN x 2");
                    buscar = "display:inline";
                    visible = "display:none";
                    mensaje = "Alumno Actualizado";
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


                if (mensaje.equals("5")) {
                    editable = "";
                    System.out.println("REGRESO BIEN x 2");
                    buscar = "display:inline";
                    visible = "display:none";
                    mensaje = "ERROR , el alumno tiene horas registradas";
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


        <form action="Control_Alumno_Actualizar.jsp"  method="post" class="FormActualizar"> 
            <label for="txtUsuario" class="AgregarAlumno">Actualizar Alumno </label>
            <br>

            <table border="0">

                <tr  >
                    <td rowspan="7" WIDTH="20" HEIGHT="250"> </td>
                    <td rowspan="6" WIDTH="200" height="240" >  <img src="<%=img%>" width="190" height="230"/> </td>
                    <td class="texto"  height="20">Matricula: </td>
                    <td><input <%out.print(editable);%> type="text"   name="txtMatricula" value="<%=matricula%>" placeholder="Matricula" required="" class="caja"></td>
                    <td  WIDTH="50" HEIGHT="20" ><input  align="center" style="<%=buscar%>" type="submit" name="Buscar" value="Buscar" class="boton">  </td>
                </tr>

                <tr>
                    <td class="texto" height="20"> Nombre: </td>
                    <td WIDTH="220" ><input type="text" name="txtNombre" value="<%=nombre%>" id="" placeholder="Nombre"  class="caja"></td>
                    <td  WIDTH="50" HEIGHT="20" > <input style="display:none" type="text" name="imagen" value="<%=img%>" > </td>

                </tr>


                <tr>
                    <td class="texto" height="20">Ap Paterno: </td>
                    <td  ><input type="text" name="txtApPaterno" id="" value="<%=appaterno%>" placeholder="Apellido Paterno"  class="caja"></td>

                </tr>
                <tr>
                    <td class="texto" height="20">Ap Materno: </td>
                    <td WIDTH="220" ><input type="text" name="txtApMaterno" id="" value="<%=apmaterno%>" placeholder="Apellido Materno"  class="caja"></td>

                </tr>

                <tr>
                    <td class="texto" height="20" >Semestre: </td>
                    <td><select name="JopSemestre" class="caja" >
                            <%
                                out.print(Semestre[0]);
                                out.print(Semestre[1]);
                                out.print(Semestre[2]);
                                out.print(Semestre[3]);
                                out.print(Semestre[4]);
                                out.print(Semestre[5]);
                                out.print(Semestre[6]);
                                out.print(Semestre[7]);
                                out.print(Semestre[8]);
                                out.print(Semestre[9]);
                            %>
                        </select>
                    </td>
                </tr>

                <tr>

                    <td class="texto" height="20" >Carrera: </td>
                    <td><select name="JopCarrera"  class="caja" >
                            <%
                                out.print(Carrera[0]);
                                out.print(Carrera[1]);
                                out.print(Carrera[2]);
                                out.print(Carrera[3]);
                                out.print(Carrera[4]);
                                out.print(Carrera[5]);
                                out.print(Carrera[6]);
                            %>

                        </select>
                    </td>
                </tr>







            </table>


            <table border="0">
                <tr>
                    <td  WIDTH="20"  HEIGHT="50"> </td>
                    <td  WIDTH="200" HEIGHT="50" ></td>
                    <td  WIDTH="100" HEIGHT="50" ></td>
                    <td  WIDTH="100" HEIGHT="50" > <center> <a class="boton" href="<%=cancelar%>">Regresar</a>   </center>  </td>
                <td  WIDTH="100"  HEIGHT="50" > <input align="center" style="<%=visible%>" type="submit" name="Actualizar" value="Actualizar" class="boton">  </td>

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
