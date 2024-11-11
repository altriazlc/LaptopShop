/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhhag
 */
public class brand {
    /*CREATE TABLE Brands (
    BrandID INT PRIMARY KEY IDENTITY(1,1),
    BrandName VARCHAR(50) NOT NULL
);*/
    
    private int brandid;
    private String brandname;
    public brand(int id, String name){
        this.brandid = id;
        this.brandname = name;
    }

    public int getBrandid() {
        return brandid;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }
    
    
}
