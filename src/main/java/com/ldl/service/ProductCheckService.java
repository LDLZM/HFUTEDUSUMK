package com.ldl.service;

import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.entity.ProductCheck;

import java.util.List;

public interface ProductCheckService {
    List<ProductCheck> getAllProductCheck();

    // 根据ID查询
    ProductCheck getProductCheckById(Integer id);

    //
    void reviewProduct(Integer id, Integer isOK , String reviews) throws Exception;

}
