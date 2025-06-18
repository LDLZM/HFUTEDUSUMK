package com.ldl.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;

public class Inventory {
    private String inventoryId;
    private String productId;
    private int quantity;
    private Timestamp lastUpdated;
    private Product product;
    private String event;

    public Inventory(String inventoryId, String productId, int quantity, Timestamp lastUpdated, Product product, String event) {
        this.inventoryId = inventoryId;
        this.productId = productId;
        this.quantity = quantity;
        this.lastUpdated = lastUpdated;
        this.product = product;
        this.event = event;
    }

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public Inventory(){

    }
    // 自定义setter，处理字符串输入
    public void setLastUpdated(String lastUpdatedStr) {
        System.out.printf("123324");
        if (lastUpdatedStr != null && !lastUpdatedStr.isEmpty()) {
            // 补全毫秒部分
            if (!lastUpdatedStr.contains(".")) {
                lastUpdatedStr = lastUpdatedStr + ".000";
            }
            this.lastUpdated = Timestamp.valueOf(lastUpdatedStr);
        }
    }
    @Override
    public String toString() {
        return "Inventory{" +
                "inventoryId=" + inventoryId +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", lastUpdated=" + lastUpdated +
                ", product=" + product +
                '}';
    }

    public Inventory(String inventoryId, String productId, int quantity, Timestamp lastUpdated, Product product) {
        this.inventoryId = inventoryId;
        this.productId = productId;
        this.quantity = quantity;
        this.lastUpdated = lastUpdated;
        this.product = product;
    }

    public String getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(String inventoryId) {
        this.inventoryId = inventoryId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Timestamp getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(Timestamp lastUpdated) {
        System.out.printf("dfgsfgsdg");
        this.lastUpdated = lastUpdated;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
