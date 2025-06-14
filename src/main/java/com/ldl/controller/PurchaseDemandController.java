package com.ldl.controller;

import com.ldl.entity.PurchaseDemand;
import com.ldl.entity.Product;
import com.ldl.service.PurchaseDemandService;
import com.ldl.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/demand")
public class PurchaseDemandController {

    @Autowired
    private PurchaseDemandService purchaseDemandService;

    @Autowired
    private ProductService productService;

    @GetMapping("/list")
    public String listDemands(@RequestParam(required = false) String keyword,
                              @RequestParam(required = false) Boolean openOnly,
                              Model model) {
        List<PurchaseDemand> demandList;

        if (keyword != null && !keyword.isEmpty()) {
            demandList = purchaseDemandService.selectByKeyword(keyword);
        } else if (openOnly != null && openOnly) {
            demandList = purchaseDemandService.getOpenDemands();
        } else {
            demandList = purchaseDemandService.getAllDemands();
        }

        model.addAttribute("demands", demandList);
        model.addAttribute("keyword", keyword);
        model.addAttribute("openOnly", openOnly);
        return "demand/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products",products);
        return "demand/add";
    }

    @PostMapping("/add")
    public String addDemand(@ModelAttribute PurchaseDemand demand,
                            @RequestParam("productId") int productId) {
        try {
            Product product = productService.getProductById(productId);
            demand.setProduct(product);
            purchaseDemandService.insertDemand(demand);
            return "redirect:/demand/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "err";
        }
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Integer id, Model model) {
        PurchaseDemand demand = purchaseDemandService.getDemandById(id);
        model.addAttribute("demand", demand);
        return "demand/edit";
    }

    @PostMapping("/edit")
    public String processEditForm(@ModelAttribute PurchaseDemand demand,
                                  @RequestParam("productId") int productId) {
        try {
            Product product = productService.getProductById(productId);
            demand.setProduct(product);
            purchaseDemandService.updateDemand(demand);
            return "redirect:/demand/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "err";
        }
    }

    @GetMapping("/delete/{id}")
    public String deleteDemand(@PathVariable("id") Integer id) {
        purchaseDemandService.deleteDemand(id);
        return "redirect:/demand/list";
    }


}