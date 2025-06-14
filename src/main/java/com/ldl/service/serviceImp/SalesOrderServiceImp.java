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
    public SalesOrder selectById(Integer orderId) {
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
    public int delete(Integer orderId) {
        return salesOrderMapper.delete(orderId);
    }

    @Override
    public int payOrder(Integer orderId, String paymentMethod) {
        return salesOrderMapper.payOrder(orderId,paymentMethod);
    }
}
