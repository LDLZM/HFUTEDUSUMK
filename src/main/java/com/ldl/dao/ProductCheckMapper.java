package com.ldl.dao;

import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.entity.ProductCheck;
import com.ldl.entity.PurchaseDemand;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ProductCheckMapper {
    // 查询所有已审核需求
    List<ProductCheck> getAllProductCheck();

    // 根据ID查询
    ProductCheck getProductCheckById(String id);


    void update(ProductCheck productCheck);

//    // 设置中标供应商
//    void setISOK(Integer id);
}