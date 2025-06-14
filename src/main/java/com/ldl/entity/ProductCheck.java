package com.ldl.entity;

public class ProductCheck {
    private Integer id;
    private Integer approvedId;
    private Integer isOK;
    private ApprovedPurchaseDemand approvedPurchaseDemand;
    private String remarks;
    @Override
    public String toString() {
        return "ProductCheck{" +
                "id=" + id +
                ", approvedId=" + approvedId +
                ", isOK=" + isOK +
                ", approvedPurchaseDemand=" + approvedPurchaseDemand +
                ", remarks='" + remarks + '\'' +
                '}';
    }
    public ProductCheck(Integer id, Integer approvedId, Integer isOK, ApprovedPurchaseDemand approvedPurchaseDemand, String remarks) {
        this.id = id;
        this.approvedId = approvedId;
        this.isOK = isOK;
        this.approvedPurchaseDemand = approvedPurchaseDemand;
        this.remarks = remarks;
    }

    public ProductCheck() {
    }



    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getApprovedId() {
        return approvedId;
    }

    public void setApprovedId(Integer approvedId) {
        this.approvedId = approvedId;
    }

    public Integer getIsOK() {
        return isOK;
    }

    public void setIsOK(Integer isOK) {
        this.isOK = isOK;
    }

    public ApprovedPurchaseDemand getApprovedPurchaseDemand() {
        return approvedPurchaseDemand;
    }

    public void setApprovedPurchaseDemand(ApprovedPurchaseDemand approvedPurchaseDemand) {
        this.approvedPurchaseDemand = approvedPurchaseDemand;
    }
}