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
public class order {

    private int oid;
    private int userid;
    private Date odate;
    private int total;
    private String status;

    public order(int oid, int userid, Date date, int total, String status) {
        this.oid = oid;
        this.status = status;
        this.total = total;
        this.odate = date;
        this.userid = userid;
    }

    public int getOid() {
        return oid;
    }

    public int getUserid() {
        return userid;
    }

    public Date getOdate() {
        return odate;
    }

    public int getTotal() {
        return total;
    }

    public String getStatus() {
        return status;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void setOdate(Date odate) {
        this.odate = odate;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "order{" + "oid=" + oid + ", userid=" + userid + ", odate=" + odate + ", total=" + total + ", status=" + status + '}';
    }
    

}
