/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author okanh
 */
public class Profession {
    private int id;
    private String profession;
    private String professionIntroduce;
    private int mentorid;

    public Profession(int id, String profession, String professionIntroduce, int mentorid) {
        this.id = id;
        this.profession = profession;
        this.professionIntroduce = professionIntroduce;
        this.mentorid = mentorid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getProfessionIntroduce() {
        return professionIntroduce;
    }

    public void setProfessionIntroduce(String professionIntroduce) {
        this.professionIntroduce = professionIntroduce;
    }

    public int getMentorid() {
        return mentorid;
    }

    public void setMentorid(int mentorid) {
        this.mentorid = mentorid;
    }
    
}
