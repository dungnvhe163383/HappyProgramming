/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBContext;
import DTO.Account;
import DTO.Framework;
import DTO.Mentor;
import DTO.Role;
import DTO.Skill;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author okanh
 */
public class DAO extends DBContext{
    
    public List<Mentor> getAllMentor(){
        List<Mentor> list = new ArrayList<>();
        query = "select m.ID,m.Email ,m.FullName,c.city,ct.country, m.Phone,m.DateOfBirth,m.Sex,m.ServiceDesc,m.AchievementDesc,m.Avatar from Mentor m,City c,country ct \n" +
                "where m.CityID=c.ID and c.countryID=ct.ID";
        try {
            
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getDate(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
     public Mentor getMentor(int id){
        Mentor mentor=null;
        query = "select m.ID,m.Email ,m.FullName,c.city,ct.country, m.Phone,m.DateOfBirth,m.Sex,m.ServiceDesc,m.AchievementDesc,m.Avatar from Mentor m,City c,country ct \n" +
                "where m.CityID=c.ID and c.countryID=ct.ID and m.ID=?";
        try {
            
            ps = connection.prepareStatement(query);
             ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                mentor=new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getString(6),rs.getDate(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11));
            }
        } catch (Exception e) {
        }
        return mentor;
    }
    public List<Skill> getSkillByMentorID(int id){
         List<Skill> list = new ArrayList<>();
        query = "select skill.id,skill.Name from Mentor,MentorSkill,Skill where Mentor.ID=MentorSkill.MentorID and MentorSkill.SkillID=Skill.ID and Mentor.ID=?";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                list.add(new Skill(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public Account checkLogin(String username, String password){
        query = "select * from Account WHERE AccountName = ? AND Password = ? "; 
        try{
            ps = connection.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
            }
        }
        catch(SQLException e){
            System.out.println(e);
        }
        return null;
    }
    
    public List<Framework> getFramework(int id){
        List<Framework> list = new ArrayList<>();
        query = "select framework.ID,framework.framework from Mentor,Framework,MentorFramework where Mentor.ID=MentorFramework.MentorID and MentorFramework.FrameworkID=framework.ID and Mentor.ID=?";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Framework(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void updatePassword(String username, String pass,String newpass){
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
    
    public List<Role> getRole(){
        List<Role> list = new ArrayList<>();
        query = "select * from roles where name not like '%Admin%'";
        try {
            
            ps = connection.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Role(rs.getInt(1),rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public void InsertAccount(String username, String pass,int roleID){
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
    public void InsertMentee(int accID,String email){
        query = "insert into Mentee values (?,?)";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, accID);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    public void InsertMentor(int accID,String email){
        query = "insert into Mentor values (?,?)";
        try {
            
            ps = connection.prepareStatement(query);
            ps.setInt(1, accID);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
