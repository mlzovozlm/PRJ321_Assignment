/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author Bao Anh Luu
 */
public class AccountDAO extends BaseDAO {

    public Account get(String username, String password) {
        try {
            String sql = "SELECT username, password, authen FROM Account "
                    + "WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                Account a = new Account(rs.getString("username"), rs.getString("password"), rs.getString("authen"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public boolean isAccountExist(String username) {
        try {
            String sql = "SELECT username FROM Account "
                    + "WHERE username = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void insert(String username, String password, String name, String gender, String email, Date dob, String telNo, String authen) {
        try {
            String sql = "INSERT INTO Account(username, password, name, gender, email, dob, telNo, authen) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, name);
            statement.setString(4, gender);
            statement.setString(5, email);
            statement.setDate(6, dob);
            statement.setString(7, telNo);
            statement.setString(8, authen);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Account> getCustomer(){
        ArrayList<Account> customers = new ArrayList();
        return customers;
    }
    
    public ArrayList<Account> getStaff(){
        ArrayList<Account> staffs = new ArrayList();
        return staffs;
    }
}
