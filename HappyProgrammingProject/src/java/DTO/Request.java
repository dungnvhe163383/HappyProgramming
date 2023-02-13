
package DTO;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author fpt shop
 */
public class Request {
    private int id;
    private String tille;
    private String content;
    private int menteeID;
    private Date deadline;
    private int statusID;
    private int rate;

    public Request(int id, String tille, String content, int menteeID, Date deadline, int statusID, int rate) {
        this.id = id;
        this.tille = tille;
        this.content = content;
        this.menteeID = menteeID;
        this.deadline = deadline;
        this.statusID = statusID;
        this.rate = rate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTille() {
        return tille;
    }

    public void setTille(String tille) {
        this.tille = tille;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getMenteeID() {
        return menteeID;
    }

    public void setMenteeID(int menteeID) {
        this.menteeID = menteeID;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public int getStatusID() {
        return statusID;
    }

    public void setStatusID(int statusID) {
        this.statusID = statusID;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
    
    
  
}
