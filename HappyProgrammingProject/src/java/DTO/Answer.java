package DTO;

public class Answer {
    private int  requestID;
    private int mentorID;
    private String content;

    public int getRequestID() {
        return requestID;
    }

    public void setRequestID(int requestID) {
        this.requestID = requestID;
    }

    public int getMentorID() {
        return mentorID;
    }

    public void setMentorID(int mentorID) {
        this.mentorID = mentorID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Answer() {
    }

    public Answer(int requestID, int mentorID, String content) {
        this.requestID = requestID;
        this.mentorID = mentorID;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Answer{" + "requestID=" + requestID + ", mentorID=" + mentorID + ", content=" + content + '}';
    }
    
    
}
