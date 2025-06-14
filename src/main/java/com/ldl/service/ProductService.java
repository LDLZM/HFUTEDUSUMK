package com.ldl.service;

import com.ldl.entity.EduSupermarketUsers;
import com.ldl.entity.Product;

import java.util.List;

public interface ProductService {

    List<Product> getAllProduct();
    Product getProductById(Integer roleId);
    Product getProductByName(String roleName);
    void insertProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(Integer id);
    List<Product> searchProducts(String keyword);

}
