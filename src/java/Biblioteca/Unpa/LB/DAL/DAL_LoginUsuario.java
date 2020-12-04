/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.DAL;

import Biblioteca.Unpa.LB.EL.LoginUsuario;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


/**
 *
 * @author labsoft001
 */
public class DAL_LoginUsuario {

    private Connection dbCon;
    private LoginUsuario loginUsuario;

    public DAL_LoginUsuario(Connection dbCon) {
        this.dbCon = dbCon;
        this.loginUsuario = new LoginUsuario();
    }

    public int insertar_LoginUsuario(LoginUsuario loginUsuario) {
        CallableStatement cstmt = null;
        ResultSet rs = null;
        try {
            cstmt = this.dbCon.prepareCall("{call login_usuario(?,?)}", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            cstmt.setString("nom",loginUsuario.getNombre());
            cstmt.setString("passw", loginUsuario.getPassw());
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
            System.out.println("ENTRO while");
            int aux = 0;
            if (rs.next()) {
                aux = rs.getInt(1);
            }
            System.out.println("ENTRO AUX : " + aux);
            return aux;

        } catch (SQLException e) {
            System.out.println("Failed to get the collection of records: " + e.toString());
        }
        return -1;
    }


}
