/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.BLL;

import Biblioteca.Unpa.LB.DAL.DAL_LoginUsuario;
import Biblioteca.Unpa.LB.EL.LoginUsuario;
import java.sql.Connection;
import java.util.List;


/**
 *
 * @author labsoft001
 */
public class BLL_LoginUsuario {
      public int insertar_LoginUsuario(Connection dbCon, LoginUsuario loginUsuario) {
        try {
            DAL_LoginUsuario cuenta = new DAL_LoginUsuario(dbCon);
            return cuenta.insertar_LoginUsuario(loginUsuario);
        } catch (Exception ex) {
            throw ex;
        }
    }
}
