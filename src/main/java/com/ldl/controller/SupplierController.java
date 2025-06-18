package com.ldl.controller;

import com.ldl.entity.Supplier;
import com.ldl.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/supplier")
public class SupplierController {
    @Autowired
    private SupplierService supplierService;

    // 列表页（带搜索）
    @GetMapping("/list")
    public String listSuppliers(@RequestParam(required = false) String keyword, Model model) {
        List<Supplier> supplierList;
        if (keyword != null && !keyword.isEmpty()) {
            supplierList = supplierService.searchSuppliersByName(keyword);
        } else {
            supplierList = supplierService.getAllSuppliers();
        }
        model.addAttribute("suppliers", supplierList);
        model.addAttribute("keyword", keyword);
        return "supplier/list";
    }

    // 添加页
    @GetMapping("/add")
    public String showAddForm(Model model) {
        return "supplier/add";
    }

    // 处理添加
    @PostMapping("/add")
    public String addSupplier(@ModelAttribute Supplier supplier) {
        supplierService.insertSupplier(supplier);
        return "redirect:/supplier/list";
    }

    // 编辑页
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        Supplier supplier = supplierService.getSupplierById(id);
        model.addAttribute("supplier", supplier);
        return "supplier/edit";
    }

    // 处理编辑
    @PostMapping("/edit")
    public String updateSupplier(@ModelAttribute Supplier supplier) {
        supplierService.updateSupplier(supplier);
        return "redirect:/supplier/list";
    }

    // 删除
    @GetMapping("/delete/{id}")
    public String deleteSupplier(@PathVariable String id) {
        supplierService.deleteSupplier(id);
        return "redirect:/supplier/list";
    }
}