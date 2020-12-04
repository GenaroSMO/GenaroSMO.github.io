/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.EL;

/**
 * @author Genaro
 */
public class Registro_Hora {

    //segunda tabla
    private String Matricula;
    private String Foto;
    private String nombres;
    private String Fecha;
    private int Semana;
    private String Hora_de_entrada;
    private String Hora_de_salida;
    private int Total_de_horas;
    private int Status_alumno;

    
    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }
    
    public String getMatricula() {
        return Matricula;
    }

    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    public String getFecha() {
        return Fecha;
    }

    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    public int getSemana() {
        return Semana;
    }

    public void setSemana(int Semana) {
        this.Semana = Semana;
    }

    public String getHora_de_entrada() {
        return Hora_de_entrada;
    }

    public void setHora_de_entrada(String Hora_de_entrada) {
        this.Hora_de_entrada = Hora_de_entrada;
    }

    public String getHora_de_salida() {
        return Hora_de_salida;
    }

    public void setHora_de_salida(String Hora_de_salida) {
        this.Hora_de_salida = Hora_de_salida;
    }

    public int getTotal_de_horas() {
        return Total_de_horas;
    }

    public void setTotal_de_horas(int Total_de_horas) {
        this.Total_de_horas = Total_de_horas;
    }

    public int getStatus_alumno() {
        return Status_alumno;
    }

    public void setStatus_alumno(int Status_alumno) {
        this.Status_alumno = Status_alumno;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }
    
    

}
