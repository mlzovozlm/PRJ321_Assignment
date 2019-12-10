/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dal.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Book;

/**
 *
 * @author Bao Anh Luu
 */
public class manageControl extends baseRequiredAuthenticationControl {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageSize = 8;
        String page_Index = request.getParameter("page");
        if (page_Index == null || page_Index.equals("")) {
            page_Index = "1";
        }
        
        int pageIndex = Integer.parseInt(page_Index);
        BookDAO bookDAO = new BookDAO();
        ArrayList<Book> books = bookDAO.paging(pageIndex, pageSize);
        int row_count = bookDAO.count();
        int totalPage = (row_count % pageSize == 0)
                ? row_count / pageSize : row_count / pageSize + 1;
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("books", books);
        request.getRequestDispatcher("manage.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
