package com.ldl.service.serviceImp;

import com.ldl.dao.SupplierBidMapper;
import com.ldl.entity.PurchaseDemand;
import com.ldl.entity.SupplierBid;
import com.ldl.service.SupplierBidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierBidServiceImp implements SupplierBidService {
    @Autowired
    private SupplierBidMapper supplierBidMapper;

    @Override
    public List<SupplierBid> getAllBids() {
        return supplierBidMapper.getAllBids();
    }

    @Override
    public SupplierBid getBidById(int bidId) {
        return supplierBidMapper.getBidById(bidId);
    }

    @Override
    public List<SupplierBid> getBidsByApprovedId(int approvedId) {
        return supplierBidMapper.getBidsByApprovedId(approvedId);
    }

    @Override
    public List<SupplierBid> getBidsBySupplierId(int supplierId) {
        return supplierBidMapper.getBidsBySupplierId(supplierId);
    }

    @Override
    public void insertBid(SupplierBid bid) {
        supplierBidMapper.insertBid(bid);
    }

    @Override
    public void updateBidStatus(SupplierBid bid) {
        supplierBidMapper.updateBidStatus(bid);
    }

    @Override
    public void reviewBid(Integer bidId, Integer isWinning) throws Exception {
        // 检查需求是否存在
         SupplierBid bid = supplierBidMapper.getBidById(bidId);
        if (bid == null) {
            throw new Exception("不存在");
        }

        // 检查需求状态是否为未审核
        if (bid.getIsWinning() != 0) {
            throw new Exception("需求已审核，不能重复操作");
        }

        // 更新需求状态和审核备注
        bid.setIsWinning(isWinning);

        // 更新数据库
        supplierBidMapper.updateBid(bid);

    }
    }