/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import ConnectDB.DBContext;
import DTO.Account;
import DTO.Mentor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author okanh
 */
public class User_DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public Account findByEmailMentee(String email, String username){
        Account result=null;
        String query = "select Account.ID,AccountName,Password,RoleID from Account,"
                + "Mentee where Account.ID=Mentee.ID and Mentee.Email like ? and Account.Accountname like ?";
        try {
            conn = new DBContext().getConnection();//connect with database
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                result= new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public Account findByEmailMentor(String email, String username){
        Account result=null;
        String query = "select Account.ID,AccountName,Password,RoleID from Account,"
                + "Mentor where Account.ID=Mentor.ID and Mentor.Email like ? and Account.Accountname like ?";
        try {
            conn = new DBContext().getConnection();//connect with database
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                result= new Account(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return result;
    }
    
    public List<Mentor> getMentor(){
        List<Mentor> list = new ArrayList<>();
        String query = "select * from Mentor";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Mentor(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getString(9),rs.getString(10),rs.getString(11),rs.getString(12),rs.getString(13)));
            }
        } catch (Exception e) {
        }
        return list;
    }
  
}
