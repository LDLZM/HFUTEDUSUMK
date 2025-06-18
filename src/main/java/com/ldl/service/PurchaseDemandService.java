package com.ldl.service;

import com.ldl.entity.PurchaseDemand;

import java.util.List;

public interface PurchaseDemandService {
    List<PurchaseDemand> getAllDemands();
    PurchaseDemand getDemandById(String id);
    void insertDemand(PurchaseDemand demand);
    void updateDemand(PurchaseDemand demand);
    void deleteDemand(String id);
    List<PurchaseDemand> selectByKeyword(String keyword);
    List<PurchaseDemand> getOpenDemands();
    void reviewDemand(String demandId, Integer isClosed) throws Exception;
    void updateStatus(PurchaseDemand demand);

}