/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author nhhag
 */
public class CartItem {

    private int cartItemID;
    private int laptopID;
    private int quantity;
    private int userID;

    public CartItem(int cartItemID,  int laptopID, int quantity, int userID) {
        this.cartItemID = cartItemID;
        this.laptopID = laptopID;
        this.quantity = quantity;
        this.userID = userID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }


    public void setLaptopID(int laptopID) {
        this.laptopID = laptopID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    // Getters and setters (optional)
    // ...
    public int getCartItemID() {
        return cartItemID;
    }


    public int getLaptopID() {
        return laptopID;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getUserID() {
        return userID;
    }

    @Override
    public String toString() {
        return "CartItem{" + "cartItemID=" + cartItemID + ", laptopID=" + laptopID + ", quantity=" + quantity + ", userID=" + userID + '}';
    }
    
}
