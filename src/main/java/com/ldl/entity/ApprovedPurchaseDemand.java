package com.ldl.entity;

import java.sql.Timestamp;
import java.util.Stack;

public class ApprovedPurchaseDemand {
    private String approvedId;
    private String demandId;
    private String productId;
    private int demandQuantity;
    private Timestamp demandDate;
    private Timestamp approvedAt;
    private Timestamp deadlineDate;
    private int status; // 0-开放报价，1-关闭报价
    private String winningSupplierId;
    private Double winningPrice;
    private Timestamp createdAt;
    private Timestamp updatedAt;
    private int isOK;

    // 关联对象
    private Product product;
    private Supplier winningSupplier;

    public ApprovedPurchaseDemand(String approvedId, String demandId, String productId, int demandQuantity, Timestamp demandDate, Timestamp approvedAt, Timestamp deadlineDate, int status, String winningSupplierId, Double winningPrice, Timestamp createdAt, Timestamp updatedAt, int isOK, Product product, Supplier winningSupplier) {
        this.approvedId = approvedId;
        this.demandId = demandId;
        this.productId = productId;
        this.demandQuantity = demandQuantity;
        this.demandDate = demandDate;
        this.approvedAt = approvedAt;
        this.deadlineDate = deadlineDate;
        this.status = status;
        this.winningSupplierId = winningSupplierId;
        this.winningPrice = winningPrice;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.isOK = isOK;
        this.product = product;
        this.winningSupplier = winningSupplier;
    }
    public ApprovedPurchaseDemand() {}

    public int getIsOK() {
        return isOK;
    }

    public void setIsOK(int isOK) {
        this.isOK = isOK;
    }
    public String getApprovedId() {
        return approvedId;
    }

    public void setApprovedId(String approvedId) {
        this.approvedId = approvedId;
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

    public Timestamp getApprovedAt() {
        return approvedAt;
    }

    public void setApprovedAt(Timestamp approvedAt) {
        this.approvedAt = approvedAt;
    }

    public Timestamp getDeadlineDate() {
        return deadlineDate;
    }

    public void setDeadlineDate(Timestamp deadlineDate) {
        this.deadlineDate = deadlineDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getWinningSupplierId() {
        return winningSupplierId;
    }

    public void setWinningSupplierId(String winningSupplierId) {
        this.winningSupplierId = winningSupplierId;
    }

    public Double getWinningPrice() {
        return winningPrice;
    }

    public void setWinningPrice(Double winningPrice) {
        this.winningPrice = winningPrice;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Supplier getWinningSupplier() {
        return winningSupplier;
    }

    public void setWinningSupplier(Supplier winningSupplier) {
        this.winningSupplier = winningSupplier;
    }

    @Override
    public String toString() {
        return "ApprovedPurchaseDemand{" +
                "approvedId=" + approvedId +
                ", demandId=" + demandId +
                ", productId=" + productId +
                ", demandQuantity=" + demandQuantity +
                ", demandDate=" + demandDate +
                ", approvedAt=" + approvedAt +
                ", deadlineDate=" + deadlineDate +
                ", status=" + status +
                ", winningSupplierId=" + winningSupplierId +
                ", winningPrice=" + winningPrice +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                '}';
    }
}