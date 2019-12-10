/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Bao Anh Luu
 */
public class Account {
    private String username, password, authen;

    public Account(String username, String password, String authen) {
        this.username = username;
        this.password = password;
        this.authen = authen;
    }

    public String getAuthen() {
        return authen;
    }

    public void setAuthen(String authen) {
        this.authen = authen;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Account() {
    }
    
}
