package com.ldl.service.serviceImp;

import com.ldl.dao.ApprovedPurchaseDemandMapper;
import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.service.ApprovedPurchaseDemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApprovedPurchaseDemandServiceImp implements ApprovedPurchaseDemandService {
    @Autowired
    private ApprovedPurchaseDemandMapper approvedPurchaseDemandMapper;

    @Override
    public List<ApprovedPurchaseDemand> getAllApprovedDemands() {
        return approvedPurchaseDemandMapper.getAllApprovedDemands();
    }

    @Override
    public ApprovedPurchaseDemand getApprovedDemandById(String approvedId) {
        return approvedPurchaseDemandMapper.getApprovedDemandById(approvedId);
    }

    @Override
    public List<ApprovedPurchaseDemand> getApprovedDemandsByStatus(int status) {
        return approvedPurchaseDemandMapper.getApprovedDemandsByStatus(status);
    }

    @Override
    public void insertApprovedDemand(ApprovedPurchaseDemand demand) {
        approvedPurchaseDemandMapper.insertApprovedDemand(demand);
    }

    @Override
    public void updateApprovedDemand(ApprovedPurchaseDemand demand) {
        approvedPurchaseDemandMapper.updateApprovedDemand(demand);
    }

    @Override
    public void setWinningSupplier(ApprovedPurchaseDemand demand) {
        approvedPurchaseDemandMapper.setWinningSupplier(demand);
    }
}