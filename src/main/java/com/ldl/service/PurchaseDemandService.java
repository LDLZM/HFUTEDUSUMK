package com.ldl.service;

import com.ldl.entity.PurchaseDemand;

import java.util.List;

public interface PurchaseDemandService {
    List<PurchaseDemand> getAllDemands();
    PurchaseDemand getDemandById(Integer id);
    void insertDemand(PurchaseDemand demand);
    void updateDemand(PurchaseDemand demand);
    void deleteDemand(Integer id);
    List<PurchaseDemand> selectByKeyword(String keyword);
    List<PurchaseDemand> getOpenDemands();
    void reviewDemand(Integer demandId, Integer isClosed) throws Exception;

}