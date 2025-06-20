package com.ldl.service.serviceImp;

import com.ldl.dao.*;
import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.entity.Inventory;
import com.ldl.entity.Product;
import com.ldl.entity.SalesOrder;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    ProductMapper productMapper;
    @Autowired
    InventoryMapper inventoryMapper;
    @Autowired
    PurchaseDemandMapper purchaseDemandMapper;
    @Autowired
    ApprovedPurchaseDemandMapper approvedPurchaseDemandMapper;
    @Autowired
    SalesOrderMapper salesOrderMapper;

    @Override
    public List<Product> getAllProduct() {

        return productMapper.getAllProduct();
    }

    @Override
    public Product getProductById(String id) {
        return productMapper.getProductById(id);
    }

    @Override
    public Product getProductByName(String roleName) {
        return productMapper.getProductByName(roleName);
    }

    @Override
    public void insertProduct(Product product) {
        List<Product> products =productMapper.getAllProduct();
        for (Product p : products) {
            if (p.getId().equals(product.getId())) {
                throw new RuntimeException("商品ID已存在: " + product.getId());
            }
        }

        productMapper.insertProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productMapper.updateProduct(product);
    }

    @Override
    @Transactional
    public boolean deleteProduct(String id) {
        // 检查商品是否关联了库存、采购需求、已批准采购需求或销售订单
        if (true == false) {
            System.out.println(inventoryMapper.getInventoryByPId(id)==null);
            System.out.println(inventoryMapper.getInventoryByPId(id).toString());
            System.out.println(inventoryMapper.getInventoryByPId(id));


            System.out.println(purchaseDemandMapper.selectByKeyword(id).toString());
            System.out.println(purchaseDemandMapper.selectByKeyword(id)==null);
            System.out.println(purchaseDemandMapper.selectByKeyword(id));


            System.out.println(approvedPurchaseDemandMapper.getApprovedDemandByPId(id).toString());
            System.out.println(approvedPurchaseDemandMapper.getApprovedDemandByPId(id)==null);
            System.out.println(approvedPurchaseDemandMapper.getApprovedDemandByPId(id));

            System.out.println(salesOrderMapper.selectByPid(id).toString());
            System.out.println(salesOrderMapper.selectByPid(id)==null);
            System.out.println(salesOrderMapper.selectByPid(id));
            return false; // 有关联数据，删除失败
        }

        System.out.println("!!!!!!!!!!!");
        // 无关联数据，执行删除
        productMapper.deleteProduct(id);
        return true; // 删除成功
    }

    @Override
    public List<Product> searchProducts(String keyword) {

        System.out.println("!!!!"+keyword);
        return productMapper.selectByKeyword(keyword);
    }
}
