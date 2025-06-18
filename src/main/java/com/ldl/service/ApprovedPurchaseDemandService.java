package com.ldl.service;

import com.ldl.entity.ApprovedPurchaseDemand;

import java.util.List;

public interface ApprovedPurchaseDemandService {
    List<ApprovedPurchaseDemand> getAllApprovedDemands();
    ApprovedPurchaseDemand getApprovedDemandById(String approvedId);
    List<ApprovedPurchaseDemand> getApprovedDemandsByStatus(int status);
    void insertApprovedDemand(ApprovedPurchaseDemand demand);
    void updateApprovedDemand(ApprovedPurchaseDemand demand);
    void setWinningSupplier(ApprovedPurchaseDemand demand);
}