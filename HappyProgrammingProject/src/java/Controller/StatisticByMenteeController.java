package Controller;

import DAO.DAO;
//import DAO.MentorDAO;
//import DAO.RequestDAO;
import DTO.Account;
import DTO.Request;
import java.io.IOException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "StatisticByMenteeController", urlPatterns = {"/StatisticByMenteeController"})
public class StatisticByMenteeController extends HttpServlet {

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
        return "Servlet to generate statistics for a mentee";
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    String view = "StatisticByMentee.jsp";
    String error = null;

    try {
        HttpSession session = request.getSession();
        Account user = (Account) session.getAttribute("SIGNIN_ACCOUNT");
        int menteeID = user.getId();
        DAO reqDAO = new DAO();
        ArrayList<Request> listReq = reqDAO.getListAllReq(menteeID);
        MentorDAO mentorDAO = new MentorDAO();
        InviteDAO inviteDAO = new InviteDAO();
        List<RequestMentorPair> reqMentorPairs = new ArrayList<>();
        int totalMentor = 0;
        for (Request req : listReq) {
            int mentorID = inviteDAO.getMentorIDByReqID(req.getId());
            if (mentorID != 0) {
                String mentorName = mentorDAO.getMentorByID(mentorID).getFullname();
                reqMentorPairs.add(new RequestMentorPair(req, mentorName));
                totalMentor++;
            }
        }
        request.setAttribute("TOTAL_MENTOR", totalMentor);
        request.setAttribute("LIST_REQUEST", listReq);
        request.setAttribute("REQ_MENTOR_PAIRS", reqMentorPairs);
    } catch (Exception e) {
        error = "An error occurred while processing your request: " + e.getMessage();
        log("Error at StatisticByMenteeController " + e.toString());
    }

    request.setAttribute("ERROR", error);
    request.getRequestDispatcher(view).forward(request, response);
}

}
