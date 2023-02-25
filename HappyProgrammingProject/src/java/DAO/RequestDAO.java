package DAO;

import DTO.Request;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import ConnectDB.DBContext;
import DTO.Mentor;
import DTO.Skill;
import DTO.Status;
import java.sql.SQLException;

public class RequestDAO extends DBContext {

    public List<Request> getRequestByMentee(int id) {
        List<Request> list = new ArrayList<>();
        query = "select hrm.id , hrm.title, hrm.content, hrm.deadline, r.statusID\n"
                + "from historyMenteeRequest hrm, request r, mentee me, status st\n"
                + "where hrm.id = r.id and hrm.menteeID = me.id and st.ID = r.statusID and me.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                int requestId = rs.getInt(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                int menteeID = rs.getInt(4);
                Date deadline = rs.getDate(5);
                int statusID = rs.getInt(6);
                int rate = rs.getInt(7);
                list.add(new Request(requestId, title, content, menteeID, deadline, statusID, rate));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Request viewRequestDetail(int id) {
        Request request = new Request();
        query = "select *from Request where id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            request = new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5), rs.getInt(6), rs.getInt(7));
        } catch (Exception e) {
        }
        return request;
    }

    public Status getStatusOfRequest(int id) {
        Status status = new Status();
        query = "select s.Status from request r, status s where r.statusID=s.ID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            status = new Status(rs.getInt(1), rs.getString(2));
        } catch (Exception e) {
        }
        return status;
    }

    public List<Skill> getSkillOfRequest(int id) {
        List<Skill> list = new ArrayList<>();
        query = "select s.name from skill s,requestskill rs,request r where s.id=rs.skillID and r.id=rs.requestID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Mentor> getMentorOfRequest(int id) {
        List<Mentor> list = new ArrayList<>();
        query = "select m.name from mentor m,mentorRequest ms,request r where m.id=ms.mentorID and r.id=ms.requestID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Request> getRequestHistoryByID(String id) {
        List<Request> list = new ArrayList<>();
        query = "select historyRequest.id,historyRequest.title, historyRequest.content, historyRequest.deadline\n"
                + ",account.username, [status].[Status]\n"
                + "from historyRequest\n"
                + "left outer join account\n"
                + "on historyRequest.accountID = account.id\n"
                + "left outer join [status]\n"
                + "on historyRequest.statusID = [status].id\n"
                + "where account.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(2), rs.getString(3),
                         rs.getDate(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Request> searchHistoryRequest(String key, int id) {
        List<Request> list = new ArrayList<>();
        query = "select historyRequest.id,historyRequest.title, historyRequest.content, historyRequest.deadline\n"
                + ",account.username, [status].[Status]\n"
                + "from historyRequest\n"
                + "left outer join account\n"
                + "on historyRequest.accountID = account.id\n"
                + "left outer join [status]\n"
                + "on historyRequest.statusID = [status].id\n"
                + "where account.id = ? AND historyRequest.title like ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setString(2, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        List<Request> list = new RequestDAO().searchHistoryRequest("boos", 4);
        System.out.println(list.get(0).getContent());
    }
}
