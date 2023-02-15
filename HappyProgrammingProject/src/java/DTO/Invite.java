package DTO;

/**
 *
 * @author fpt shop
 */
public class Invite {
    private int id;
    private int ReqID;
    private int MentorID;
    private int statusID;

    public Invite() {
    }

    public Invite(int id,int ReqID, int MentorID, int statusID) {
        this.id = id;
        this.ReqID = ReqID;
        this.MentorID = MentorID;
        this.statusID = statusID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getReqID() {
        return ReqID;
    }

    public void setReqID(int ReqID) {
        this.ReqID = ReqID;
    }

    public int getMentorID() {
        return MentorID;
    }

    public void setMentorID(int MentorID) {
        this.MentorID = MentorID;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }
    
}
