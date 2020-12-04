/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.TEST;

import Biblioteca.Unpa.LB.BLL.BLL_Alumno;
import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Configuracion_De_Hora;
import Biblioteca.util.DbUtil;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Genaro
 */
public class TEST_Alumno {

    private Connection dbCon;

    //private Connection conn;
    DbUtil Conexion;
    // #endregion

    public TEST_Alumno() throws IOException {
        this.Initialize();
    }

    public void Initialize() throws IOException {
        dbCon = DbUtil.getInstance().getConnection();
    }

    public int agregarAlumno(Alumno alumno) {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        System.out.println("ENTRO test");
        return bll_alumno.queryToDataBaseInsertarAlumno(dbCon, alumno);
    }

    public int elimnarAlumno(String matricula) {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseEliminarAlumno(dbCon, matricula);
    }
    
    public int ElimnarRegistro(String matricula) {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseElimnarRegistro(dbCon, matricula);
    }

    public int actualizarAlumno(Alumno alumno) {
        System.out.println("TEST");
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseActualizarAlumno(dbCon, alumno);
    }
    public int actualizarFotoDeAlumno(String matricula,String img) {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseActualizarFotoDeAlumno(dbCon, matricula,img);
    }

    public List AlumnoLista() {
        List<Alumno> empleadoLst = new ArrayList<Alumno>();
        BLL_Alumno bll_alumno = new BLL_Alumno();
        empleadoLst = bll_alumno.queryToDataBaseObtenerAlumnos(dbCon);
        return empleadoLst;
    }
    
    public List Alumno_Configuracion_de_HoraLista(int carrera) {
        List<Configuracion_De_Hora> Configuracion_De_Hora_Lst = new ArrayList<Configuracion_De_Hora>();
        BLL_Alumno bll_alumno = new BLL_Alumno();
        Configuracion_De_Hora_Lst = bll_alumno.queryToDataBaseObtenerConfiguracion_De_Hora(dbCon, carrera);
        return Configuracion_De_Hora_Lst;
    }
    
    public int Alumno_Configuracion_De_Hora_Actualizar(int s1 ,int s2,int s3,int s4,int s5,int s6,int s7,int s8,int s9,int s10,String carrera) {
        System.out.println("ENTRO TESTS");
        BLL_Alumno bll_alumno = new BLL_Alumno();
        //return 1;
        return bll_alumno.queryToDataBaseAlumno_Configuracion_De_Hora_Actualizar(dbCon,s1,s2,s3,s4,s5,s6,s7,s8, s9, s10, carrera);
    }

    public LinkedList Alumno(String matricula) {
        Alumno AlumnoLista = new Alumno();
        BLL_Alumno bll_alumno = new BLL_Alumno();
        AlumnoLista = bll_alumno.queryToDataBaseObternerAlumno(dbCon, matricula);
        LinkedList aux = new LinkedList();
        aux.add(AlumnoLista.getMatricula());
        aux.add(AlumnoLista.getNombre());
        aux.add(AlumnoLista.getAP_Paterno());
        aux.add(AlumnoLista.getAP_Materno());
        aux.add(AlumnoLista.getSemestre() + "");
        aux.add(AlumnoLista.getCarrera());
        aux.add(AlumnoLista.getFoto());
        aux.add(AlumnoLista.getHA());
        aux.add(AlumnoLista.getHE());
        return aux;
    }

   

    public int AlumnoAvanzarSemestre() {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseAlumnoAvanzarSemestre(dbCon);
    }

    public List Reporte(String FechaFin,String FechaInicio) {
        System.out.println("test");
        List<Alumno> empleadoLst = new ArrayList<Alumno>();
        BLL_Alumno bll_alumno = new BLL_Alumno();
        empleadoLst = bll_alumno.queryToDataBaseGenerarReporte(dbCon,  FechaFin, FechaInicio);
        return empleadoLst;
    }
    
    public String CambioDeFecha(int tipo) {
        BLL_Alumno bll_alumno = new BLL_Alumno();
        return bll_alumno.queryToDataBaseAlumnoCambioDeFecha(dbCon, tipo);
    }
    

}
