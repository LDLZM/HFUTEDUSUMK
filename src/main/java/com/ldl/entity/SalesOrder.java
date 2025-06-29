package com.ldl.entity;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

public class SalesOrder {
    private String orderId;
    private Timestamp orderDate;
    private String productId;
    private Integer quantity;
    private float totalAmount;
    private String paymentMethod;
    private Integer paymentStatus;
    private String remarks;
    private int refundState;

    @Override
    public String toString() {
        return "SalesOrder{" +
                "orderId='" + orderId + '\'' +
                ", orderDate=" + orderDate +
                ", productId='" + productId + '\'' +
                ", quantity=" + quantity +
                ", totalAmount=" + totalAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                ", paymentStatus=" + paymentStatus +
                ", remarks='" + remarks + '\'' +
                ", refundState=" + refundState +
                '}';
    }

    public int getRefundState() {
        return refundState;
    }

    public void setRefundState(int refundState) {
        this.refundState = refundState;
    }

    public SalesOrder(String orderId, Timestamp orderDate, String productId, Integer quantity, float totalAmount, String paymentMethod, Integer paymentStatus, String remarks, int refundState) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.productId = productId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.remarks = remarks;
        this.refundState = refundState;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Integer getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(Integer paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public SalesOrder() {
    }

    public SalesOrder(String orderId, Timestamp orderDate, String productId, Integer quantity, float totalAmount, String paymentMethod, Integer paymentStatus, String remarks) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.productId = productId;
        this.quantity = quantity;
        this.totalAmount = totalAmount;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.remarks = remarks;
    }
}
