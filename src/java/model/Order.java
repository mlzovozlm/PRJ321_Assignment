/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author sonnt
 */
public class Order {
    private int ID;
    private Date date;
    private Account account;
    ArrayList<OrderDetail> orderdetails = new ArrayList<>();

    public float totalPrice()
    {
        float sum = 0;
        for(OrderDetail orderdetail : orderdetails) {
            sum+= orderdetail.getPrice();
        }
        return sum;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public ArrayList<OrderDetail> getOrderdetails() {
        return orderdetails;
    }

    public void setOrderdetails(ArrayList<OrderDetail> orderdetails) {
        this.orderdetails = orderdetails;
    }
    
}