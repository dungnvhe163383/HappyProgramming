/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author ASUS
 */
public class Hire {
    private int hireID;
    private int mentorID;
    private int menteeID;
    private String content;
    private int statusID;
    private String statusHire;

    public Hire() {
    }

    public Hire(int mentorID, int menteeID, String content, int statusID) {
        this.mentorID = mentorID;
        this.menteeID = menteeID;
        this.content = content;
        this.statusID = statusID;
    }

    public Hire(int hireID, String content, String statusHire) {
        this.hireID = hireID;
        this.content = content;
        this.statusHire = statusHire;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public int getMenteeID() {
        return menteeID;
    }

    public void setMenteeID(int menteeID) {
        this.menteeID = menteeID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public String getStatusHire() {
        return statusHire;
    }

    public void setStatusHire(String statusHire) {
        this.statusHire = statusHire;
    }

    public int getHireID() {
        return hireID;
    }

    public void setHireID(int hireID) {
        this.hireID = hireID;
    }
    
    
}
