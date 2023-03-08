/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBContext;
import DTO.Feedback;
import DTO.Mentee;
import DTO.Mentor;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author okanh
 */
public class FeedbackDAO extends DBContext  {
    public List<Feedback> getComment(int mentorID){
        List<Feedback> list = new ArrayList<>();
        query = "select top 3 n.firstname,n.lastName,m.avatar,f.commentDetail from feedback f,"
                + "mentee m,[Name] n where mentorid=? and f.menteeID=m.id and n.id=m.id";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1,mentorID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(new Mentee(rs.getString(1),rs.getString(2),rs.getString(3)),rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public double getAverage(int mentorid){
       double average=-1;
        query = " select Cast(AVG(Cast(f.rate as decimal(10,1))) as decimal(10,1)) rateaverage from feedback f where f.mentorid=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1,mentorid);
            rs = ps.executeQuery();
            while (rs.next()) {
                average=rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return average;
    }
}
