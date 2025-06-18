package com.ldl.controller;

import com.ldl.entity.*;
import com.ldl.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/sales")
public class SalesOrderController {
    @Autowired
    private SalesOrderService salesOrderService;
    @Autowired
    FinancialRecordService financialRecordService;
    @Autowired
    InventoryService inventoryService;
    @Autowired
    ProductService productService;
    @GetMapping("/list")
    public String list(Model model) {
        System.out.printf("!!!!!!!!!!!!!!!!!!!!");
        List<SalesOrder> salesList = salesOrderService.selectAll();
        model.addAttribute("salesList", salesList);
        return "sales/list";
    }
    // 显示编辑商品表单
    @GetMapping("/pay/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        // 根据ID查询商品
        SalesOrder order = salesOrderService.selectById(id);
        // 将商品信息添加到Model中
        model.addAttribute("order", order);
        // 返回编辑页面
        return "sales/pay";
    }


    @PostMapping("/pay")
    public String pay(@RequestParam("id") String id, @RequestParam("payment_method") String name, RedirectAttributes redirectAttributes) {
        System.out.println(salesOrderService.selectById(id).toString());
        System.out.println(salesOrderService.selectById(id).getProductId());
        String pid = salesOrderService.selectById(id).getProductId();
        Inventory inventory = inventoryService.getInventoryByPId(pid);
        if(inventory == null){
            redirectAttributes.addFlashAttribute("error", "商品库存记录不存在");
            System.out.printf("不存在");
            return "redirect:/sales/list";
        }
        else if(inventory.getQuantity() - salesOrderService.selectById(id).getQuantity()<0){
            redirectAttributes.addFlashAttribute("error", "库存不足");
            return "redirect:/sales/list";
        }
        else{
            salesOrderService.payOrder(id, name);
            redirectAttributes.addFlashAttribute("success", "支付成功");
            return "redirect:/sales/list";
        }
        }



    @GetMapping("/delete/{id}")
    public String deleteRole(@PathVariable("id") String id) {
        FinancialRecord financialRecord = financialRecordService.selectBySid(id);

        financialRecordService.delete(financialRecord.getRecordId());
        salesOrderService.delete(id);
        return "redirect:/sales/list";
    }
    @GetMapping("/add")
    public String add(Model model){
        List<Product> products = productService.getAllProduct();
        model.addAttribute("products",products);
        return "sales/add";
    }
    @PostMapping("/add")
    public String addSalesOrder(@ModelAttribute SalesOrder salesOrders) {
        System.out.println("!!!!!!!!!!!!!!!!!");
        System.out.println(salesOrders.toString());
        System.out.println("!!!!!!!!!!!!!!!!!!!!");
        salesOrderService.insert(salesOrders);
        return "redirect:/sales/list";
    }


//    // 供应商报价列表
//    @GetMapping("/list/{approvedId}")
//    public String listBids(@PathVariable int approvedId, Model model) {
//        System.out.printf("!!!!!");
//        List<SupplierBid> bidList = supplierBidService.getBidsByApprovedId(approvedId);
//        ApprovedPurchaseDemand demand = approvedPurchaseDemandService.getApprovedDemandById(approvedId);
//
//        model.addAttribute("bids", bidList);
//        model.addAttribute("demand", demand);
//        return "supplierBid/list";
//    }
//
//    // 新增报价页面
//    @GetMapping("/add/{approvedId}")
//    public String showAddForm(@PathVariable int approvedId, Model model) {
//        ApprovedPurchaseDemand demand = approvedPurchaseDemandService.getApprovedDemandById(approvedId);
//        model.addAttribute("demand", demand);
//        model.addAttribute("bid", new SupplierBid());
//        return "supplierBid/add";
//    }
//
//    // 提交报价
//    @PostMapping("/add")
//    public String addBid(@ModelAttribute SupplierBid bid) {
//        supplierBidService.insertBid(bid);
//        return "redirect:/supplierBid/list/" + bid.getApprovedId();
//    }
}