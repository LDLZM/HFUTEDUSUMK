package com.ldl.service;

import com.ldl.dao.RolesMapper;
import com.ldl.entity.EduSupermarketRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RolesService {
    List<EduSupermarketRoles> getAllRoles();
    EduSupermarketRoles getRoleById(Integer roleId);
    EduSupermarketRoles getRoleByName(String roleName);
    void insertRole(EduSupermarketRoles role);
    void updateRole(EduSupermarketRoles role);
    void deleteRole(Integer roleId);
}