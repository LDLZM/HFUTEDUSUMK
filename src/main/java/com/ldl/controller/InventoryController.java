package com.ldl.controller;

import com.ldl.entity.Inventory;
import com.ldl.entity.Product;
import com.ldl.service.InventoryService;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/inventory")
public class InventoryController {
    
    @Autowired
    private InventoryService inventoryService;
    @Autowired
    private ProductService productService;
    @GetMapping("/check_list")
    public String check_listinventory(Model model) {
        List<Inventory> inventoryList;
        inventoryList = inventoryService.selectLatestInventory();
        model.addAttribute("inventory", inventoryList);
        return "inventory/check_list";
    }
    @GetMapping("/list")
    public String listinventory(@RequestParam(required = false) String keyword, Model model) {
        List<Inventory> inventoryList;
        if (keyword != null && !keyword.isEmpty()) {

            // 调用带搜索条件的Service方法
            inventoryList = inventoryService.selectByKeyword(keyword);
        } else {
            // 查询所有用户（无搜索条件）
            inventoryList = inventoryService.getAllInventory();
        }
        model.addAttribute("inventory", inventoryList);
        model.addAttribute("keyword", keyword); // 回显搜索关键词
        return "inventory/list";
    }

    @GetMapping("/add")

    public String showAddForm(Model model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products",products);
        return "inventory/add";
    }

    @PostMapping("/add")
    public String addInventory(@ModelAttribute Inventory inventory,@RequestParam("productId") String productId) {

        try {
            inventory.setProduct(productService.getProductById(productId));
            inventoryService.insertInventory(inventory);
            return "redirect:/inventory/list";
        } catch (Exception e) {
            return "err";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        // 根据ID查询库存
        Inventory inventory = inventoryService.getInventoryById(id);
        // 将商品信息添加到Model中
        model.addAttribute("inventory", inventory);

        // 返回编辑页面
        return "inventory/edit";
    }


    @PostMapping("/edit")
    public String processEditForm(@ModelAttribute Inventory inventory,
                                  Model model,
                                  @RequestParam("productId") String productId) {
        // 通过 productId 加载 Product 对象
        Product product = productService.getProductById(productId);
        inventory.setProduct(product);

        // 处理编辑逻辑
        inventoryService.updateInventory(inventory);

        return "redirect:/inventory/list";
    }




    @GetMapping("/delete/{id}")
    public String deleteInventory(@PathVariable("id") String id) {
        inventoryService.deleteInventory(id);
        return "redirect:/inventory/list";
    }
}    