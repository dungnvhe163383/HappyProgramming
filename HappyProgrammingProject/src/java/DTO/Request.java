
package DTO;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author fpt shop
 */
public class Request {
    private String tille;
    private Date deadline;
    private String content;
    private List<String> skill;
    private String programmingLanguage;
    private String status;

    public Request() {
    }

    public Request(String tille, Date deadline, String content, List<String> skill, String programmingLanguage, String status) {
        this.tille = tille;
        this.deadline = deadline;
        this.content = content;
        this.skill = skill;
        this.programmingLanguage = programmingLanguage;
        this.status = status;
    }

    public String getTille() {
        return tille;
    }

    public void setTille(String tille) {
        this.tille = tille;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
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

    public String getProgrammingLanguage() {
        return programmingLanguage;
    }

    public void setProgrammingLanguage(String programmingLanguage) {
        this.programmingLanguage = programmingLanguage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
