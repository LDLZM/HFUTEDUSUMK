package com.ldl.service;

import com.ldl.entity.Supplier;

import java.util.List;

public interface SupplierService {
    List<Supplier> getAllSuppliers();
    Supplier getSupplierById(String id);
    void insertSupplier(Supplier supplier);
    void updateSupplier(Supplier supplier);
    void deleteSupplier(String id);
    List<Supplier> searchSuppliersByName(String keyword);
}