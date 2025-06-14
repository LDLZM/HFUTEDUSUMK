package com.ldl.dao;

import com.ldl.entity.SalesOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface SalesOrderMapper {
    // 根据ID查询订单
    SalesOrder selectById(Integer orderId);
    // 查询所有订单
    List<SalesOrder> selectAll();

    // 根据条件查询订单
    //List<SalesOrder> getByCondition(Map<String, Object> params);
    // 创建新订单
    int insert(SalesOrder order);

    // 更新订单
    int update(SalesOrder order);

    // 删除订单
    int delete(Integer orderId);

    // 支付订单
    int payOrder(Integer orderId, String paymentMethod);
}
