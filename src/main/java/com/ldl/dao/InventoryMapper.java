package com.ldl.dao;

import com.ldl.entity.EduSupermarketUsers;
import com.ldl.entity.Inventory;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface InventoryMapper {
    List<Inventory> getAllInventory();
    Inventory getInventoryById(Integer id);
    void insertInventory(Inventory inventory);
    void updateInventory(Inventory inventory);
    void deleteInventory(Integer id);
    List<Inventory> selectByKeyword(@Param("keyword") String keyword);
    Inventory getInventoryByPId(Integer pid);

}
