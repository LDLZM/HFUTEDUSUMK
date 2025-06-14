package com.ldl.service;


import com.ldl.dao.FinancialRecordMapper;
import com.ldl.entity.FinancialRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface FinancialRecordService {
    // 根据ID查询财务记录
    FinancialRecord selectById(Integer recordId);

    // 查询所有财务记录
    List<FinancialRecord> selectAll();

    // 按销售订单号查询
    FinancialRecord selectBySid(Integer sid);
    // 插入新财务记录
    int insert(FinancialRecord record);

    // 更新财务记录
    int update(FinancialRecord record);

    // 删除财务记录
    int delete(Integer recordId);


}
