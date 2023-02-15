package Controller;

/**
 *
 * @author fpt shop
 */

import DAO.DAO;
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InviteController", urlPatterns = {"/InviteController"})
public class InviteController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int mentorID = Integer.parseInt(request.getParameter("mentorID"));
            int reqID = Integer.parseInt(request.getParameter("reqID"));
           DAO Dao = new DAO();
           
        }
    }
}
