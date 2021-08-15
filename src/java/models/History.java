
package models;


public class History {
    private int cartId, totalPrice;
    String username;

    public History(int cartId, int totalPrice, String username) {
        this.cartId = cartId;
        this.totalPrice = totalPrice;
        this.username = username;
    }

    public int getCartId() {
        return cartId;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public String getUsername() {
        return username;
    }
    
    
}   
