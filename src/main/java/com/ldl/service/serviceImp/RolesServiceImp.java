package com.ldl.service.serviceImp;

import com.ldl.entity.EduSupermarketRoles;
import com.ldl.dao.RolesMapper;
import com.ldl.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RolesServiceImp implements RolesService {

    @Autowired
    private RolesMapper rolesMapper;

    public List<EduSupermarketRoles> getAllRoles() {
        return rolesMapper.getAllRoles();
    }

    public EduSupermarketRoles getRoleById(Integer roleId) {
        return rolesMapper.getRoleById(roleId);
    }

    public EduSupermarketRoles getRoleByName(String roleName) {
        return rolesMapper.getRoleByName(roleName);
    }

    public void insertRole(EduSupermarketRoles role) {
        rolesMapper.insertRole(role);
    }

    public void updateRole(EduSupermarketRoles role) {
        rolesMapper.updateRole(role);
    }

    public void deleteRole(Integer roleId) {
        rolesMapper.deleteRole(roleId);
    }
}