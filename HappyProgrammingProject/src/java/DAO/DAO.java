/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBContext;
import DTO.*;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

/**
 *
 * @author okanh
 */
public class DAO extends DBContext {

    public List<Mentor> getAllMentor() {
        List<Mentor> list = new ArrayList<>();
        query = "select *from mentor";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Mentor getMentor(int id) {
        Mentor mentor = null;
        query = " select * from mentor where  id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentor = new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getInt(13));
            }
        } catch (Exception e) {
        }
        return mentor;
    }

    public List<Skill> getSkillByMentorID(int id) {
        List<Skill> list = new ArrayList<>();
        query = "select skill.id,skill.Name from Mentor,MentorSkill,Skill where Mentor.ID=MentorSkill.MentorID and MentorSkill.SkillID=Skill.ID and Mentor.ID=?";
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

    public Account checkLogin(String username, String password) {
        query = "select * from Account WHERE username = ? AND password = ? ";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updatePassword(String username, String pass, String newpass) {
        query = "update Account set Password=? where Accountname like ? and Password like ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, newpass);
            ps.setString(2, username);
            ps.setString(3, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Role> getRole() {
        List<Role> list = new ArrayList<>();
        query = "select * from roles where name not like '%Admin%'";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Role(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void InsertAccount(String username, String pass, int roleID) {
        query = "insert into Account values (?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setInt(3, roleID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void InsertMentee(int accID, String email) {
        query = "insert into Mentee values (?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, accID);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void InsertMentor(int accID, String email) {
        query = "insert into Mentor values (?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, accID);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Mentee getMenteeById(int id) {
        query = "select mentee.id ,[Name].firstName, [Name].lastName, mentee.email, \n"
                + "dbo.[address].[address], mentee.phone, mentee.birthday, mentee.sex, mentee.avatar "
                + "from mentee\n"
                + "Left outer join dbo.[address]\n"
                + "on mentee.id = dbo.[address].id\n"
                + "left outer join [Name]\n"
                + "on mentee.id = [Name].id\n"
                + "where mentee.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Mentee(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getString(6), rs.getDate(7), rs.getString(8), rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Request> getRequestByMentee(int id) {
        List<Request> list = new ArrayList<>();
        query = "Select historyMenteeRequest.id, title, content, menteeID, deadline,[status].[Status] "
                + "from historyMenteeRequest "
                + "left outer join [status] "
                + "on [status].ID = historyMenteeRequest.[status] "
                + "where menteeID = ?";
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

    public List<Hire> getHire() {
        List<Hire> hireList = new ArrayList<>();
        query = "select * from hire";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                hireList.add(new Hire(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return hireList;
    }

    public void InsertHire(int mentorID, int menteeID, String content, int statusID) {
        query = "insert into Hire values (?,?,?,?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, mentorID);
            ps.setInt(2, menteeID);
            ps.setString(3, content);
            ps.setInt(4, statusID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
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
                list.add(new Mentor(rs.getInt(1), 
                                    rs.getString(2), 
                                    rs.getString(3), 
                                    rs.getString(4), 
                                    rs.getString(5), 
                                    rs.getString(6),
                                    rs.getDate(7), 
                                    rs.getString(8), 
                                    rs.getString(9), 
                                    rs.getString(10), 
                                    rs.getString(11), 
                                    rs.getString(12), 
                                    rs.getString(13),
                                    rs.getString(14),
                                    rs.getInt(15),
                                    rs.getFloat(16)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Skill> getAllSkill() {
        List<Skill> list = new ArrayList<>();
        query = "Select * From skill";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1), rs.getString(2)));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Mentor> getMentorFromRequest(String skillId) {
        List<Mentor> list = new ArrayList<>();
        query = "select [Name].firstName, [Name].lastName, mentor.avatar, mentor.introduce, [status].[Status]\n"
                + "from mentor left outer join hire\n"
                + "on mentor.id = hire.mentorID\n"
                + "left outer join [Name]\n"
                + "on mentor.id = [Name].id\n"
                + "left outer join [status]\n"
                + "on hire.statusID = [status].id\n"
                + "left outer join mentorSkill\n"
                + "on mentor.id = mentorSkill.mentorID\n"
                + "where mentorSkill.skillID in (?,?,?)\n"
                + "group by [Name].firstName, [Name].lastName, mentor.avatar, mentor.introduce, [status].[Status]\n"
                + "HAVING COUNT(DISTINCT mentorSkill.skillID) = 4;";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, skillId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Mentor> getTop3Mentor() {
        List<Mentor> list = new ArrayList<>();
        query = "with t As (select Top (3) f.mentorID, AVG(f.rate) rateAverage from feedback f\n"
                + "group by f.mentorID)\n"
                + "select top (3) m.id,n.firstName,n.lastName,m.avatar,t.rateAverage,m.introduce from t,mentor m, [Name] n \n"
                + "where t.[mentorID]=m.id and n.id=m.id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getFloat(5), rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Feedback> getFeedback(int mentorid){
        List<Feedback> list = new ArrayList<>();
        query = "select top 3 f.commentdetail,m.id from mentor m,feedback f where m.id=f.mentorid and m.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1,mentorid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
