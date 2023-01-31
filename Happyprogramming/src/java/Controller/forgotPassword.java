/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.User_DAO;
import DTO.Account;
import DTO.Email;
import DTO.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author okanh
 */
@WebServlet(name = "forgotPassword", urlPatterns = {"/forgotPassword"})
public class forgotPassword extends HttpServlet {

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
        try {
            String email=request.getParameter("email");
            String username=request.getParameter("username");
            String roles=request.getParameter("roles");
            
            User_DAO dao=new User_DAO();
            Account account=null;
            if(roles.equals("Mentee"))
                account=dao.findByEmailMentee(email, username);
            if(roles.equals("Mentor"))
                account=dao.findByEmailMentor(email, username);
            if(account==null){
                request.setAttribute("error", "Username Or Email are incorrect");
            }else{
                Email emails=new Email();
                emails.setFrom("nguyenvudung96@gmail.com");
                emails.setFromPassword("iogwhojeiupayzos");
                emails.setTo(email);
                emails.setSubject("Forgot Password Function");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(username).append("<br>");
                sb.append("You are used the fogot password function. <br>");
                sb.append("Your password is <b>").append(account.getPassword()).append("</b>");
                sb.append("Regards<br>");
                sb.append("Administrator");
                
                emails.setContent(sb.toString());
                EmailUtils.sendEmail(emails);
                
                request.setAttribute("message", "Email sended");
            }
        } catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

