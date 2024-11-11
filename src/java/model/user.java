/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhhag
 */
public class user {
    private int userID;
    private String userName;
    private String email;
    private String pass;
    private int role;
    private String name;
    private String address;
    private String phone;

    // Constructor
    public user(){
        
    }
    public user(int userId,String userName, String email, String passwordHash, int role, String fullName, String address, String phone) {
        this.userName = userName;
        this.userID = userId;
        this.email = email;
        this.pass = passwordHash;
        this.role = role;
        this.name = fullName;
        this.address = address;
        this.phone = phone;
    }

    // Getters and setters (omitted for brevity)

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }



    public String getUserName() {
        return userName;
    }

    public String getEmail() {
        return email;
    }

    public String getPass() {
        return pass;
    }

    public int getRole() {
        return role;
    }

    public String getName() {
        return name;
    }

    public String getAddress() {
        return address;
    }

    public String getPhone() {
        return phone;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "user{" + "userID=" + userID + ", userName=" + userName + ", email=" + email + ", pass=" + pass + ", role=" + role + ", name=" + name + ", address=" + address + ", phone=" + phone + '}';
    }
    
}
