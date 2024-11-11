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
public class spec {
    /*CREATE TABLE Specifications (
    SpecID INT PRIMARY KEY IDENTITY(1,1),
    LaptopID INT,
    Processor VARCHAR(100),
    RAM VARCHAR(50),
    Storage VARCHAR(100),
    ScreenSize VARCHAR(50),
    GraphicsCard VARCHAR(100),
    BatteryLife VARCHAR(50),
    Weight VARCHAR(50),
    OperatingSystem VARCHAR(50),
    ImageID INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (LaptopID) REFERENCES Laptops(LaptopID),
    FOREIGN KEY (ImageID) REFERENCES Images(ImageID)
);
*/
    
    private int specid;
    private int laptopid;
    private String cpu;
    private String ram;
    private String storage;
    private String res;
    private String card;
    private String battery;
    private String weight;
    private String os;
    public spec(){
        
    }
    
    public spec(int specid, int laptopid, String cpu, String ram, String storage, String res, String card, String battery, String weight, String os){
        this.specid = specid;
        this.battery = battery;
        this.card = card;
        this.cpu = cpu;
        this.laptopid = laptopid;
        this.res = res;
        this.os = os;
        this.ram = ram;
        this.weight = weight;
        this.storage = storage;
    }


   

    public int getSpecid() {
        return specid;
    }

    public int getLaptopid() {
        return laptopid;
    }

    public void setLaptopid(int laptopid) {
        this.laptopid = laptopid;
    }


    public String getCpu() {
        return cpu;
    }

    public String getRam() {
        return ram;
    }

    public String getStorage() {
        return storage;
    }

    public String getRes() {
        return res;
    }

    public String getCard() {
        return card;
    }

    public String getBattery() {
        return battery;
    }

    public String getWeight() {
        return weight;
    }

    public String getOs() {
        return os;
    }

    public void setSpecid(int specid) {
        this.specid = specid;
    }


    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public void setStorage(String storage) {
        this.storage = storage;
    }

    public void setRes(String res) {
        this.res = res;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public void setBattery(String battery) {
        this.battery = battery;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public void setOs(String os) {
        this.os = os;
    }


    
}
