package com.ldl.dao;

import com.ldl.entity.ApprovedPurchaseDemand;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ApprovedPurchaseDemandMapper {
    // 查询所有已审核需求
    List<ApprovedPurchaseDemand> getAllApprovedDemands();

    // 根据ID查询
    ApprovedPurchaseDemand getApprovedDemandById(String approvedId);


    List<ApprovedPurchaseDemand> getApprovedDemandByPId(String Pid);


    // 根据状态查询
    List<ApprovedPurchaseDemand> getApprovedDemandsByStatus(int status);

    // 添加已审核需求
    void insertApprovedDemand(ApprovedPurchaseDemand demand);

    // 更新已审核需求
    void updateApprovedDemand(ApprovedPurchaseDemand demand);

    // 设置中标供应商
    void setWinningSupplier(ApprovedPurchaseDemand demand);
}