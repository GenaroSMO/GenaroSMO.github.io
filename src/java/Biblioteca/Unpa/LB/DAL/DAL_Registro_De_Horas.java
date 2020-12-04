/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.DAL;

import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Registro_Hora;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Genaro
 */
public class DAL_Registro_De_Horas {

    private Connection dbCon;
    private Registro_Hora registro_de_hora;
    private Alumno alumno;

    // public String idMatricula;
    // #endregion
    public DAL_Registro_De_Horas(Connection _dbCon) {
        this.dbCon = _dbCon;
        this.registro_de_hora = new Registro_Hora();
        this.alumno = new Alumno();
        //this.autor = new Autor();
    }

    public int query_To_Data_Base_Registro_De_Horas(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Registro_de_Horas(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("matric", matricula);

            boolean results = cstmt.execute();
            int rowsAffected = 0;
            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }
            //System.out.println("ENTRO while");
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            //System.out.println("ENTRO AUX" + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
        }
        return -1;
    }
    
    public int query_To_Data_Base_Registro_De_Horas_Forzosas(String matricula,int horas) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Registro_de_Horas_Forzosas(?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("matric", matricula);
            cstmt.setInt("HORAS", horas);
            boolean results = cstmt.execute();
            int rowsAffected = 0;
            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }
            //System.out.println("ENTRO while");
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            //System.out.println("ENTRO AUX" + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
        }
        return -1;
    }
    
    
    
    public int query_To_Data_Base_Registro_De_Hora_Planta_Alta(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Registro_de_Horas_A_Planta_Alta(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("matric", matricula);

            boolean results = cstmt.execute();
            int rowsAffected = 0;
            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }
            //System.out.println("ENTRO while");
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            //System.out.println("ENTRO AUX" + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
        }
        return -1;
    }
    

    public List<Registro_Hora> query_To_Data_Base_Obtener_Registro_De_Horas() {
        List<Registro_Hora> Lib = new ArrayList<Registro_Hora>();
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = this.dbCon.prepareCall("{call Registro_De_Hora_Consultas()}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            //cstmt.setString("Matricula", Matricula);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                //System.out.println("entro2341");
                this.registro_de_hora = new Registro_Hora();
                //{"Id Libro", "ISBN", "Num_Edicion", "Fec ¨publi", "Num Ejemplar", "Fec de compra"};

                this.registro_de_hora.setMatricula(rs.getString("Matricula"));
                this.registro_de_hora.setNombres(rs.getString("NOMBRES"));
                this.registro_de_hora.setFecha(rs.getString("Fecha"));
                this.registro_de_hora.setSemana(rs.getInt("Semana"));
                this.registro_de_hora.setHora_de_entrada(rs.getString("H_entrada"));
                this.registro_de_hora.setHora_de_salida(rs.getString("H_salida"));
                this.registro_de_hora.setTotal_de_horas(rs.getInt("Total_de_horas"));
                this.registro_de_hora.setStatus_alumno(rs.getInt("Status_alumno"));

                Lib.add(this.registro_de_hora);
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("(DALL_BIBLIOTECA)Failed to get the collection of records: " + e.toString());
            return null;
        }
        //System.out.println("Empleado" + biblioteca.size());
        return Lib;
    }

    public List<Registro_Hora> query_To_Data_Base_Obtener_Registro_De_Horas_Alumno(String Matric) {
        List<Registro_Hora> Lib = new ArrayList<Registro_Hora>();
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = this.dbCon.prepareCall("{call Registro_De_Hora_Consultas_Alumno(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("matric", Matric);
            boolean results = cstmt.execute();
            int rowsAffected = 0;

            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();
                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                //System.out.println("entro2341");
                this.registro_de_hora = new Registro_Hora();
                this.registro_de_hora.setMatricula(rs.getString("Matricula"));
                this.registro_de_hora.setFoto(rs.getString("Imagen"));
                this.registro_de_hora.setNombres(rs.getString("NOMBRES"));
                this.registro_de_hora.setFecha(rs.getString("Fecha"));
                this.registro_de_hora.setSemana(rs.getInt("Semana"));
                this.registro_de_hora.setHora_de_entrada(rs.getString("H_Entrada"));
                this.registro_de_hora.setHora_de_salida(rs.getString("H_Salida"));
                this.registro_de_hora.setTotal_de_horas(rs.getInt("Total_de_horas"));
                this.registro_de_hora.setStatus_alumno(rs.getInt("Status_alumno"));

                Lib.add(this.registro_de_hora);
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("(DALL_BIBLIOTECA)Failed to get the collection of records: " + e.toString());
            return null;
        }
        //System.out.println("Empleado" + biblioteca.size());
        return Lib;
    }

    //
    /*public Alumno queryToDataBaseObtenerAlumno(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Consultar(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("matric", matricula);
            boolean results = cstmt.execute();
            int rowsAffected = 0;
            // Protects against lack of SET NOCOUNT in stored prodedure
            while (results || rowsAffected != -1) {
                if (results) {
                    rs = cstmt.getResultSet();

                    break;
                } else {
                    rowsAffected = cstmt.getUpdateCount();
                }
                results = cstmt.getMoreResults();
            }

            while (rs.next()) {
                System.out.println("entro");
                this.alumno = new Alumno();
                this.alumno.setNombre(rs.getString("Nombre"));
                this.alumno.setAP_Paterno(rs.getString("AP_Paterno"));
                this.alumno.setAP_Materno(rs.getString("AP_Materno"));
                this.alumno.setSemestre(rs.getInt("Semestre"));
                this.alumno.setCarrera(rs.getString("Carrera"));
                
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            return null;
        }
        return alumno;
    }*/
}
