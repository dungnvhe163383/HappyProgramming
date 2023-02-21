package DAO;

import DTO.Request;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import ConnectDB.DBContext;
import DTO.Mentor;
import DTO.Skill;
import DTO.Status;

public class RequestDAO extends DBContext{
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
                list.add(new Request(requestId,title,content,menteeID,deadline,statusID,rate));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
 public Request viewRequestDetail(int id){
        Request request = new Request();
        query = "select *from Request where id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            request=new Request(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getDate(5), rs.getInt(6), rs.getInt(7));
        } catch (Exception e) {
        }
        return request;
    }
    
    public Status getStatusOfRequest(int id){
        Status status = new Status();
        query = "select s.Status from request r, status s where r.statusID=s.ID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            status=new Status(rs.getInt(1), rs.getString(2));
        } catch (Exception e) {
        }
        return status;
    }
    
    public List<Skill> getSkillOfRequest(int id){
        List<Skill> list=new ArrayList<>();
        query="select s.name from skill s,requestskill rs,request r where s.id=rs.skillID and r.id=rs.requestID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Skill(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Mentor> getMentorOfRequest(int id){
        List<Mentor> list=new ArrayList<>();
        query="select m.name from mentor m,mentorRequest ms,request r where m.id=ms.mentorID and r.id=ms.requestID and r.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()){
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public ArrayList<Request> getListAllReq(int menteeID){
        ArrayList<Request> list = new ArrayList<>();
        //Connection conn = null;
        //PreparedStatement stm = null;
        //ResultSet rs = null;
        query="select * from ";
        try {
                ps = connection.prepareStatement(query);    
                while (rs.next()) {
                    if (!"".equals(rs.getString("Status"))) {
                        int ID = rs.getInt("ID");
                        String title = rs.getString("Title");
                        String status = rs.getString("Status");
                        String content = rs.getString("Content");
                        Date deadlineDate = rs.getDate("DeadlineDate");
                        int deadlineHour = rs.getInt("DeadlineHour");
                        list.add(new Request(ID, title, status, content, menteeID, deadlineDate, deadlineHour));
                    }
                }

            }
         return list;
       
    }
}