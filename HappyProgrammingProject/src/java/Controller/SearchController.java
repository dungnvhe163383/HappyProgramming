/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.DAO;
import DTO.Request;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author fpt shop
 */
public class SearchController {
/**
 *
 * @author fpt shop
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class SearchControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");//để search có thể hiểu cả tiếng việt
        try ( PrintWriter out = response.getWriter()) {
            String idString = request.getParameter("id");
            int id = Integer.parseInt(idString);
            DAO dao = new DAO();
            List<Request> list = dao.getRequestByMentee(id);//search request của me theo id
            request.setAttribute("listP", list);
            request.setAttribute("txts", idString);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


    }
}
