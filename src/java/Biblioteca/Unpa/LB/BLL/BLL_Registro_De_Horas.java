/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.BLL;

import Biblioteca.Unpa.LB.DAL.DAL_Registro_De_Horas;
import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Registro_Hora;
import java.sql.Connection;
import java.util.List;

/**
 *
 * @author Genaro
 */
public class BLL_Registro_De_Horas {

    //query_To_Data_Base_Obtener_Registro_De_Horas

    public int queryToDataBaseRegistroHora(Connection dbCon, String matricula) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
           // System.out.println("ENTRO BLL");
            return dal_Registro_De_Horas.query_To_Data_Base_Registro_De_Horas(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public int query_To_Data_Base_Registro_De_Horas_Forzosas(Connection dbCon, String matricula,int horas) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
           // System.out.println("ENTRO BLL");
            return dal_Registro_De_Horas.query_To_Data_Base_Registro_De_Horas_Forzosas(matricula,horas);
        } catch (Exception ex) {
            throw ex;
        }
    }
    
    public int query_To_Data_Base_Registro_De_Hora_Planta_Alta(Connection dbCon, String matricula) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
           // System.out.println("ENTRO BLL");
            return dal_Registro_De_Horas.query_To_Data_Base_Registro_De_Hora_Planta_Alta(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<Registro_Hora> query_To_Data_Base_Obtener_Registro_De_Horas(Connection dbCon) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
            return dal_Registro_De_Horas.query_To_Data_Base_Obtener_Registro_De_Horas();
        } catch (Exception ex) {
            throw ex;
        }
    }

    public List<Registro_Hora> query_To_Data_Base_Obtener_Registro_De_Horas_Alumno(Connection dbCon,String Matric) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
            return dal_Registro_De_Horas.query_To_Data_Base_Obtener_Registro_De_Horas_Alumno(Matric);
        } catch (Exception ex) {
            throw ex;
        }
    }

     //queryToDataBaseObternerAlumno
    /*public Alumno queryToDataBaseObternerAlumno(Connection dbCon, String matricula) {
        try {
            DAL_Registro_De_Horas dal_Registro_De_Horas = new DAL_Registro_De_Horas(dbCon);
            return dal_Registro_De_Horas.queryToDataBaseObtenerAlumno(matricula);
        } catch (Exception ex) {
            throw ex;
        }
    }*/

}
