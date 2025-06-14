package com.ldl.service.serviceImp;

import com.ldl.dao.InventoryMapper;
import com.ldl.entity.Inventory;
import com.ldl.service.InventoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class InventoryServiceImp implements InventoryService {

    @Autowired
    InventoryMapper inventoryMapper;
    @Override
    public List<Inventory> getAllInventory() {
        return inventoryMapper.getAllInventory();
    }

    @Override
    public Inventory getInventoryById(Integer id) {
        return inventoryMapper.getInventoryById(id);
    }

    @Override
    public Inventory getInventoryByPId(Integer pid) {
        return  inventoryMapper.getInventoryByPId(pid);
    }

    @Override
    public void insertInventory(Inventory inventory) {
        inventoryMapper.insertInventory(inventory);
    }

    @Override
    public void updateInventory(Inventory inventory) {
        inventoryMapper.updateInventory(inventory);
    }

    @Override
    public void deleteInventory(Integer id) {
        inventoryMapper.deleteInventory(id);

    }

    @Override
    public List<Inventory> selectByKeyword(String keyword) {
        return inventoryMapper.selectByKeyword("%" + keyword + "%");    }
}
