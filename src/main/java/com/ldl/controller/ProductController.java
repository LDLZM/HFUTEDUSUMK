package com.ldl.controller;

import com.ldl.entity.EduSupermarketRoles;
import com.ldl.entity.EduSupermarketUsers;
import com.ldl.entity.Product;
import com.ldl.entity.SalesOrder;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("products")
public class ProductController {
    @Autowired
    ProductService productService;


    @GetMapping("/list")
    public String listProducts(@RequestParam(value = "keyword", required = false) String keyword,
                               Model model) {
        List<Product> products;

        if (keyword != null && !keyword.trim().isEmpty()) {
            // 如果有关键词，则进行搜索
            products = productService.searchProducts(keyword);
            model.addAttribute("keyword", keyword);
        } else {
            // 没有关键词则获取所有商品
            products = productService.getAllProduct();
        }

        // 将商品列表添加到模型中
        model.addAttribute("products", products);

        // 返回视图名称
        return "products/list";
    }
//    @GetMapping("/list")
//    public String listProducts(Model model){
//        List<Product> products =productService.getAllProduct();
//        model.addAttribute("products",products);
//        return "products/list";
//    }
//
//    @GetMapping("/add")
//    public String showAddForm(Model model) {
//        return "products/add";
//    }
//
//    @PostMapping("/add")
//    public String addProduct(@ModelAttribute Product product){
//        productService.insertProduct(product);
//        return "redirect:/products/list";
//    }

    // 显示编辑商品表单
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        // 根据ID查询商品
        Product product = productService.getProductById(id);

        // 将商品信息添加到Model中
        model.addAttribute("product", product);

        // 返回编辑页面
        return "products/edit";
    }

    // 处理编辑商品表单提交
    @PostMapping("/edit")
    public String processEditForm(
            @ModelAttribute Product product,
            Model model) {

        try {
            // 更新商品信息
            productService.updateProduct(product);

            // 添加成功消息
            model.addAttribute("successMsg", "商品更新成功");

            // 重定向到商品列表页面
            return "redirect:/products/list";
        } catch (Exception e) {
            // 添加错误消息
            model.addAttribute("errorMsg", "商品更新失败: " + e.getMessage());

            // 回到编辑页面
            return "products/edit";
        }
    }
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id")Integer id){
        productService.deleteProduct(id);
        return "redirect:/products/list";
    }




    // 显示编辑商品表单
    @GetMapping("/add")
    public String showAddForm() {
        // 返回编辑页面
        return "products/add";
    }
    // 显示编辑商品表单
    @PostMapping("/add")
    public String addProduct(@ModelAttribute Product product) {
        productService.insertProduct(product);
        return "redirect:/product/list";
    }



}
