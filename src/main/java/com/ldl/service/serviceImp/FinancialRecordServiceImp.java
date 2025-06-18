package com.ldl.service.serviceImp;

import com.ldl.dao.FinancialRecordMapper;
import com.ldl.entity.FinancialRecord;
import com.ldl.service.FinancialRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class FinancialRecordServiceImp implements FinancialRecordService {

    @Autowired
    FinancialRecordMapper financialRecordMapper;

    @Override
    public FinancialRecord selectById(String recordId) {
        return financialRecordMapper.selectById(recordId);
    }

    @Override
    public List<FinancialRecord> selectAll() {
        return financialRecordMapper.selectAll();
    }

    @Override
    public FinancialRecord selectBySid(String sid) {
        return financialRecordMapper.selectBySid(sid);
    }

    @Override
    public int insert(FinancialRecord record) {
        return financialRecordMapper.insert(record);
    }

    @Override
    public int update(FinancialRecord record) {
        return financialRecordMapper.update(record);
    }

    @Override
    public int delete(String recordId) {
        return financialRecordMapper.delete(recordId);
    }
}
