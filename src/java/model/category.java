/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhhag
 */
public class category {

    private int catid;
    private String catname;

    public category(int categoryID, String categoryName) {
        this.catid = categoryID;
        this.catname = categoryName;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public void setCatname(String catname) {
        this.catname = catname;
    }

    // Getters and setters (omitted for brevity)

    public int getCatid() {
        return catid;
    }

    public String getCatname() {
        return catname;
    }
}
