package com.ldl.service;

import com.ldl.entity.EduSupermarketUsers;
import com.ldl.entity.Product;

import java.util.List;

public interface ProductService {

    List<Product> getAllProduct();
    Product getProductById(String id);
    Product getProductByName(String roleName);
    void insertProduct(Product product);
    void updateProduct(Product product);
    boolean deleteProduct(String id);
    List<Product> searchProducts(String keyword);

}
