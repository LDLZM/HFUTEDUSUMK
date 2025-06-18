package com.ldl.dao;

import com.ldl.entity.Supplier;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SupplierMapper {
    // 查询所有供应商
    List<Supplier> getAllSuppliers();

    // 根据ID查询供应商
    Supplier getSupplierById(@Param("supplierId") String id);

    // 新增供应商
    void insertSupplier(Supplier supplier);

    // 更新供应商
    void updateSupplier(Supplier supplier);

    // 删除供应商（逻辑删除或物理删除）
    void deleteSupplier(@Param("supplierId") String id);

    // 按名称搜索供应商
    List<Supplier> searchSuppliersByName(@Param("keyword") String keyword);
}