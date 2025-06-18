package com.ldl.service.serviceImp;

import com.ldl.dao.PurchaseDemandMapper;
import com.ldl.entity.PurchaseDemand;
import com.ldl.service.PurchaseDemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PurchaseDemandServiceImp implements PurchaseDemandService {

    @Autowired
    private PurchaseDemandMapper purchaseDemandMapper;

    @Override
    public List<PurchaseDemand> getAllDemands() {
        return purchaseDemandMapper.getAllDemands();
    }

    @Override
    public PurchaseDemand getDemandById(String id) {
        return purchaseDemandMapper.getDemandById(id);
    }

    @Override
    public void insertDemand(PurchaseDemand demand) {
        purchaseDemandMapper.insertDemand(demand);
    }

    @Override
    public void updateDemand(PurchaseDemand demand) {
        purchaseDemandMapper.updateDemand(demand);
    }

    @Override
    public void deleteDemand(String id) {
        purchaseDemandMapper.deleteDemand(id);
    }

    @Override
    public List<PurchaseDemand> selectByKeyword(String keyword) {
        return purchaseDemandMapper.selectByKeyword("%" + keyword + "%");
    }

    @Override
    public List<PurchaseDemand> getOpenDemands() {
        return purchaseDemandMapper.getOpenDemands();
    }

    @Override
    public void reviewDemand(String demandId, Integer isClosed) throws Exception {
        // 检查需求是否存在
        PurchaseDemand demand = purchaseDemandMapper.getDemandById(demandId);
        if (demand == null) {
            throw new Exception("需求不存在");
        }

        // 检查需求状态是否为未审核
        if (demand.getIs_closed() != 0) {
            throw new Exception("需求已审核，不能重复操作");
        }

        System.out.println(demand.toString());
        // 更新需求状态和审核备注
        demand.setIs_closed(isClosed);
        System.out.println(demand.toString());
        purchaseDemandMapper.updateDemand(demand);
        // 更新数据库
        System.out.println();

    }

    @Override
    public void updateStatus(PurchaseDemand demand) {
        purchaseDemandMapper.updateStatus(demand);
    }


}