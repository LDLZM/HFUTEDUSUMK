package com.ldl.entity;

import java.sql.Timestamp;

public class PurchaseDemand {
    private int demandId;
    private int productId;
    private int demandQuantity;
    private Timestamp demandDate;
    private Integer is_closed = 0; // 默认值设为 0（未审核）
    private Product product;

    public PurchaseDemand(){

    }
    public PurchaseDemand(int demandId, int productId, int demandQuantity, Timestamp demandDate, int is_closed, Product product) {
        this.demandId = demandId;
        this.productId = productId;
        this.demandQuantity = demandQuantity;
        this.demandDate = demandDate;
        this.is_closed = is_closed;
        this.product = product;
    }

    public int getDemandId() {
        return demandId;
    }

    public void setDemandId(int demandId) {
        this.demandId = demandId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
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