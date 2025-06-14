package com.ldl.service;

import com.ldl.entity.EduSupermarketUsers;

import java.util.List;

public interface UsersService {

    List<EduSupermarketUsers> getAllUsers();
    EduSupermarketUsers getUserById(Integer id);
    EduSupermarketUsers getUserByUsername(String username);
    void insertUser(EduSupermarketUsers user);
    void updateUser(EduSupermarketUsers user);
    void deleteUser(Integer id);
    EduSupermarketUsers loginByUsernameAndRole(String username, String password, Integer roleId);
    List<EduSupermarketUsers> searchUsers(String keyword);



}
