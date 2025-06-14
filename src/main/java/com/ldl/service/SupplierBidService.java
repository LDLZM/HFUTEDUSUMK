package com.ldl.service;

import com.ldl.entity.SupplierBid;

import java.util.List;

public interface SupplierBidService {
    List<SupplierBid> getAllBids();
    SupplierBid getBidById(int bidId);
    List<SupplierBid> getBidsByApprovedId(int approvedId);
    List<SupplierBid> getBidsBySupplierId(int supplierId);
    void insertBid(SupplierBid bid);
    void updateBidStatus(SupplierBid bid);
    void reviewBid(Integer bidId, Integer isWinning) throws Exception;

}