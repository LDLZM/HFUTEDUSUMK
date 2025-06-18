package com.ldl.entity;

import java.sql.Timestamp;

public class Supplier {
    private String supplierId;
    private String supplierName;
    private String contactPerson;
    private String contactPhone;
    private String contactEmail;
    private int status; // 0-禁用，1-启用
    private Timestamp createdAt;

    // 构造方法、Getter和Setter
    public Supplier() {}

    public Supplier(String supplierId, String supplierName, String contactPerson,
                    String contactPhone, String contactEmail, int status, Timestamp createdAt) {
        this.supplierId = supplierId;
        this.supplierName = supplierName;
        this.contactPerson = contactPerson;
        this.contactPhone = contactPhone;
        this.contactEmail = contactEmail;
        this.status = status;
        this.createdAt = createdAt;
    }

    // Getter和Setter
    public String getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }
}