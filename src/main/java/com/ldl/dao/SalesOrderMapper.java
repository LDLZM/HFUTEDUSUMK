package com.ldl.dao;

import com.ldl.entity.SalesOrder;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface SalesOrderMapper {
    // 根据ID查询订单
    SalesOrder selectById(String orderId);
    // 查询所有订单
    List<SalesOrder> selectAll();

    List<SalesOrder> selectByPid(String pid);



    List<SalesOrder> selectAllRefund();

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

    int refund(String orderId);

    int reviewrefund(String orderId,int isOK);

}
