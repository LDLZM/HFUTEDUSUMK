package com.ldl.service;

import com.ldl.entity.SupplierBid;

import java.util.List;

public interface SupplierBidService {
    List<SupplierBid> getAllBids();
    SupplierBid getBidById(String bidId);
    List<SupplierBid> getBidsByApprovedId(String approvedId);
    List<SupplierBid> getBidsBySupplierId(String supplierId);
    void insertBid(SupplierBid bid);
    void updateBidStatus(SupplierBid bid);
    void reviewBid(String bidId, Integer isWinning) throws Exception;

}