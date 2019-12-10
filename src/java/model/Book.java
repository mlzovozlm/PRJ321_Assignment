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
public class Book {
    int ID;
    String Title;
    String Author;
    Double Price;
    String cover_url;

    public Book() {
    }

    public Book(int ID, String Title, String Author, Double Price, String cover_url) {
        this.ID = ID;
        this.Title = Title;
        this.Author = Author;
        this.Price = Price;
        this.cover_url = cover_url;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public double getPrice() {
        return Price;
    }

    public void setPrice(double Price) {
        this.Price = Price;
    }

    public String getCover_url() {
        return cover_url;
    }

    public void setCover_url(String cover_url) {
        this.cover_url = cover_url;
    }
    
    
}
