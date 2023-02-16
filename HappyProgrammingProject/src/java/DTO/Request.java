
package DTO;

import java.sql.Date;
import java.util.List;


/**
 *
 * @author fpt shop
 */
public class Request {
    private int id;
    private String title;
    private String content;
    private List<String> skill;
    private int menteeID;
    private Date deadline;
    private int statusID;
    private int rate;

    public Request() {
    }

    public Request(int id, String title, String content, List<String> skill, int menteeID, Date deadline, int statusID, int rate) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.skill = skill;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<String> getSkill() {
        return skill;
    }

    public void setSkill(List<String> skill) {
        this.skill = skill;
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
