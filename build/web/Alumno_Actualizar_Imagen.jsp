<%-- 
    Document   : Alumno_Actualizar_Imagen
    Created on : 9/08/2019, 10:20:39 AM
    Author     : DELL02
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet"  href="CSS/EstilosAlumnos.css">
        <title>JSP Page</title>
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

            String mensaje = request.getParameter("mensaje");
            String visible = "display:none";
            String enctype = "";
            String requerido = "";

            String matricula = request.getParameter("matricula");
            String nombre = request.getParameter("nombre");
            String appaterno = request.getParameter("ApPaterno");
            String apmaterno = request.getParameter("ApMaterno");
            String img = request.getParameter("IMG");

            if (mensaje == null) {
                mensaje = "";
                matricula = "";
                nombre = "";
                appaterno = "";
                apmaterno = "";
                img = "img/user2.png";
                requerido = "";
            } else {
                if (mensaje.equals("1")) {
                    System.out.println("REGRESO BIEN");

                    visible = "display:inline";

                    enctype = "enctype=" + "multipart/form-data" + "";
                    mensaje = "";
                    requerido = "required";
                }

                if (mensaje.equals("2")) {

                    System.out.println("REGRESO BIEN x 2");

                    visible = "display:none";
                    mensaje = "Foto del alumno Actualizada";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    img = "img/user2.png";
                    requerido = "";

                }

                if (mensaje.equals("3")) {
                    mensaje = "El Alumno No Existe ";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    img = "img/user2.png";
                }

                if (mensaje.equals("4")) {
                    mensaje = "Ya existe una imagen con ese nombre,Cambie el nombre o seleccione otra ";
                    matricula = "";
                    nombre = "";
                    appaterno = "";
                    apmaterno = "";
                    img = "img/user2.png";
                }

            }
        %>

        <form  action="Control_Alumno_Actualizar_Foto.jsp"  method="post" <%out.print(enctype);%>  class="formActualizarFoto">
            <label for="txtUsuario" class="AgregarAlumno">Actualizar Foto De Alumno </label>
            <br>

            <table border="0">
                <tr>
                    <td  WIDTH="130" HEIGHT="20"> </td>
                    <td class="texto"  height="20" >Matricula: </td>
                    <td WIDTH="230"  ><input  type="text" name="txtMatricula"    class="caja"></td>
                    <td  WIDTH="50" HEIGHT="20" ><input  align="center"  type="submit" name="Buscar" value="Buscar" class="boton">  </td>
                </tr>

                <tr>
                    <td  HEIGHT="30"  colspan="4"><center> <b>  <%=matricula + " " + nombre + " " + appaterno + " " + apmaterno%> </b> </center></td>
                </tr>
            </table>

            <br>
            <table border="0">
                <tr>
                    <td   HEIGHT="250" WIDTH="60"> </td>
                    <td                WIDTH="200" > <img src="<%=img%>" width="190" height="230"/> </td>

                    <td                WIDTH="30"  > <center> ➜ </center> </td>

                <td                WIDTH="200" id="list" > </td>

                </tr>

                <tr>
                    <td   HEIGHT="20" WIDTH="60"> </td>
                    <td                WIDTH="200" > <input  style="display:none"  type="text" name="txtImagen"   value="<%=img%>" > </td>

                    <td                WIDTH="30"  ><input  type="text" style="display:none" name="txtMatri"   value="<%=matricula%>" >  </td>

                    <td                WIDTH="200" > <center> <input style="<%=visible%>" <%out.print(requerido);%> type="file" name="DireccionArchivo" id="files" value="Buscar" > </center> </td>

                </tr>


            </table>

            <br>
            
            <table border="0">
                <tr>
                    <td   HEIGHT="20" WIDTH="300" > </td>
                    <td               WIDTH="100"> <center> <a class="boton" href="Menu_Administrador.jsp">Regresar</a>  </center> </td>
                <td               WIDTH="100"> <input  style="<%=visible%>" align="center" class="boton" type="submit" name="Aceptar"  value="Aceptar" > </td>
                </tr>

            </table>

            <br>
            
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
