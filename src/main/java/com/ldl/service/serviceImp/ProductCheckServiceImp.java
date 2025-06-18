package com.ldl.service.serviceImp;

import com.ldl.dao.ApprovedPurchaseDemandMapper;
import com.ldl.dao.ProductCheckMapper;
import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.entity.ProductCheck;
import com.ldl.entity.PurchaseDemand;
import com.ldl.service.ProductCheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ProductCheckServiceImp implements ProductCheckService {
    @Autowired
    ProductCheckMapper productCheckMapper;
    @Autowired
    ApprovedPurchaseDemandMapper approvedPurchaseDemandMapper;

    @Override
    public List<ProductCheck> getAllProductCheck() {
        return productCheckMapper.getAllProductCheck();
    }

    @Override
    public ProductCheck getProductCheckById(String id) {
        return productCheckMapper.getProductCheckById(id);
    }

    @Override
    public void reviewProduct(String id, Integer isOK , String remarks) throws Exception {
        // 检查需求是否存在
        ProductCheck productCheck = productCheckMapper.getProductCheckById(id);
        if (productCheck == null) {
            throw new Exception("需求不存在");
        }

        // 检查需求状态是否为未审核
        if (productCheck.getIsOK() != 0) {
            throw new Exception("需求已审核，不能重复操作");
        }
        ApprovedPurchaseDemand approvedPurchaseDemand = approvedPurchaseDemandMapper.getApprovedDemandById(productCheck.getApprovedId());
        // 更新需求状态和审核备注
        System.out.println(productCheck.toString());
        productCheck.setIsOK(isOK);
        productCheck.setApprovedPurchaseDemand(approvedPurchaseDemand);
        productCheck.setRemarks(remarks);
        System.out.println(productCheck.toString());



        // 更新数据库
        productCheckMapper.update(productCheck);

    }

}
