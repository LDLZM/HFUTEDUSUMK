package com.ldl.entity;

import java.sql.Timestamp;

public class PurchaseDemand {
    private String demandId;
    private String productId;
    private int demandQuantity;
    private Timestamp demandDate;
    private Integer is_closed = 0; // 默认值设为 0（未审核）
    private Product product;

    @Override
    public String toString() {
        return "PurchaseDemand{" +
                "demandId=" + demandId +
                ", productId=" + productId +
                ", demandQuantity=" + demandQuantity +
                ", demandDate=" + demandDate +
                ", is_closed=" + is_closed +
                ", product=" + product +
                '}';
    }

    public PurchaseDemand(){

    }
    public PurchaseDemand(String demandId, String productId, int demandQuantity, Timestamp demandDate, int is_closed, Product product) {
        this.demandId = demandId;
        this.productId = productId;
        this.demandQuantity = demandQuantity;
        this.demandDate = demandDate;
        this.is_closed = is_closed;
        this.product = product;
    }

    public String getDemandId() {
        return demandId;
    }

    public void setDemandId(String demandId) {
        this.demandId = demandId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public int getDemandQuantity() {
        return demandQuantity;
    }

    public void setDemandQuantity(int demandQuantity) {
        this.demandQuantity = demandQuantity;
    }

    public Timestamp getDemandDate() {
        return demandDate;
    }

    public void setDemandDate(Timestamp demandDate) {
        this.demandDate = demandDate;
    }

    public int getIs_closed() {
        return is_closed;
    }

    public void setIs_closed(int is_closed) {
        this.is_closed = is_closed;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}