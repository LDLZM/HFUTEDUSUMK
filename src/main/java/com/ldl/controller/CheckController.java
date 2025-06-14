package com.ldl.controller;

import com.ldl.entity.*;
import com.ldl.service.ApprovedPurchaseDemandService;
import com.ldl.service.ProductCheckService;
import com.ldl.service.PurchaseDemandService;
import com.ldl.service.SupplierBidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/check")

public class CheckController {
    @Autowired
    PurchaseDemandService purchaseDemandService;
    @Autowired
    SupplierBidService supplierBidService;
    @Autowired
    ApprovedPurchaseDemandService approvedPurchaseDemandService;
    @Autowired
    ProductCheckService productCheckService;

    @GetMapping("/what")
    public String checkWhat(){
        return "check/what";
    }

    @GetMapping("/Demandlist")
    public String checkList(@RequestParam(required = false) String keyword,
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
        return "check/Demandlist";
    }
    @GetMapping("/Bidlist")
    public String list(Model model) {
        List<SupplierBid> bidList = supplierBidService.getAllBids();
        model.addAttribute("bids", bidList);
        return "check/Bidlist";
    }

    @GetMapping("/ProductCheckList")
    public String showProductReviewForm(Model model) {
        List<ProductCheck> productChecks = productCheckService.getAllProductCheck();
        model.addAttribute("productChecks", productChecks);
        return "check/ProductreviewList";
    }


    // 显示审核页面
    @GetMapping("/BidReview/{id}")
    public String showBidreviewForm(@PathVariable("id") Integer demandId, Model model) {
        SupplierBid bid = supplierBidService.getBidById(demandId);
        System.out.printf(bid.toString());
        Supplier supplier = bid.getSupplier();
        ApprovedPurchaseDemand approvedPurchaseDemand = approvedPurchaseDemandService.getApprovedDemandById(bid.getApprovedId());
        model.addAttribute("apd",approvedPurchaseDemand);
        model.addAttribute("bid", bid);
        model.addAttribute("supplier", supplier);
        return "check/BidReview";
    }

    // 处理审核提交
    @PostMapping("/processBidReview")
    public String processBidreview(@RequestParam("bidId") Integer demandId,
                                @RequestParam("isWinning") Integer isClosed,
                                RedirectAttributes redirectAttributes) {

        try {
            // 调用服务层处理审核逻辑
            supplierBidService.reviewBid(demandId, isClosed);
            redirectAttributes.addFlashAttribute("message", "审核成功");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "审核失败: " + e.getMessage());
        }

        return "redirect:/check/Bidlist";
    }




















    // 显示审核页面
    @GetMapping("/Demandreview/{id}")
    public String showReviewForm(@PathVariable("id") Integer demandId, Model model) {
        System.out.printf("!!!!!!!!!!!1");
        PurchaseDemand demand = purchaseDemandService.getDemandById(demandId);
        model.addAttribute("demand", demand);
        return "check/Demandreview";
    }

    // 处理审核提交
    @PostMapping("/processDemandreview")
    public String processReview(@RequestParam("demandId") Integer demandId,
                                @RequestParam("isClosed") Integer isClosed,
                                RedirectAttributes redirectAttributes) {

        try {
            // 调用服务层处理审核逻辑
            purchaseDemandService.reviewDemand(demandId, isClosed);
            redirectAttributes.addFlashAttribute("message", "审核成功");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "审核失败: " + e.getMessage());
        }

        return "redirect:/check/Demandlist";
    }




    // 显示审核页面
    @GetMapping("/Productreview/{id}")
    public String showProductReviewForm(@PathVariable("id") Integer id, Model model) {
        System.out.printf("/Productreview/{id}");
        ProductCheck productCheck = productCheckService.getProductCheckById(id);
        model.addAttribute("productCheck", productCheck);
        return "check/Productreview";
    }

    // 处理审核提交
    @PostMapping("/processProductReview")
    public String processProductReview(@RequestParam("id") Integer id,
                                @RequestParam("isOK") Integer isOK,
                                @RequestParam("remarks")String remarks,
                                RedirectAttributes redirectAttributes) {

        try {
            // 调用服务层处理审核逻辑
            productCheckService.reviewProduct(id, isOK, remarks);
            redirectAttributes.addFlashAttribute("message", "审核成功");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "审核失败: " + e.getMessage());
        }

        return "redirect:/check/ProductCheckList";
    }



















































}
