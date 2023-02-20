/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBContext;
import DTO.Account;
import DTO.Mentee;
import DTO.Mentor;
import DTO.Role;
import DTO.Skill;
import DTO.Request;
import DTO.Hire;
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
        query = "select * from mentee where  id= ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Mentee(rs.getInt(1), rs.getString(2),
                        rs.getString(3), rs.getString(4), rs.getString(5),
                        rs.getDate(6), rs.getString(7), rs.getString(8));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

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
                List<String> skills = new ArrayList<>();
                boolean requestExists = false;
                for (Request r : list) {
                    if (r.getId() == requestId) {
                        r.getSkill().add(rs.getString(4));
                        requestExists = true;
                        break;
                    }
                }
                int menteeID = rs.getInt(5);
                Date deadline = rs.getDate(6);
                int statusID = rs.getInt(7);
                int rate = rs.getInt(8);
                if (!requestExists) {
                    skills.add(rs.getString(5));
                    list.add(new Request(requestId, title, content, skills, menteeID, deadline, statusID, rate));
                }
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<Hire> getHire(){
        List<Hire> hireList = new ArrayList<>();
        query = "select * from hire";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while(rs.next()){
                hireList.add(new Hire(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return hireList;
    }
     public void InsertHire(int mentorID, int menteeID, String content ,int statusID) {
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

    public static void main(String[] args) {
        Mentee m = new DAO().getMenteeById(1);
        System.out.println(m);
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
}
