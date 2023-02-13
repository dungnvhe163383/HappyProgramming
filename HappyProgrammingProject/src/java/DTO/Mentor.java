/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class Mentor {

    private int id;
    private String address;
    private String email;
    private String name;
    private String phone;
    private Date birthday;
    private String sex;
    private String introduce;
    private String profession;
    private String professionIntroduce;
    private String achievement;
    private String avatar;
    private int costHire;

    public Mentor(int id, String address, String email, String name, String phone, Date birthday, String sex, String introduce, String profession, String professionIntroduce, String achievement, String avatar, int costHire) {
        this.id = id;
        this.address = address;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.birthday = birthday;
        this.sex = sex;
        this.introduce = introduce;
        this.profession = profession;
        this.professionIntroduce = professionIntroduce;
        this.achievement = achievement;
        this.avatar = avatar;
        this.costHire = costHire;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
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

    public String getAchievement() {
        return achievement;
    }

    public void setAchievement(String achievement) {
        this.achievement = achievement;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getCostHire() {
        return costHire;
    }

    public void setCostHire(int costHire) {
        this.costHire = costHire;
    }

   
}
