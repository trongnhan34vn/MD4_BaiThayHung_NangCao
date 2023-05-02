package model;

public class Product {
    private int productId;
    private String productName;
    private String productImg;
    private String description;
    private float price;
    private int quantity;
    private boolean status;

    public Product(int productId, String productName, String productImg, String description, float price, int quantity, boolean status) {
        this.productId = productId;
        this.productName = productName;
        this.productImg = productImg;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.status = status;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}

