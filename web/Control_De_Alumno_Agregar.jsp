<%-- 
    Document   : Control_De_Alumno_Agregar
    Created on : 20/05/2019, 12:50:58 PM
    Author     : labsoft005
--%>


<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="javax.servlet.annotation.MultipartConfig"%>
<%@page import="java.util.List"%>
<%@page import="Biblioteca.Unpa.LB.EL.Alumno"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Alumno"%>

<%

    String RutaIMGBD = "";
    String RutaIMG = "";

    String[] Arreglo = new String[7];
    int a = 0;

    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    List items = upload.parseRequest(request);
    System.out.println("********************************************************************");
    File fichero = null;
// Se recorren todos los items, que son de tipo FileItem

    for (Object item : items) {
        FileItem uploaded = (FileItem) item;
        // Hay que comprobar si es un campo de formulario. Si no lo es, se guarda el fichero
        // subido donde nos interese
        if (!uploaded.isFormField()) {
            // No es campo de formulario, guardamos el fichero en algún sitio
            boolean entra = true;
            if (uploaded.getName().equals("")) {
                System.out.println("NOMBRE DEL AIMAGEN ES NULL");
                RutaIMGBD = "img/tmp/user2.png";
                //fichero = new File("C:\\Biblioteca_UNPA_LB_MYSQL8\\web\\img\\tmp\\user2.png");
                //fichero = new File("C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\user2.png");
                fichero = new File("C:\\Tomcat\\webapps\\BISUCO\\img\\tmp\\user2.png");
                
                RutaIMG = fichero + "";
                System.out.println("Archivo   :" + uploaded.getName());
                System.out.println("RUTABD    :" + RutaIMGBD);
                System.out.println("RUTA      :" + RutaIMG);
                entra = false;
            } else {
                String aux = uploaded.getName();
                if (aux.contains("//")) {
                    aux = aux.substring(aux.lastIndexOf("\\") + 1, aux.length());
                }

                System.out.println(aux);
                RutaIMGBD = "img/tmp/" + aux;
                //System.out.println(uploaded.getName().lastIndexOf("\\"));
                //
                //fichero = new File("C:\\Biblioteca_UNPA_LB_MYSQL8\\web\\img\\tmp\\", aux);
                //fichero = new File("C:\\Users\\DELL02\\Tomcat\\webapps\\Biblioteca_UNPA_LB_MYSQL8\\img\\tmp\\"+ aux);
                fichero = new File("C:\\Tomcat\\webapps\\BISUCO\\img\\tmp\\"+ aux);
                
                //C:\\Tomcat\\webapps\\BISUCO
                RutaIMG = fichero + "";
                System.out.println("Archivo   :" + uploaded.getName());
                System.out.println("RUTABD    :" + RutaIMGBD);
                System.out.println("RUTA      :" + RutaIMG);
            }

            //System.out.println("entro");
            if (entra) {
                System.out.println("SALTO LA PARTE DE MOVER Y COPIAR EL ARCHIVO");
                if (!fichero.exists()) {
                    System.out.println("Se logro copiar y mover el archivo");
                    uploaded.write(fichero);

                } else {
                    System.out.println("Ya existe un archivo con ese nombre");
%>
<jsp:forward page="Alumno_Agregar.jsp"> 
    <jsp:param name="mensaje" value="Ya existe una imagen con ese nombre,Cambie el nombre o seleccione otra" />
</jsp:forward>
<%              }
            }

        } else {
            // es un campo de formulario, podemos obtener clave y valor
            //String key = uploaded.getFieldName();
            String valor = uploaded.getString();
            //System.out.println("key: " + key + " valor: " + valor);
            Arreglo[a] = valor;
            a++;
        }
    }

    if (Arreglo[0].length() > 8) {
        System.out.println("La matricula es muy grande");
        if (!RutaIMGBD.equals("img/tmp/user2.png")) {
            fichero.delete();
        }
%>
<jsp:forward page="Alumno_Agregar.jsp"> 
    <jsp:param name="mensaje" value="La matricula excede el tama&ntilde;o de 8" />
</jsp:forward>
<%
    }

    if (Arreglo[0].length() > 8) {
        System.out.println("ENTRO ------");
%>
<jsp:forward page="Alumno_Agregar.jsp"> 
    <jsp:param name="mensaje" value="La matricula excede el tamaño de 8" />
</jsp:forward>

<%
    }

    System.out.println("funciono la segunda bandera no entro al if");

    System.out.println("RUTABD     :" + RutaIMGBD);

    Alumno alumno = new Alumno();

    try {
        TEST_Alumno ta = new TEST_Alumno();

        alumno.setMatricula(Arreglo[0]);
        alumno.setNombre(Arreglo[1]);
        alumno.setAP_Paterno(Arreglo[2]);
        alumno.setAP_Materno(Arreglo[3]);
        // alumno.setSemestre(Integer.parseInt(Arreglo[4]));
        alumno.setFoto(RutaIMGBD);

        if (Arreglo[4].equals("1")) {
            alumno.setSemestre("S001");
        }
        if (Arreglo[4].equals("2")) {
            alumno.setSemestre("S002");
        }
        if (Arreglo[4].equals("3")) {
            alumno.setSemestre("S003");
        }
        if (Arreglo[4].equals("4")) {
            alumno.setSemestre("S004");
        }
        if (Arreglo[4].equals("5")) {
            alumno.setSemestre("S005");
        }
        if (Arreglo[4].equals("6")) {
            alumno.setSemestre("S006");
        }
        if (Arreglo[4].equals("7")) {
            alumno.setSemestre("S007");
        }
        if (Arreglo[4].equals("8")) {
            alumno.setSemestre("S008");
        }
        if (Arreglo[4].equals("9")) {
            alumno.setSemestre("S009");
        }
        if (Arreglo[4].equals("10")) {
            alumno.setSemestre("S010");
        }

        if (Arreglo[5].equals("Computacion")) {
            alumno.setCarrera("C001");
        }
        if (Arreglo[5].equals("Mecatronica")) {
            alumno.setCarrera("C002");
        }

        if (Arreglo[5].equals("Diseno")) {
            alumno.setCarrera("C003");
        }
        if (Arreglo[5].equals("Agricola")) {
            alumno.setCarrera("C004");
        }
        if (Arreglo[5].equals("Zootecnia")) {
            alumno.setCarrera("C005");
        }
        if (Arreglo[5].equals("Acuicultura")) {
            alumno.setCarrera("C006");
        }
        if (Arreglo[5].equals("Matematicas")) {
            alumno.setCarrera("C007");
        }

        System.out.println("Matricula  :" + alumno.getMatricula());
        System.out.println("Nombre     :" + alumno.getNombre());
        System.out.println("AP Paterno :" + alumno.getAP_Paterno());
        System.out.println("AP Materno :" + alumno.getAP_Materno());
        System.out.println("Semestre   :" + alumno.getSemestre());
        System.out.println("Carrera    :" + alumno.getCarrera());

        if (ta.agregarAlumno(alumno) == 1) {

            // 

%>
<jsp:forward page="Alumno_Agregar.jsp"> 
    <jsp:param name="mensaje" value="Alumno Agregado" />
</jsp:forward>
<%} else {
    if (!RutaIMGBD.equals("img/tmp/user2.png")) {
        fichero.delete();
    }

%>
<jsp:forward page="Alumno_Agregar.jsp"> 
    <jsp:param name="mensaje" value="LO SENIMOS, Ya existe un alumno con esa matricula" />
</jsp:forward>
<%}
    } catch (Exception e) {
        System.out.println("------A problem occurred while connecting to the database.");
        System.out.println(e.toString());
    }


%>


<%
%>