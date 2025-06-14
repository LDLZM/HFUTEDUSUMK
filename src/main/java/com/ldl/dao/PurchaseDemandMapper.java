package com.ldl.dao;
import com.ldl.entity.PurchaseDemand;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PurchaseDemandMapper {
    List<PurchaseDemand> getAllDemands();
    PurchaseDemand getDemandById(Integer id);
    void insertDemand(PurchaseDemand demand);
    void updateDemand(PurchaseDemand demand);
    void deleteDemand(Integer id);
    List<PurchaseDemand> selectByKeyword(@Param("keyword") String keyword);
    List<PurchaseDemand> getOpenDemands();
}