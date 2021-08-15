/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.io.Serializable;

public class Order extends Product implements Serializable{

    private int orderID;
    private int quantity;
    private int totalPrice;
    private Users user;

    public Order(int orderID, int quantity, int totalPrice, Users user, int ProductID, String ProductName, int ProductPrice, String ProductImage) {
        super(ProductID, ProductName, ProductPrice, ProductImage);
        this.orderID = orderID;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.user = user;
    }
    
    

    @Override
    public String toString() {

        return "Order{" + "orderID=" + orderID + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", user=" + user + ", pid=" + getProductID() + '}';
    }

    public Order() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public String getUsername() {
        return getUser().getUsername();
    }

    public void setUsername(String username) {
        username = getUsername();
    }

    @Override
    public void setProductID(int ProductID) {
        super.setProductID(ProductID); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getProductID() {
        return super.getProductID(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getProductImage() {
        return super.getProductImage(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getProductPrice() {
        return super.getProductPrice(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getProductName() {
        return super.getProductName(); //To change body of generated methods, choose Tools | Templates.
    }

    
}
