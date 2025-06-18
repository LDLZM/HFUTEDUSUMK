package com.ldl.controller;

import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.service.ApprovedPurchaseDemandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/approvedDemand")
public class ApprovedPurchaseDemandController {
    @Autowired
    private ApprovedPurchaseDemandService approvedPurchaseDemandService;

    // 列表页
    @GetMapping("/list")
    public String listApprovedDemands(Model model) {
        System.out.println("111");
        List<ApprovedPurchaseDemand> demandList = approvedPurchaseDemandService.getAllApprovedDemands();
        model.addAttribute("demands", demandList);
        return "approvedDemand/list";
    }

    // 查看详情
    @GetMapping("/detail/{id}")
    public String viewDetail(@PathVariable String id, Model model) {
        ApprovedPurchaseDemand demand = approvedPurchaseDemandService.getApprovedDemandById(id);
        model.addAttribute("demand", demand);
        return "approvedDemand/detail";
    }

    // 设置中标供应商
    @PostMapping("/setWinningSupplier")
    public String setWinningSupplier(@ModelAttribute ApprovedPurchaseDemand demand) {
        approvedPurchaseDemandService.setWinningSupplier(demand);
        return "redirect:/approvedDemand/detail/" + demand.getApprovedId();
    }
}