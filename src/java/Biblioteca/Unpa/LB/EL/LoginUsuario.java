/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.EL;

/**
 *
 * @author labsoft001
 */
public class LoginUsuario {
    private int id;
    private String nombre;
    private String passw;

    public LoginUsuario() {
    }
    

    public LoginUsuario(String nombre, String passw) {
        this.nombre = nombre;
        this.passw = passw;
    }

    public LoginUsuario(int id, String nombre, String passw) {
        this.id = id;
        this.nombre = nombre;
        this.passw = passw;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPassw() {
        return passw;
    }

    public void setPassw(String passw) {
        this.passw = passw;
    }
    
    
}
