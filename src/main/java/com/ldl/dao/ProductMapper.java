package com.ldl.dao;

import com.ldl.entity.EduSupermarketUsers;
import com.ldl.entity.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ProductMapper {

    List<Product> getAllProduct();
    Product getProductById(String id);
    Product getProductByName(String roleName);
    void insertProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(String id);
    List<Product> selectByKeyword(@Param("keyword") String keyword);

}
