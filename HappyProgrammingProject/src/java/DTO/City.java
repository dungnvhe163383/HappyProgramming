/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

/**
 *
 * @author okanh
 */
public class City {
    private int id;
    private String name;
    private int CountryID;

    public City(int id, String name, int CountryID) {
        this.id = id;
        this.name = name;
        this.CountryID = CountryID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCountryID() {
        return CountryID;
    }

    public void setCountryID(int CountryID) {
        this.CountryID = CountryID;
    }
    
    
}
