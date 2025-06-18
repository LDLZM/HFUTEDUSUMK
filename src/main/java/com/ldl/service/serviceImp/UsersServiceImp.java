package com.ldl.service.serviceImp;


import com.ldl.entity.EduSupermarketUsers;
import com.ldl.dao.UsersMapper;
import com.ldl.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImp implements UsersService {

    @Autowired
    private UsersMapper usersMapper;

    public List<EduSupermarketUsers> getAllUsers() {
        return usersMapper.getAllUsers();
    }

    public EduSupermarketUsers getUserById(String id) {
        return usersMapper.getUserById(id);
    }

    public EduSupermarketUsers getUserByUsername(String username) {
        return usersMapper.getUserByUsername(username);
    }

    public void insertUser(EduSupermarketUsers user) {
        usersMapper.insertUser(user);
    }

    public void updateUser(EduSupermarketUsers user) {
        usersMapper.updateUser(user);
    }

    public void deleteUser(String id) {
        usersMapper.deleteUser(id);
    }


    @Override
    public EduSupermarketUsers loginByIdAndRole(String id, String password, Integer roleId) {
        EduSupermarketUsers user = usersMapper.getUserById(id);
        if (user != null &&
                user.getPassword().equals(password) &&
                user.getStatus() == 1 &&
                user.getRole().getRoleId().equals(roleId)) {
            return user;
        }
        return null;
    }

    @Override
    public List<EduSupermarketUsers> searchUsers(String keyword) {
        return usersMapper.selectByKeyword("%" + keyword + "%");
    }
}