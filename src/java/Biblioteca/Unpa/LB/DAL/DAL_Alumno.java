/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.DAL;

import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Configuracion_De_Hora;
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
public class DAL_Alumno {

    private Connection dbCon;
    private Alumno alumno;
    private Configuracion_De_Hora configuracion_de_hora;

    // public String idMatricula;
    // #endregion
    public DAL_Alumno(Connection _dbCon) {
        this.dbCon = _dbCon;
        this.alumno = new Alumno();
        this.configuracion_de_hora=new Configuracion_De_Hora();
    }

    public int queryToDataBaseInsertarAlumno(Alumno alumno) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Alumno_Agregar(?,?,?,?,?,?,?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("MATR", alumno.getMatricula());
            cstmt.setString("NOM", alumno.getNombre());
            cstmt.setString("APPATER", alumno.getAP_Paterno());
            cstmt.setString("APMATER", alumno.getAP_Materno());
            cstmt.setString("SEM", alumno.getSemestre());
            cstmt.setString("CAR", alumno.getCarrera());
            cstmt.setString("IMG", alumno.getFoto());
            cstmt.setString("ICDH", alumno.getCarrera()+alumno.getSemestre());
            //

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
            System.out.println("(DAL)Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }

    public int queryToDataBaseEliminarAlumno(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Eliminar(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("MAT", matricula);
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
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            System.out.println("Result: " + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }
    
    public int queryToDataBaseElimnarRegistro(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Eliminar_Registro(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            System.out.println("");
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }
    
    

    public int queryToDataBaseActualizarAlumno(Alumno alumno) {
        System.out.println("DAL");
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Actualizar(?,?,?,?,?,?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("MAT", alumno.getMatricula());
            cstmt.setString("NOM", alumno.getNombre());
            cstmt.setString("APPATER", alumno.getAP_Paterno());
            cstmt.setString("APMATER", alumno.getAP_Materno());
            cstmt.setString("SEM", alumno.getSemestre());
            cstmt.setString("CAR", alumno.getCarrera());
            cstmt.setString("icdh", alumno.getCarrera()+alumno.getSemestre());//icdh
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
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }
    
    
    public int queryToDataBaseAlumno_Configuracion_De_Hora_Actualizar(int s1 ,int s2,int s3,int s4,int s5,int s6,int s7,int s8,int s9,int s10,String carrera) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        System.out.println("ENTRO DAL");
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Configuracion_De_Hora_Actualizar(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setInt("semestre1", s1);
            cstmt.setInt("semestre2", s2);
            cstmt.setInt("semestre3", s3);
            cstmt.setInt("semestre4", s4);
            cstmt.setInt("semestre5", s5);
            cstmt.setInt("semestre6", s6);
            cstmt.setInt("semestre7", s7);
            cstmt.setInt("semestre8", s8);
            cstmt.setInt("semestre9", s9);
            cstmt.setInt("semestre10", s10);
            cstmt.setString("IdSem1", carrera+"S001");
            cstmt.setString("IdSem2", carrera+"S002");
            cstmt.setString("IdSem3", carrera+"S003");
            cstmt.setString("IdSem4", carrera+"S004");
            cstmt.setString("IdSem5", carrera+"S005");
            cstmt.setString("IdSem6", carrera+"S006");
            cstmt.setString("IdSem7", carrera+"S007");
            cstmt.setString("IdSem8", carrera+"S008");
            cstmt.setString("IdSem9", carrera+"S009");
            cstmt.setString("IdSem10", carrera+"S010");

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
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }

    public int queryToDataBaseActualizarFotoDeAlumno(String matricula, String img) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Actualizar_Imagen(?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("MAT", matricula);
            cstmt.setString("IMG", img);

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
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }

    // ---------------------- consultas  --------------------
    public Alumno queryToDataBaseObtenerAlumno(String matricula) {
        System.out.println("entro DAL");
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

                this.alumno = new Alumno();
                this.alumno.setMatricula(rs.getString("Matricula"));
                this.alumno.setNombre(rs.getString("Nombre"));
                this.alumno.setAP_Paterno(rs.getString("AP_Paterno"));
                this.alumno.setAP_Materno(rs.getString("AP_Materno"));
                this.alumno.setSemestre(rs.getString("Semestre"));
                this.alumno.setCarrera(rs.getString("Carrera"));
                this.alumno.setFoto(rs.getString("Imagen"));
                this.alumno.setHE(rs.getString("HE"));
                this.alumno.setHA(rs.getString("HA"));
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            return null;
        }
        return alumno;
    }

    public List<Alumno> queryToDataBaseObtenerAlumnos() {
        List<Alumno> ALUM = new ArrayList<Alumno>();
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Consultas()}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
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
                this.alumno = new Alumno();
                this.alumno.setMatricula(rs.getString("Matricula"));
                this.alumno.setNombre(rs.getString("Nombre"));
                this.alumno.setAP_Paterno(rs.getString("AP_Paterno"));
                this.alumno.setAP_Materno(rs.getString("AP_Materno"));
                this.alumno.setSemestre(rs.getString("Semestre"));
                this.alumno.setCarrera(rs.getString("Carrera"));
                this.alumno.setHE(rs.getString("HE"));
                this.alumno.setHA(rs.getString("HA"));

                ALUM.add(this.alumno);
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("(DALL_BIBLIOTECA)Failed to get the collection of records: " + e.toString());
            return null;
        }
        //System.out.println("Empleado" + biblioteca.size());
        return ALUM;
    }
    
    
    
     public List<Configuracion_De_Hora> queryToDataBaseObtenerConfiguracion_De_Hora(int carrera) {
        List<Configuracion_De_Hora> Configuracion_De_Hora_list = new ArrayList<Configuracion_De_Hora>();
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Configuracion_De_Hora(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setInt("carrera", carrera);
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
                this.configuracion_de_hora = new Configuracion_De_Hora();
                this.configuracion_de_hora.setSemestre1(rs.getInt("T_H_Por_Semestre"));

                Configuracion_De_Hora_list.add(this.configuracion_de_hora);
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("(DALL_BIBLIOTECA)Failed to get the collection of records: " + e.toString());
            return null;
        }
        //System.out.println("Empleado" + biblioteca.size());
        return Configuracion_De_Hora_list;
    }
    

    /*
    public int queryToDataBaseAlumnoHorasHechas(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Horas_Hechas(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("Matri", matricula);
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
            int aux = 0;
            if (rs.next()) {
                aux = Integer.parseInt(rs.getString("HH"));
            }
            //System.out.println("Result: " + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }

    public int queryToDataBaseAlumnoHorasAdeudadas(String matricula) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Horas_Adeudadas(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("Matri", matricula);
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
            int aux = 0;
            if (rs.next()) {
                //aqui
                aux = Integer.parseInt(rs.getString("HA"));
            }
            //System.out.println("Result: " + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return 0;
    }
     */

    public int queryToDataBaseAlumnoAvanzarSemestre() {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Alumno_Avanzar_De_Semestre()}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

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
            //return 0;
        }
        return 0;
    }

    public String queryToDataBaseAlumnoCambioDeFecha(int tipo) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{CALL Alumno_Generar_Reporte_Cambio_De_Fecha(?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setInt("Tipo", tipo);
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
            String aux = "";
            if (rs.next()) {
                aux = rs.getString("Salida");
            }
            //System.out.println("ENTRO AUX" + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
            //return 0;
        }
        return "0";
    }

    //
    public List<Alumno> queryToDataBaseGenerarReporte(String FechaFin,String FechaInicio) {
        System.out.println("DAL");
        List<Alumno> ALUM = new ArrayList<Alumno>();
        CallableStatement cstmt = null;
        ResultSet rs = null;

        try {
            cstmt = this.dbCon.prepareCall("{call Alumno_Generar_Reporte(?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("FechaFin", FechaFin);
            cstmt.setString("FechaInicio", FechaInicio);
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
                this.alumno = new Alumno();
                this.alumno.setMatricula(rs.getString("Matricula"));
                this.alumno.setNombre(rs.getString("Nombre"));
                this.alumno.setAP_Paterno(rs.getString("AP_Paterno"));
                this.alumno.setAP_Materno(rs.getString("AP_Materno"));
                this.alumno.setSemestre(rs.getString("Semestre"));
                this.alumno.setCarrera(rs.getString("Carrera"));
                this.alumno.setHE(rs.getString("HE"));
                this.alumno.setHA(rs.getString("HA"));

                ALUM.add(this.alumno);
            }
            //connection.close();          
        } catch (SQLException e) {
            System.out.println("(DALL_BIBLIOTECA)Failed to get the collection of records: " + e.toString());
            return null;
        }
        //System.out.println("Empleado" + biblioteca.size());
        return ALUM;
    }

}
