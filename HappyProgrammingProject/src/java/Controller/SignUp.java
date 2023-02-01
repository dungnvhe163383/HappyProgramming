/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.DAO;
import DTO.Account;
import DTO.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author okanh
 */
public class SignUp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao=new DAO();
        List<Role> show_role = dao.getRole();
        request.setAttribute("role", show_role);
        request.getRequestDispatcher("SignUp.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String repass = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        int roleid=Integer.parseInt(role);
        DAO dao=new DAO();
        List<Role> show_role= dao.getRole();
        request.setAttribute("role", show_role);
        Account a = dao.checkLogin(username, pass);
        if (a != null) {
            request.setAttribute("errorMessage", "username and accout is exit !");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
        if (a == null && pass.equals(repass)==false) {
            request.setAttribute("errorMessage", "wrong confirm password !");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
        if (a == null&& pass.equals(repass)==true&& roleid==1) {
            dao.InsertAccount(username, pass, roleid);
            Account b=dao.checkLogin(username, pass);
            dao.InsertMentee(b.getId(), email);
            request.setAttribute("doneMessage", "Create Account successful !");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
        if (a == null&& pass.equals(repass)==true&& roleid==2) {
            dao.InsertAccount(username, pass, roleid);
            Account b=dao.checkLogin(username, pass);
            dao.InsertMentor(b.getId(), email);
            request.setAttribute("doneMessage", "Create Account successful !");
            request.getRequestDispatcher("SignUp.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
