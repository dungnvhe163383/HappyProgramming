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
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),rs.getString(12),rs.getInt(13)));
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
                mentor = new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11),rs.getString(12),rs.getInt(13));
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
        query = "select * from Account WHERE AccountName = ? AND Password = ? ";
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
        query = "Select Mentee.ID, Mentee.Email, Mentee.FullName ,City.city +', '+ country.country as [address], Mentee.Phone, Mentee.DateOfBirth,\n"
                + "Mentee.Sex, Mentee.Avatar\n"
                + "from Mentee Left outer join City\n"
                + "on Mentee.ID = City.ID \n"
                + "Left outer Join country \n"
                + "on City.countryID = country.ID \n"
                + "Where Mentee.ID = ?";
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
    Request request = new Request();
    query = "select RHM.ID, RHM.Title, RHM.Content, RHM.DeadlineDate, S.Skill\n"
            + "from RequestHistoryMentee RHM, Mentee M, Request R, RequestSkills RS, Skills S\n"
            + "where M.ID = RHM.MenteeID and R.ID = RHM.ID and RHM.ID = RS.RequestID and RS.SkillID = S.ID and RHM.MenteeID=?";
    try {
        ps = connection.prepareStatement(query);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        while (rs.next()) {
            int requestId = rs.getInt(1);
            String title = rs.getString(2);
            Date deadline = rs.getDate(4);
            String content = rs.getString(3);
            int status = rs.getInt(6);
            List<String> skills = new ArrayList<>();
            boolean requestExists = false;
            for (Request r : list) {
                if (r.getId() == requestId) {
                    r.getSkill().add(rs.getString(5));
                    requestExists = true;
                    break;
                }
            }

            if (!requestExists) {
                skills.add(rs.getString(5));
                list.add(new Request(requestId, title, deadline, content, skills, rs.getString(6), status));
            }
        }
    } catch (Exception e) {
    }
    return list;
    }
    
    public static void main(String[] args) {
        Mentee m = new DAO().getMenteeById(1);
        System.out.println(m);
    }
}
