package com.ldl.dao;

import com.ldl.entity.EduSupermarketRoles;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface RolesMapper {
    List<EduSupermarketRoles> getAllRoles();
    EduSupermarketRoles getRoleById(Integer roleId);
    EduSupermarketRoles getRoleByName(String roleName);
    void insertRole(EduSupermarketRoles role);
    void updateRole(EduSupermarketRoles role);
    void deleteRole(Integer roleId);
}
