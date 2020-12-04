<%--
Document   : Alumno_Agregar
    Created on : 20/05/2019, 12:24:09 PM
    Author     : labsoft005
--%>

<!DOCTYPE html>
<html lang="es">
    <head>
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

            String x = session.getAttribute("Usuario") + "";
            String cancelar = "", visible = "";
            if (x.equals("0")) {
                cancelar = "Menu_Administrador.jsp";
                visible = "display:inline";
            }

            if (x.equals("1")) {
                cancelar = "Menu_Usuario.jsp";
                visible = "display:none";
            }

            String mensaje = request.getParameter("mensaje");
            if (mensaje == null) {
                mensaje = "";
            }
        %>

        <form class="formAgregar" action="Control_De_Alumno_Agregar.jsp"  enctype="multipart/form-data" method="post" >
            <label for="txtUsuario" class="AgregarAlumno">Agregar Alumno </label>
            <br>

            <table border="0">



                <tr>

                    <td rowspan="7" WIDTH="20" HEIGHT="250"> </td>
                    <td rowspan="6" WIDTH="200" height="250" id="list" >  </td>
                    <td class="texto"  height="20">Matricula: </td>
                    <td><input type="text" name="txtMatricula"  placeholder="Matricula" required="" class="caja"></td>
                </tr>

                <tr>

                    <td class="texto" height="20"> Nombre: </td>
                    <td WIDTH="220" ><input type="text" name="txtNombre" id="" placeholder="Nombre" required="" class="caja"></td>
                </tr>

                <tr>

                    <td class="texto" height="20">Ap Paterno: </td>
                    <td  ><input type="text" name="txtApPaterno" id="" placeholder="Apellido Paterno" required="" class="caja"></td>

                </tr>

                <tr>

                    <td class="texto" height="20">Ap Materno: </td>
                    <td WIDTH="220" ><input type="text" name="txtApMaterno" id="" placeholder="Apellido Materno" required="" class="caja"></td>

                </tr>

                <tr>

                    <td class="texto" height="20" >Semestre: </td>
                    <td><select name="JopSemestre" class="caja" >
                            <option >1</option> 
                            <option >2</option>
                            <option >3</option>
                            <option >4</option> 
                            <option >5</option>
                            <option >6</option>
                            <option >7</option> 
                            <option >8</option>
                            <option >9</option> 
                            <option >10</option>
                        </select></td>
                </tr>

                <tr>

                    <td class="texto" height="20" >Carrera: </td>
                    <td><select name="JopCarrera" class="caja" >
                            <option >Acuicultura</option> 
                            <option >Agricola</option>
                            <option >Computacion</option>
                            <option >Diseno</option>
                            <option >Matematicas</option>
                            <option >Mecatronica</option>
                            <option >Zootecnia</option>
                        </select></td>
                </tr>




            </table>


            <table border="0">
                <tr>
                    <td  WIDTH="20" HEIGHT="20"  > </td>
                    <td WIDTH="200" HEIGHT="20"  > <center> <input  type="file" name="DireccionArchivo" id="files" value="Buscar"  style="<%=visible%>"> </center> </td>
                <td  WIDTH="100" HEIGHT="20" > <center> <a class="boton" href="<%=cancelar%>">Regresar</a>  </center> </td>
                <td  WIDTH="100" HEIGHT="20" > <input align="center" class="boton" type="submit"   value="Aceptar" > </td>
                </tr>

            </table>


            <table border="0" >
                <tr>
                    <td  WIDTH="560" HEIGHT="20" class="texto" ><b> <center>  <%= mensaje%> </center> </b> </td>

                </tr>

            </table>




            <script>
                function archivo(evt) {
                    var files = evt.target.files; // FileList object

                    // Obtenemos la imagen del campo "file".
                    for (var i = 0, f; f = files[i]; i++) {
                        //Solo admitimos imágenes.
                        if (!f.type.match('image.*')) {
                            continue;
                        }

                        var reader = new FileReader();

                        reader.onload = (function (theFile) {
                            return function (e) {
                                // Insertamos la imagen
                                document.getElementById("list").innerHTML = ['<img WIDTH="190" HEIGHT="240" src="', e.target.result, '" title="', escape(theFile.name), '"/>'].join('');
                            };
                        })(f);

                        reader.readAsDataURL(f);
                    }
                }

                document.getElementById('files').addEventListener('change', archivo, false);
            </script>


        </form>



    </body>
</html>

