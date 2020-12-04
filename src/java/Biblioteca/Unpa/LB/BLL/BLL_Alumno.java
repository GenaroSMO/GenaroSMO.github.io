/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.BLL;

import Biblioteca.Unpa.LB.DAL.DAL_Alumno;
import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Configuracion_De_Hora;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Genaro
 */
public class BLL_Alumno {
    public int queryToDataBaseInsertarAlumno(Connection dbCon, Alumno alumno) {
        try {
            DAL_Alumno dal_autor = new DAL_Alumno(dbCon);
            //System.out.println("ENTRO BLL");
            //return 1;
           return dal_autor.queryToDataBaseInsertarAlumno(alumno);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public int queryToDataBaseEliminarAlumno(Connection dbCon, String matricula) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            
          return dal_alumno.queryToDataBaseEliminarAlumno(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public int queryToDataBaseElimnarRegistro(Connection dbCon, String matricula) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            
          return dal_alumno.queryToDataBaseElimnarRegistro(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public int queryToDataBaseActualizarAlumno(Connection dbCon, Alumno alumno) {
        try {
            System.out.println("BLL");
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseActualizarAlumno(alumno);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public int queryToDataBaseActualizarFotoDeAlumno(Connection dbCon,String matricula,String img) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseActualizarFotoDeAlumno(matricula,img);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<Alumno> queryToDataBaseObtenerAlumnos(Connection dbCon) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseObtenerAlumnos();
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public List<Configuracion_De_Hora> queryToDataBaseObtenerConfiguracion_De_Hora(Connection dbCon,int carrera) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseObtenerConfiguracion_De_Hora( carrera);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public int queryToDataBaseAlumno_Configuracion_De_Hora_Actualizar(Connection dbCon, int s1 ,int s2,int s3,int s4,int s5,int s6,int s7,int s8,int s9,int s10,String carrera) {
        try {
            System.out.println("ENTRO BLL");
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseAlumno_Configuracion_De_Hora_Actualizar(s1,s2,s3,s4,s5,s6,s7,s8, s9, s10, carrera);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    
    public Alumno queryToDataBaseObternerAlumno(Connection dbCon, String matricula) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseObtenerAlumno(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    /*
    public int queryToDataBaseAlumnoHorasHechas(Connection dbCon, String matricula) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            
          return dal_alumno.queryToDataBaseAlumnoHorasHechas(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    
    public int queryToDataBaseAlumnoHorasAdeudadas(Connection dbCon, String matricula) {
        try {
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            
          return dal_alumno.queryToDataBaseAlumnoHorasAdeudadas(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }*/
    
    
    public int queryToDataBaseAlumnoAvanzarSemestre(Connection dbCon) {
        try {
            DAL_Alumno dal_autor = new DAL_Alumno(dbCon);
            //System.out.println("ENTRO BLL");
            //return 1;
           return dal_autor.queryToDataBaseAlumnoAvanzarSemestre();
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    //queryToDataBaseGenerarReporte
    public List<Alumno> queryToDataBaseGenerarReporte(Connection dbCon, String FechaFin,String FechaInicio) {
        try {
            System.out.println("bll");
            DAL_Alumno dal_alumno = new DAL_Alumno(dbCon);
            return dal_alumno.queryToDataBaseGenerarReporte( FechaFin, FechaInicio);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
     public String queryToDataBaseAlumnoCambioDeFecha(Connection dbCon,int tipo) {
        try {
            DAL_Alumno dal_autor = new DAL_Alumno(dbCon);
            //System.out.println("ENTRO BLL");
            //return 1;
           return dal_autor.queryToDataBaseAlumnoCambioDeFecha(tipo);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
}
