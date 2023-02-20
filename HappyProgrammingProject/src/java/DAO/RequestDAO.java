package DAO;

import DTO.Request;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import ConnectDB.DBContext;

 
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
}