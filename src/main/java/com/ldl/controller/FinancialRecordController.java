package com.ldl.controller;


import com.ldl.entity.FinancialRecord;
import com.ldl.entity.Product;
import com.ldl.service.FinancialRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/finance")
public class FinancialRecordController {

    @Autowired
    private FinancialRecordService financialRecordService;

    // 财务记录列表页面
    @GetMapping("/list")
    public String recordList(Model model) {
        List<FinancialRecord> records = financialRecordService.selectAll();
        model.addAttribute("records", records);
        return "finance/list";
    }

    // 删除财务记录
    @GetMapping("/delete/{id}")
    public String deleteRecord(@PathVariable("id") String recordId) {
        financialRecordService.delete(recordId);
        return "redirect:/finance/list";
    }





}
