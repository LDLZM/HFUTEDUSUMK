package com.ldl.service.serviceImp;

import com.ldl.controller.SalesOrderController;
import com.ldl.dao.FinancialRecordMapper;
import com.ldl.dao.SalesOrderMapper;
import com.ldl.entity.SalesOrder;
import com.ldl.service.SalesOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class SalesOrderServiceImp implements SalesOrderService {
    @Autowired
    SalesOrderMapper salesOrderMapper;
    @Override
    public SalesOrder selectById(String orderId) {
        return salesOrderMapper.selectById(orderId);
    }

    @Override
    public List<SalesOrder> selectAll() {
        return salesOrderMapper.selectAll();
    }
    @Override
    public int insert(SalesOrder order) {
        return salesOrderMapper.insert(order);
    }

    @Override
    public int update(SalesOrder order) {
        return salesOrderMapper.update(order);
    }

    @Override
    public int delete(String orderId) {
        return salesOrderMapper.delete(orderId);
    }

    @Override
    public int payOrder(String orderId, String paymentMethod) {
        return salesOrderMapper.payOrder(orderId,paymentMethod);
    }

    @Override
    public List<SalesOrder> selectAllRefund() {
        return salesOrderMapper.selectAllRefund();
    }

    @Override
    public int refund(String orderId) {
        return salesOrderMapper.refund(orderId);
    }

    @Override
    public int reviewrefund(String orderId, int isOK) {
        System.out.println("reviewrefund");
        System.out.println(orderId);
        System.out.println(isOK);
        return salesOrderMapper.reviewrefund(orderId,isOK);
    }
}
