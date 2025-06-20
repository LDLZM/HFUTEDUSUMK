package com.ldl.controller;

import com.ldl.entity.PurchaseDemand;
import com.ldl.entity.Product;
import com.ldl.service.PurchaseDemandService;
import com.ldl.service.ProductService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.Date;
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
    public String addDemand(
            @Valid PurchaseDemand demand,
            BindingResult bindingResult,
            @RequestParam("productId") String productId,
            RedirectAttributes redirectAttributes,
            @RequestParam("demandDate") String demandDateStr) {
        // 获取产品信息并设置到需求对象中
        Product product = productService.getProductById(productId);
        demand.setProduct(product);

        System.out.println(demandDateStr);
        System.out.println("==========================");
        // 清理并格式化日期字符串
        String formattedDateStr = cleanAndFormatDate(demandDateStr);
        System.out.println(formattedDateStr);
        // 解析日期字符串为LocalDateTime
        LocalDateTime localDateTime = parseToLocalDateTime(formattedDateStr);

        // 转换为Timestamp
        Timestamp timestamp = Timestamp.valueOf(localDateTime);
        demand.setDemandDate(timestamp);

        // 保存需求信息
        purchaseDemandService.insertDemand(demand);

        // 添加成功消息
        redirectAttributes.addFlashAttribute("success", "采购需求添加成功");
        return "redirect:/demand/list";
    }

    private String cleanAndFormatDate(String dateStr) {
        if (dateStr == null || dateStr.trim().isEmpty()) {
            throw new IllegalArgumentException("日期字符串不能为空");
        }

        // 移除所有逗号和多余空格
        dateStr = dateStr.replaceAll("[,，]", "");
        dateStr = dateStr.replaceAll("\\s+", " ").trim(); // 合并所有连续空格为单个空格并去除两端空格

        // 处理ISO格式 (带T分隔符)
        if (dateStr.contains("T")) {
            String[] parts = dateStr.split("T");
            if (parts.length == 2) {
                String datePart = parts[0];
                String timePart = parts[1].replaceAll("\\s", ""); // 移除时间部分中的所有空格

                // 确保时间部分格式正确
                String[] timeComponents = timePart.split(":");
                if (timeComponents.length == 2) { // 只有小时和分钟
                    timePart = timeComponents[0] + ":" + timeComponents[1] + ":00";
                } else if (timeComponents.length == 3) { // 有小时、分钟和秒
                    timePart = timeComponents[0] + ":" + timeComponents[1] + ":" + timeComponents[2];
                }

                return datePart + " " + timePart; // 转换为空格分隔的标准格式
            }
        }

        // 处理空格分隔的格式
        if (dateStr.contains(" ")) {
            String[] parts = dateStr.split(" ");
            if (parts.length == 2) {
                String datePart = parts[0];
                String timePart = parts[1].replaceAll("[:：]\\s*", ":"); // 处理时间部分中的空格

                // 处理时间部分
                String[] timeComponents = timePart.split(":");
                if (timeComponents.length == 2) { // 只有小时和分钟
                    timePart = timeComponents[0] + ":" + timeComponents[1] + ":00";
                } else if (timeComponents.length == 3) { // 有小时、分钟和秒
                    timePart = timeComponents[0] + ":" + timeComponents[1] + ":" + timeComponents[2];
                }

                return datePart + " " + timePart;
            }
        }

        // 如果是只有日期的格式 (yyyy-MM-dd)
        if (dateStr.matches("\\d{4}-\\d{2}-\\d{2}")) {
            return dateStr + " 00:00:00";
        }

        throw new IllegalArgumentException("无法识别的日期格式: " + dateStr);
    }
    private LocalDateTime parseToLocalDateTime(String dateStr) {
        try {
            // 尝试标准格式
            return LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        } catch (DateTimeParseException e1) {
            try {
                // 尝试没有秒的格式
                return LocalDateTime.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"))
                        .withSecond(0);
            } catch (DateTimeParseException e2) {
                try {
                    // 尝试只有日期的格式
                    return LocalDate.parse(dateStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"))
                            .atStartOfDay();
                } catch (DateTimeParseException e3) {
                    throw new IllegalArgumentException("无法解析日期: " + dateStr);
                }
            }
        }
    }
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        PurchaseDemand demand = purchaseDemandService.getDemandById(id);
        model.addAttribute("demand", demand);
        return "demand/edit";
    }

    @PostMapping("/edit")
    public String processEditForm(
            @Valid PurchaseDemand demand,
            BindingResult bindingResult,
            @RequestParam("productId") String productId,
            RedirectAttributes redirectAttributes,
            @RequestParam("demandDate")String demandDateStr) {

            Product product = productService.getProductById(productId);
            demand.setProduct(product);
            String formattedDateStr = cleanAndFormatDate(demandDateStr);
            System.out.println(formattedDateStr);
            LocalDateTime localDateTime = parseToLocalDateTime(formattedDateStr);
            Timestamp timestamp = Timestamp.valueOf(localDateTime);
            demand.setDemandDate(timestamp);
            purchaseDemandService.updateDemand(demand);
            return "redirect:/demand/list";
        }


    @GetMapping("/delete/{id}")
    public String deleteDemand(@PathVariable("id") String id) {
        purchaseDemandService.deleteDemand(id);
        return "redirect:/demand/list";
    }


}