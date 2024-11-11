/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author nhhag
 */
public class laptop {
    /* CREATE TABLE Laptops (
    LaptopID INT PRIMARY KEY IDENTITY(1,1),
    BrandID INT,
    CategoryID INT,
    ModelName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Description TEXT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
     */
private int laptopid;
private int brandid;
private int catid;
private String name;
private String desc;
private Date date;
private String img;
private int price;
private int stock;
public laptop(){
    
}

public laptop(int id, int brandid, int catid, String name, String desc, Date date, String img,int price,int stock)
{
    this.img = img;
    this.date = date;
    this.laptopid = id;
    this.brandid = brandid;
    this.name = name;
    this.catid = catid;
    this.desc = desc;
    this.price = price;
    this.stock = stock;
}

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getStock() {
        return stock;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getPrice() {
        return price;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getLaptopid() {
        return laptopid;
    }

    public void setLaptopid(int laptopid) {
        this.laptopid = laptopid;
    }
    


    public int getBrandid() {
        return brandid;
    }

    public int getCatid() {
        return catid;
    }

    public String getName() {
        return name;
    }

    public String getDesc() {
        return desc;
    }


    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }

    public void setCatid(int catid) {
        this.catid = catid;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "laptop{" + "laptopid=" + laptopid + ", brandid=" + brandid + ", catid=" + catid + ", name=" + name + ", desc=" + desc + ", date=" + date + ", img=" + img + ", price=" + price + ", stock=" + stock + '}';
    }


}
