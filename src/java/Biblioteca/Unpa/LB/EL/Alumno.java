/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.EL;

import javax.persistence.Lob;

/**
 *
 * @author Genaro
 */
public class Alumno {

    //primera tabla
    private String Matricula;
    private String Nombre;
    private String AP_Paterno;
    private String AP_Materno;
    private String Semestre;
    private String Carrera;
    private String HE;
    private String HA;

    public String getHE() {
        return HE;
    }

    public void setHE(String HE) {
        this.HE = HE;
    }

   

    public String getHA() {
        return HA;
    }

    public void setHA(String HA) {
        this.HA = HA;
    }

   

    private String Foto;

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getAP_Materno() {
        return AP_Materno;
    }

    public void setAP_Materno(String AP_Materno) {
        this.AP_Materno = AP_Materno;
    }

    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getAP_Paterno() {
        return AP_Paterno;
    }

    public void setAP_Paterno(String AP_Paterno) {
        this.AP_Paterno = AP_Paterno;
    }

    public String getSemestre() {
        return Semestre;
    }

    public void setSemestre(String Semestre) {
        this.Semestre = Semestre;
    }

    

    public String getCarrera() {
        return Carrera;
    }

    public void setCarrera(String Carrera) {
        this.Carrera = Carrera;
    }
}
