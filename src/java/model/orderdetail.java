package model;

public class orderdetail {
    private int orderItemID;
    private int orderID;
    private int laptopid;
    private int quantity;
    private double price;

    public orderdetail(int orderItemID, int orderID, int laptopID, int quantity, double price) {
        this.orderItemID = orderItemID;
        this.orderID = orderID;
        this.laptopid = laptopID;
        this.quantity = quantity;
        this.price = price;
    }

    public void setOrderItemID(int orderItemID) {
        this.orderItemID = orderItemID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public void setLaptopid(int laptopid) {
        this.laptopid = laptopid;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    // Getters and setters (optional)
    // ...

    public int getOrderItemID() {
        return orderItemID;
    }

    public int getOrderID() {
        return orderID;
    }

    public int getLaptopid() {
        return laptopid;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getPrice() {
        return price;
    }
}
