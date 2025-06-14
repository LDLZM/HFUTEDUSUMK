package com.ldl.service;

import com.ldl.entity.Inventory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InventoryService {
    List<Inventory> getAllInventory();
    Inventory getInventoryById(Integer id);
    Inventory getInventoryByPId(Integer pid);
    void insertInventory(Inventory inventory);
    void updateInventory(Inventory inventory);
    void deleteInventory(Integer id);
    List<Inventory> selectByKeyword(@Param("keyword") String keyword);
}
