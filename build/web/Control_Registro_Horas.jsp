<%-- 
    Document   : Control_Registro_Horas
    Created on : 26/08/2019, 10:12:01 AM
    Author     : DELL02
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Biblioteca.Unpa.LB.EL.Registro_Hora"%>
<%@page import="Biblioteca.Unpa.LB.TEST.TEST_Registro_De_Horas"%>
<%@page import="java.util.List"%>
<%
    //System.out.println("**************************************************** ENTRO A BISCAR REGISTRO ********************************************************************");
    String filas = "";
    int numColumnas = 0;
    List<Registro_Hora> Registro_Hora_Lst = new ArrayList<Registro_Hora>();

    TEST_Registro_De_Horas TR = new TEST_Registro_De_Horas();

    Registro_Hora_Lst = TR.Registro_Horas_Lista();

    numColumnas = Registro_Hora_Lst.size();

    if (Registro_Hora_Lst != null) {
        // System.out.println("Num columnas: " + numColumnas);
        for (int b = 0; b < numColumnas; b++) {
            filas = filas + "<tr>";
            filas = filas + "<td>" + (b + 1) + "</td>";
            filas = filas + "<td>" + Registro_Hora_Lst.get(b).getMatricula() + "</td>";
            filas = filas + "<td>" + Registro_Hora_Lst.get(b).getNombres() + "</td>";
            filas = filas + "<td>" + Registro_Hora_Lst.get(b).getFecha() + "</td>";
            filas = filas + "<td>" + "--" + "</td>";
            filas = filas + "<td>" + Registro_Hora_Lst.get(b).getHora_de_entrada() + "</td>";
            filas = filas + "<td>" + "--:--:--" + "</td>";
            if (Registro_Hora_Lst.get(b).getStatus_alumno() == 0) {
                filas = filas + "<td>" + "Dentro" + "</td>";
            } else {
                filas = filas + "<td>" + "Fuera" + "</td>";
            }

            filas = filas + "</tr>";
        }

    } else {
        filas = filas + "<tr>";
        filas = filas + "<td>no</td>";
        filas = filas + "<td>hay</td>";
        filas = filas + "<td>Alumnos</td>";
        filas = filas + "<td>en</td>";
        filas = filas + "<td>Biblioteca</td>";
        filas = filas + "</tr>";
    }

    out.print(filas);


%>
