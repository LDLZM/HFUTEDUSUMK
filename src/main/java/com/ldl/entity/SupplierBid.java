package com.ldl.entity;

import java.sql.Timestamp;

public class SupplierBid {
    private String bidId;
    private String approvedId;
    private String supplierId;
    private double bidPrice;
    private int deliveryDays;
    private Timestamp bidTime;
    private int isWinning; // 是否中标
    private String bidRemarks;

    // 关联对象
    private ApprovedPurchaseDemand demand;
    private Supplier supplier;

    @Override
    public String toString() {
        return "SupplierBid{" +
                "bidId='" + bidId + '\'' +
                ", approvedId='" + approvedId + '\'' +
                ", supplierId='" + supplierId + '\'' +
                ", bidPrice=" + bidPrice +
                ", deliveryDays=" + deliveryDays +
                ", bidTime=" + bidTime +
                ", isWinning=" + isWinning +
                ", bidRemarks='" + bidRemarks + '\'' +
                ", demand=" + demand +
                ", supplier=" + supplier +
                '}';
    }

    // 无参构造
    public SupplierBid() {}

    // 有参构造
    public SupplierBid(String bidId, String approvedId, String supplierId, double bidPrice
                        , int deliveryDays, Timestamp bidTime,
                       int isWinning, String bidRemarks) {
        this.bidId = bidId;
        this.approvedId = approvedId;
        this.supplierId = supplierId;
        this.bidPrice = bidPrice;
        this.deliveryDays = deliveryDays;
        this.bidTime = bidTime;
        this.isWinning = isWinning;
        this.bidRemarks = bidRemarks;
    }

    // Getter和Setter方法
    public String getBidId() {
        return bidId;
    }

    public void setBidId(String bidId) {
        this.bidId = bidId;
    }

    public String getApprovedId() {
        return approvedId;
    }

    public void setApprovedId(String approvedId) {
        this.approvedId = approvedId;
    }

    public String  getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public double getBidPrice() {
        return bidPrice;
    }

    public void setBidPrice(double bidPrice) {
        this.bidPrice = bidPrice;
    }



    public int getDeliveryDays() {
        return deliveryDays;
    }

    public void setDeliveryDays(int deliveryDays) {
        this.deliveryDays = deliveryDays;
    }

    public Timestamp getBidTime() {
        return bidTime;
    }

    public void setBidTime(Timestamp bidTime) {
        this.bidTime = bidTime;
    }

    public int getIsWinning() {
        return isWinning;
    }

    public void setIsWinning(int isWinning) {
        this.isWinning = isWinning;
    }

    public String getBidRemarks() {
        return bidRemarks;
    }

    public void setBidRemarks(String bidRemarks) {
        this.bidRemarks = bidRemarks;
    }

    public ApprovedPurchaseDemand getDemand() {
        return demand;
    }

    public void setDemand(ApprovedPurchaseDemand demand) {
        this.demand = demand;
    }

    public Supplier getSupplier() {
        return supplier;
    }

    public void setSupplier(Supplier supplier) {
        this.supplier = supplier;
    }

}