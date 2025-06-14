package com.ldl.dao;


import com.ldl.entity.FinancialRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface FinancialRecordMapper {
    // 根据ID查询财务记录
    FinancialRecord selectById(Integer recordId);

    // 查询所有财务记录
    List<FinancialRecord> selectAll();

     // 插入新财务记录
    int insert(FinancialRecord record);

    // 更新财务记录
    int update(FinancialRecord record);

    // 删除财务记录
    int delete(Integer recordId);

    FinancialRecord selectBySid(Integer sid);

}
