/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Book;

/**
 *
 * @author Bao Anh Luu
 */
public class BookDAO extends BaseDAO {

    public Book getByID(int BookID) {
        Book book = null;
        String sql = "SELECT ID, Title, Author, Price, cover_url FROM Book "
                + "WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, BookID);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                book = new Book();
                book.setID(rs.getInt("ID"));
                book.setTitle(rs.getString("Title"));
                book.setAuthor(rs.getString("Author"));
                book.setCover_url(rs.getString("cover_url"));
                book.setPrice(rs.getDouble("Price"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }

    public void insert(String title, String author, double price, String cover_url) {
        String sql = "INSERT INTO Book (Title, Author, Price, cover_url) VALUES "
                + " (?,?,?,?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, author);
            statement.setDouble(3, price);
            statement.setString(4, cover_url);
            ResultSet rs = statement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Book> getByTitle(String titlePart) {
        ArrayList<Book> books = new ArrayList<>();
        String sql = "SELECT ID, Title, Author, Price, cover_url FROM Book "
                + "WHERE Title LIKE ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, "%" + titlePart + "%"); //no "'" next to "%" like "'%"/"%'"
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setID(rs.getInt("ID"));
                book.setTitle(rs.getString("Title"));
                book.setAuthor(rs.getString("Author"));
                book.setCover_url(rs.getString("cover_url"));
                book.setPrice(rs.getDouble("Price"));
                books.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return books;
    }

    public ArrayList<Book> paging(int pageindex, int pagesize) {
        ArrayList<Book> books = new ArrayList<>();
        String sql = "SELECT ID, Title, Author, cover_url, Price FROM "
                + "("
                + "SELECT ROW_NUMBER() "
                + "OVER (ORDER BY ID ASC) as row_num, ID, Title, Author, cover_url, Price "
                + "FROM Book"
                + ") tblBook "
                + "WHERE row_num BETWEEN ((? -1) * ?)+1 "
                + "AND ? * ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pagesize);
            statement.setInt(4, pageindex);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setID(rs.getInt("ID"));
                book.setTitle(rs.getString("Title"));
                book.setAuthor(rs.getString("Author"));
                book.setCover_url(rs.getString("cover_url"));
                book.setPrice(rs.getDouble("Price"));
                books.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return books;
    }

    public int count() {
        int row_count = 0;
        String sql = "SELECT COUNT(*) as Total FROM Book";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                row_count = rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return row_count;
    }
}
