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
import java.sql.PreparedStatement;

/**
 *
 * @author okanh
 */
public class DAO extends DBContext {
    public List<Profession> getProfessionByMentor(int mentorid){
        List<Profession> list = new ArrayList<>();
        query = "select * from profession where mentorid=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, mentorid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Profession(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Account  getAccountByEmail(String username, String email) {
        Account a=new Account();
        query = "With t as(select a.id,a.username,a.password,m.email,a.roleid from Account a,mentor m where a.id=m.id\n"
                + "Union \n"
                + "select a.id,a.username,a.password,m.email,a.roleid from Account a,mentee m where a.id=m.id)\n"
                + "select * from t where t.username like ? and t.email like ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, email);
            rs = ps.executeQuery();
            if(rs.next())
            a=new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getInt(5));
        } catch (Exception e) {
        }
        return a;
    }

    public List<Mentor> getAllMentor() {
        List<Mentor> list = new ArrayList<>();
        query = "select m.id,n.firstname,n.lastname,m.avatar,m.introduce from mentor m, [Name] n where m.id=n.id";
        try {
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Mentor getMentor(int id) {
        Mentor mentor = null;
        query = "select m.id,a.address,m.email,n.firstname,n.lastname,m.phone,m.birthday,m.sex,m.introduce,m.achievement,m.avatar,m.costhire\n"
                + "from mentor m, [Name] n, [address] a\n"
                + "where m.id=n.id and m.id=a.id and m.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentor = new Mentor(rs.getInt(1),
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
                        rs.getInt(12));
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

    public List<Feedback> getFeedback(int mentorid) {
        List<Feedback> list = new ArrayList<>();
        query = "select top 3 f.commentdetail,m.id from mentor m,feedback f where m.id=f.mentorid and m.id=?";
        try {
            ps = connection.prepareStatement(query);
            ps.setInt(1, mentorid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Feedback(rs.getString(1), rs.getInt(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void updateMentee(Mentee mentee) {
    query="Update mentee "
            + "set phone=?,avatar=? "
            + "where id=?";
    try {
        ps = connection.prepareStatement(query);
        //ps.setString(1, mentee.getEmail());
        ps.setString(1, mentee.getPhone());
        //ps.setDate(3, mentee.getBirthday());
        //ps.setString(4, mentee.getSex());
        ps.setString(2, mentee.getAvatar());
        ps.setInt(3,mentee.getId());
        ps.executeUpdate();
        
        String query2="Update [address]"
                + "set address=? "
                + "where id=?";
        PreparedStatement ps2 = connection.prepareStatement(query2);
        ps2.setString(1,mentee.getAddress());
        ps2.setInt(2, mentee.getId());
        ps2.executeUpdate();
        
        String query3="Update [Name] "
                + "set [firstName]=?, [lastName]=? "
                + "where id=?";
        PreparedStatement ps3 = connection.prepareStatement(query3);
        ps3.setString(1, mentee.getFirstName());
        ps3.setString(2, mentee.getLastName());
        ps3.setInt(3, mentee.getId());
        ps3.executeUpdate(); 
          
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        Mentee m=dao.getMenteeById(1);
//        System.out.println(m);
//        m.setFirstName("DAO");
//        dao.updateMentee(m);
//        System.out.println(m);
//    }
    public List<Hire> getHireById(String id) {
        List<Hire> listHire = new ArrayList<>();
        query = "select hire.id, hire.content, hire.statusID, [status].[Status]\n"
                + "from mentor left outer join hire on mentor.id = hire.mentorID\n"
                + " left outer join account on account.id = hire.menteeID or account.id = hire.mentorID\n"
                + "left outer join [status] on [status].id = hire.statusID\n"
                + "where account.id = ?";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                listHire.add(new Hire(rs.getInt(1), rs.getString(2),rs.getInt(3) ,rs.getString(4)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return listHire;

    }

    public List<Mentor> getMetorOfHire(String id) {
        List<Mentor> list = new ArrayList<>();
        query = "select [Name].firstName,[Name].lastName\n"
                + " from mentor  join hire  on mentor.id = hire.mentorID\n"
                + " join [Name]  on [Name].id = mentor.id\n"
                + " join account  on account.id = hire.menteeID or account.id = hire.mentorID\n"
                + " where account.id = ?";
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
    
    public Answer getAnswer(int requestID,int mentorID){
        Answer a = new Answer();
        query ="select * from answerRequest "
                + "where requestID=? and mentorID=?";
        try{
            ps=connection.prepareStatement(query);
            ps.setInt(1,a.getMentorID());
            ps.setInt(2, a.getMentorID());
            rs = ps.executeQuery();
            while(rs.next()){
                a = new Answer(rs.getInt(1),rs.getInt(2),rs.getString(3));
            }
        }catch(SQLException e){
            
        }
        return a;
    }
    public void rejectHire (String hireID){
        query = "update hire set hire.statusID = '10' where hire.id = ?";
        try{
            ps=connection.prepareStatement(query);
            ps.setString(1, hireID);
            rs = ps.executeQuery();
        }catch(SQLException e){
            
        }   
    }
    public void acceptHire (String hireID){
        query = "update hire set hire.statusID = '3' where hire.id = ?";
        try{
            ps=connection.prepareStatement(query);
            ps.setString(1, hireID);
            rs = ps.executeQuery();
        }catch(SQLException e){
            
        }   
    }
}
