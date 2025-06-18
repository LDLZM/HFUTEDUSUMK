package com.ldl.service;
import com.ldl.entity.SalesOrder;

import java.util.List;
import java.util.Map;

    public interface SalesOrderService {
        // 根据ID查询订单
        SalesOrder selectById(String orderId);
        // 查询所有订单
        List<SalesOrder> selectAll();

        // 根据条件查询订单
        //List<SalesOrder> getByCondition(Map<String, Object> params);
        // 创建新订单
        int insert(SalesOrder order);

        // 更新订单
        int update(SalesOrder order);

        // 删除订单
        int delete(String orderId);

        // 支付订单
        int payOrder(String orderId, String paymentMethod);
    }

