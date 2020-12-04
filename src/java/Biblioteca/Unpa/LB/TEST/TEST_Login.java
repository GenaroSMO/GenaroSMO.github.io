/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Biblioteca.Unpa.LB.TEST;

import Biblioteca.Unpa.LB.BLL.BLL_LoginUsuario;
import Biblioteca.Unpa.LB.EL.LoginUsuario;
import Biblioteca.util.DbUtil;
import java.io.IOException;
import java.sql.Connection;

/**
 *
 * @author labsoft005
 */
public class TEST_Login {
    private Connection dbCon;

    //private Connection conn;
    DbUtil Conexion;
    // #endregion

    public TEST_Login()throws IOException {
        this.Initialize();
    }

    public void Initialize()throws IOException {
        dbCon = DbUtil.getInstance().getConnection();
    }
    
    
    public int Login(LoginUsuario login) {
        BLL_LoginUsuario log = new BLL_LoginUsuario();
        return log.insertar_LoginUsuario(dbCon, login);
    }
    
    
}
