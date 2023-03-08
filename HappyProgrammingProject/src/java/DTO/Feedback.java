/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author okanh
 */
public class Feedback {
    private int id;
    private Mentee mentee;
    private String commentDetail;
    private int requestID;
    private int mentorID;
    private int rate;

    public Feedback() {
    }

    public Feedback(Mentee mentee, String commentDetail) {
        this.mentee = mentee;
        this.commentDetail = commentDetail;
    }
    
    public Feedback(int id, String commentDetail, int requestID, int mentorID, int rate) {
        this.id = id;
        this.commentDetail = commentDetail;
        this.requestID = requestID;
        this.mentorID = mentorID;
        this.rate = rate;
    }

    public Feedback(String commentDetail, int mentorID) {
        this.commentDetail = commentDetail;
        this.mentorID = mentorID;
    }

    public Feedback(int id, String commentDetail, int requestID) {
        this.id = id;
        this.commentDetail = commentDetail;
        this.requestID = requestID;
    }

    public Mentee getMentee() {
        return mentee;
    }

    public void setMentee(Mentee mentee) {
        this.mentee = mentee;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCommentDetail() {
        return commentDetail;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }
    
    
}
