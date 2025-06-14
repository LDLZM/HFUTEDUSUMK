package com.ldl.dao;

import com.ldl.entity.PurchaseDemand;
import com.ldl.entity.SupplierBid;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SupplierBidMapper {
    // 查询所有报价
    List<SupplierBid> getAllBids();

    // 根据ID查询
    SupplierBid getBidById(int bidId);

    // 根据需求ID查询报价
    List<SupplierBid> getBidsByApprovedId(int approvedId);

    // 根据供应商ID查询报价
    List<SupplierBid> getBidsBySupplierId(int supplierId);

    // 添加报价
    void insertBid(SupplierBid bid);

    // 更新报价状态（是否中标）
    void updateBidStatus(SupplierBid bid);

    void updateBid(SupplierBid bid);

}