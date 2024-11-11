/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhhag
 */
public class chartweek {

    private int monday;
    private int tuesday;
    private int wendsday;
    private int thursday;
    private int friday;
    private int saturday;
    private int sunday;

    public chartweek(int mon, int tue, int wed, int thur, int fri, int sat, int sun) {
        this.friday = fri;
        this.monday = mon;
        this.saturday = sat;
        this.thursday = thur;
        this.wendsday = wed;
        this.sunday = sun;
        this.tuesday = tue;
    }

    public int getMonday() {
        return monday;
    }

    public int getTuesday() {
        return tuesday;
    }

    public int getWendsday() {
        return wendsday;
    }

    public int getThursday() {
        return thursday;
    }

    public int getFriday() {
        return friday;
    }

    public int getSaturday() {
        return saturday;
    }

    public int getSunday() {
        return sunday;
    }

    public void setMonday(int monday) {
        this.monday = monday;
    }

    public void setTuesday(int tuesday) {
        this.tuesday = tuesday;
    }

    public void setWendsday(int wendsday) {
        this.wendsday = wendsday;
    }

    public void setThursday(int thursday) {
        this.thursday = thursday;
    }

    public void setFriday(int friday) {
        this.friday = friday;
    }

    public void setSaturday(int saturday) {
        this.saturday = saturday;
    }

    public void setSunday(int sunday) {
        this.sunday = sunday;
    }

    @Override
    public String toString() {
        return "chartweek{" + "monday=" + monday + ", tuesday=" + tuesday + ", wendsday=" + wendsday + ", thursday=" + thursday + ", friday=" + friday + ", saturday=" + saturday + ", sunday=" + sunday + '}';
    }
    
    
}
