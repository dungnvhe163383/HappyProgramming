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

    public List<Request> getRequestByMentee(String id) {
        List<Request> list = new ArrayList<>();
        query = "select request.id, request.title, request.content, request.deadline, [status].[Status]\n"
                + "from mentee join request on mentee.id = request.id\n"
                + "join mentorRequest on request.id = mentorRequest.requestID\n"
                + "join mentor on mentor.id = mentorRequest.mentorID\n"
                + "join requestStatus on request.id = requestStatus.requestID\n"
                + "join [status] on [status].id = requestStatus.statusID\n"
                + "where mentee.id = ?\n"
                + "group by request.id, request.title, request.content, request.deadline, [status].[Status]";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Mentor> getMentorFromRequest(String id) {
        List<Mentor> list = new ArrayList<>();
        query = "select [Name].firstName, [Name].lastName\n"
                + "from mentee join request on mentee.id = request.id\n"
                + "join mentorRequest on request.id = mentorRequest.requestID\n"
                + "join mentor on mentor.id = mentorRequest.mentorID\n"
                + "join [Name] on [Name].id = mentor.id\n"
                + "where mentee.id = ?\n"
                + "group by [Name].firstName, [Name].lastName";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Mentor(rs.getString(1), rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Request viewRequestDetail(int id) {
        Request request = new Request();
        query = "select * from Request where id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                request = new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDate(4), rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return request;
    }

    public List<Status> getStatusOfRequest(int id) {
        List<Status> status = new ArrayList<>();
        query = "select s.id,s.Status from request r,requestStatus rs, status s"
                + " where r.id=rs.requestID and rs.statusID=s.id and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                status.add(new Status(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return status;
    }

    public List<Skill> getSkillOfRequest(int id) {
        List<Skill> list = new ArrayList<>();
        query = "select s.id,s.name from skill s,requestskill rs,request r where s.id=rs.skillID and r.id=rs.requestID and r.id=?";
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
        query = "select n.firstname,n.lastname from [Name] n, mentor m,mentorRequest ms,request r where "
                + "m.id=ms.mentorID and r.id=ms.requestID and n.id=m.id and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getString(1), rs.getString(2)));
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
                list.add(new Request(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getDate("deadline"), rs.getString("username"), rs.getString("Status")));
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
                list.add(new Request(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getDate("deadline"), rs.getString("username"), rs.getString("Status")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Request> getAllRequestByAdmin() {
        List<Request> list = new ArrayList<>();
        query = "select request.id, request.title, request.content, request.deadline, "
                + "request.menteeID, mentorRequest.mentorID, [status].[Status]\n"
                + "from request\n"
                + "left outer join mentorRequest\n"
                + "on request.id = mentorRequest.requestID\n"
                + "left outer join requestStatus\n"
                + "on request.id = requestStatus.requestID\n"
                + "left outer join [status]\n"
                + "on requestStatus.statusID = [status].id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
                        rs.getDate("deadline"), rs.getInt("menteeID"), rs.getInt("mentorID"), rs.getString("Status")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Request> getAllRequestByKey(String key) {
        List<Request> list = new ArrayList<>();
        query = "select request.id, request.title, request.content, request.deadline, request.menteeID, "
                + "mentorRequest.mentorID, [status].[Status]\n"
                + "from request\n"
                + "left outer join mentorRequest\n"
                + "on request.id = mentorRequest.requestID\n"
                + "left outer join requestStatus\n"
                + "on request.id = requestStatus.requestID\n"
                + "left outer join [status]\n"
                + "on requestStatus.statusID = [status].id\n"
                + "where request.id like ? \n"
                + "or request.title like ? \n"
                + "or request.content like ? \n"
                + "or request.deadline like ? \n"
                + "or request.menteeID like ? \n"
                + "or mentorRequest.mentorID like ?\n"
                + "or [status].[Status] like ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, "%" + key + "%");
            ps.setString(2, "%" + key + "%");
            ps.setString(3, "%" + key + "%");
            ps.setString(4, "%" + key + "%");
            ps.setString(5, "%" + key + "%");
            ps.setString(6, "%" + key + "%");
            ps.setString(7, "%" + key + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"), rs.getString("title"), rs.getString("content"),
                        rs.getDate("deadline"), rs.getInt("menteeID"), rs.getInt("mentorID"), rs.getString("Status")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Mentor> getMentorFromRequest() {
        List<Mentor> list = new ArrayList<>();
        query = "select mentor.id, [Name].firstName, [Name].lastName, mentor.avatar,mentor.introduce,[status].[Status]\n"
                + "from mentor join [Name] on mentor.id = [Name].id\n"
                + "join hire on mentor.id = hire.mentorID\n"
                + "join [status] on hire.statusID = [status].id\n"
                + "where [status].id = 3";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Request getRequestByMentorId(int id, int mentorID) {
        query = "SELECT request.id, request.title, request.content, request.deadline, mentorRequest.mentorID \n"
                + "FROM request\n"
                + "LEFT OUTER JOIN mentorRequest\n"
                + "ON request.id = mentorRequest.requestID\n"
                + "WHERE request.id = ? AND mentorRequest.mentorID = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, mentorID);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Request(rs.getInt("id"), rs.getString("title"), rs.getString("content"), rs.getDate("deadline"), rs.getInt("mentorID"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
