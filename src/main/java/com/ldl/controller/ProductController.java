package com.ldl.controller;

import com.ldl.ApiResponse;
import com.ldl.entity.Product;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    // 显示编辑商品表单
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
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
            // 验证价格是否合理
            validatePrice(product.getUnitPrice());

            // 更新商品信息
            productService.updateProduct(product);

            // 添加成功消息
            model.addAttribute("successMsg", "商品更新成功");

            // 重定向到商品列表页面
            return "redirect:/products/list";
        } catch (Exception e) {
            // 添加错误消息
            model.addAttribute("errorMsg", "商品更新失败: " + e.getMessage());
            model.addAttribute("product", product); // 回显表单数据

            // 回到编辑页面
            return "products/edit";
        }
    }

    // 验证价格是否合理
    private void validatePrice(float price) {
        if (price <= 0) {
            throw new RuntimeException("价格必须大于0");
        }

        // 检查价格是否超出合理范围（例如：超过10000元）
        if (price > 10000) {
            throw new RuntimeException("价格过高，请确认是否合理");
        }
    }

    // 处理删除商品请求，返回JSON响应
    @PostMapping("/delete/{id}")
    @ResponseBody
    public ResponseEntity<?> deleteProduct(@PathVariable("id") String id) {
        try {
            boolean result = productService.deleteProduct(id);
            if (result) {
                return ResponseEntity.ok().body(new ApiResponse(true, "商品下架成功"));
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                        .body(new ApiResponse(false, "商品有关联数据，无法下架"));
            }
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body(new ApiResponse(false, "下架商品失败: " + e.getMessage()));
        }
    }

    // 显示编辑商品表单
    @GetMapping("/add")
    public String showAddForm() {
        // 返回编辑页面
        return "products/add";
    }

    // 处理添加商品请求
    @PostMapping("/add")
    public ResponseEntity<?> addProduct(@ModelAttribute Product product) {
        try{
            // 验证价格是否合理
            validatePrice(product.getUnitPrice());

            productService.insertProduct(product);
            return  ResponseEntity.ok().body(new ApiResponse(true,"商品添加成功"));
        }catch (RuntimeException e){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(new ApiResponse(false,e.getMessage()));
        }
    }
}
