/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.TEST;

import Biblioteca.Unpa.LB.BLL.BLL_Registro_De_Horas;
import Biblioteca.Unpa.LB.EL.Alumno;
import Biblioteca.Unpa.LB.EL.Registro_Hora;
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
public class TEST_Registro_De_Horas {
    
    
    private Connection dbCon;

    DbUtil Conexion;
    // #endregion

    public TEST_Registro_De_Horas() throws IOException {
        this.Initialize();
    }

    public void Initialize() throws IOException {
        dbCon = DbUtil.getInstance().getConnection();
    }
    
    public int Registro_Hora( String matricula) {
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        //System.out.println("ENTRO test");
        return bll_registro_de_horas.queryToDataBaseRegistroHora(dbCon,   matricula);
    }
    
    public int Registro_Hora_Forzosas( String matricula,int horas) {
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        //System.out.println("ENTRO test");
        return bll_registro_de_horas.query_To_Data_Base_Registro_De_Horas_Forzosas(dbCon,matricula, horas);
    }
    
    public int Registro_De_Hora_Planta_Alta( String matricula) {
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        //System.out.println("ENTRO test");
        return bll_registro_de_horas.query_To_Data_Base_Registro_De_Hora_Planta_Alta(dbCon,   matricula);
    }
    
    public List Registro_Horas_Lista() {
        List<Registro_Hora> Registro_Hora_Lst = new ArrayList<Registro_Hora>();
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        Registro_Hora_Lst = bll_registro_de_horas.query_To_Data_Base_Obtener_Registro_De_Horas(dbCon);
        return Registro_Hora_Lst;
    }
    
    public List Registro_Horas_Lista_Alumno(String matric) {
        List<Registro_Hora> Registro_Hora_Lst = new ArrayList<Registro_Hora>();
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        System.out.println("entro test alumno ");
        Registro_Hora_Lst = bll_registro_de_horas.query_To_Data_Base_Obtener_Registro_De_Horas_Alumno(dbCon,matric);
        return Registro_Hora_Lst;
    }
    
    
     /*public LinkedList Alumno(String matricula) {
        Alumno AlumnoLista = new Alumno();
        BLL_Registro_De_Horas bll_registro_de_horas = new BLL_Registro_De_Horas();
        AlumnoLista = bll_registro_de_horas.queryToDataBaseObternerAlumno(dbCon, matricula);
        LinkedList aux = new LinkedList();
        
        aux.add(AlumnoLista.getNombre());
        aux.add(AlumnoLista.getAP_Paterno());
        aux.add(AlumnoLista.getAP_Materno());
        aux.add(AlumnoLista.getSemestre() +"");
        aux.add(AlumnoLista.getCarrera());
        return aux;
    }*/
    
    
}
