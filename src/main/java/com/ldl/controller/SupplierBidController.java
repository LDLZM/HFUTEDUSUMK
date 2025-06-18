package com.ldl.controller;

import com.ldl.entity.ApprovedPurchaseDemand;
import com.ldl.entity.SupplierBid;
import com.ldl.service.ApprovedPurchaseDemandService;
import com.ldl.service.SupplierBidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/supplierBid")
public class SupplierBidController {
    @Autowired
    private SupplierBidService supplierBidService;
    @Autowired
    private ApprovedPurchaseDemandService approvedPurchaseDemandService;
    // 供应商报价列表
    @GetMapping("/list")
    public String list(Model model) {
        System.out.printf("!!!!!!!!!!!!!!!!!!!!");
        List<SupplierBid> bidList = supplierBidService.getAllBids();
        model.addAttribute("bids", bidList);
        return "supplierBid/list";
    }
    // 供应商报价列表
    @GetMapping("/list/{approvedId}")
    public String listBids(@PathVariable String approvedId, Model model) {
        System.out.println("#@$#");
        List<SupplierBid> bidList = supplierBidService.getBidsByApprovedId(approvedId);
        System.out.println(bidList.toString());
        ApprovedPurchaseDemand demand = approvedPurchaseDemandService.getApprovedDemandById(approvedId);

        model.addAttribute("bids", bidList);
        model.addAttribute("demand", demand);
        return "supplierBid/list";
    }

    // 新增报价页面
    @GetMapping("/add/{approvedId}")
    public String showAddForm(@PathVariable String approvedId, Model model) {
        ApprovedPurchaseDemand demand = approvedPurchaseDemandService.getApprovedDemandById(approvedId);
        model.addAttribute("demand", demand);
        model.addAttribute("bid", new SupplierBid());
        return "supplierBid/add";
    }

    // 提交报价
    @PostMapping("/add")
    public String addBid(@ModelAttribute SupplierBid bid,Model model) {
        List<ApprovedPurchaseDemand> demandList = approvedPurchaseDemandService.getAllApprovedDemands();
        model.addAttribute("demands", demandList);
        supplierBidService.insertBid(bid);
        return "approvedDemand/list";
    }
}