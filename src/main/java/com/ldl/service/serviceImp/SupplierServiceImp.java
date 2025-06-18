package com.ldl.service.serviceImp;

import com.ldl.dao.SupplierMapper;
import com.ldl.entity.Supplier;
import com.ldl.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupplierServiceImp implements SupplierService {
    @Autowired
    private SupplierMapper supplierMapper;

    @Override
    public List<Supplier> getAllSuppliers() {
        return supplierMapper.getAllSuppliers();
    }

    @Override
    public Supplier getSupplierById(String id) {
        return supplierMapper.getSupplierById(id);
    }

    @Override
    public void insertSupplier(Supplier supplier) {
        supplierMapper.insertSupplier(supplier);
    }

    @Override
    public void updateSupplier(Supplier supplier) {
        supplierMapper.updateSupplier(supplier);
    }

    @Override
    public void deleteSupplier(String id) {
        supplierMapper.deleteSupplier(id);
    }

    @Override
    public List<Supplier> searchSuppliersByName(String keyword) {
        return supplierMapper.searchSuppliersByName("%" + keyword + "%");
    }
}