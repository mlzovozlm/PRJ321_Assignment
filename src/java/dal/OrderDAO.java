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
import model.Order;
import model.OrderDetail;

/**
 *
 * @author sonnt
 */
public class OrderDAO extends BaseDAO {

    public int insert(Order order) {
        try {
            connection.setAutoCommit(false);
            
            String sql_insert = "INSERT INTO [Orders] "
                    + "(OrderDate,CustomerID) "
                    + "VALUES (GETDATE(),?)";
            PreparedStatement statement_insert_order
                    = connection.prepareStatement(sql_insert);
            statement_insert_order.setString(1, order.getAccount().getUsername());
            statement_insert_order.executeUpdate();
            //get new added orderid
            
            String sql_select_orderid = "SELECT @@IDENTITY as OrderID";
            PreparedStatement statement_select_orderId
                    = connection.prepareStatement(sql_select_orderid);
            ResultSet rs = statement_select_orderId.executeQuery();
            if (rs.next()) {
                order.setID(rs.getInt("OrderID"));
            }
            //insert order details
            for (OrderDetail od : order.getOrderdetails()) {
                String sql_insert_detail = "INSERT INTO [OrderDetail] "
                        + "(OrderID, BookID, UnitPrice) "
                        + "VALUES (?,?,?)";
                PreparedStatement statement_insert_detail
                        = connection.prepareStatement(sql_insert_detail);
                statement_insert_detail.setInt(1, order.getID());
                statement_insert_detail.setInt(2, od.getBook().getID());
                statement_insert_detail.setDouble(3, od.getPrice());
                statement_insert_detail.executeUpdate();
            }
            connection.commit();

        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
        return -1;
    }

}
