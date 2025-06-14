package com.ldl.service.serviceImp;

import com.ldl.dao.ProductMapper;
import com.ldl.entity.Product;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    ProductMapper productMapper;


    @Override
    public List<Product> getAllProduct() {

        return productMapper.getAllProduct();
    }

    @Override
    public Product getProductById(Integer roleId) {
        return productMapper.getProductById(roleId);
    }

    @Override
    public Product getProductByName(String roleName) {
        return productMapper.getProductByName(roleName);
    }

    @Override
    public void insertProduct(Product product) {
        productMapper.insertProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productMapper.updateProduct(product);
    }

    @Override
    public void deleteProduct(Integer id) {
        productMapper.deleteProduct(id);
    }

    @Override
    public List<Product> searchProducts(String keyword) {

        return productMapper.selectByKeyword(keyword);
    }
}
