package com.ldl.dao;

import com.ldl.entity.EduSupermarketUsers;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface UsersMapper {
    List<EduSupermarketUsers> getAllUsers();
    EduSupermarketUsers getUserById(Integer id);
    EduSupermarketUsers getUserByUsername(String username);
    void insertUser(EduSupermarketUsers user);
    void updateUser(EduSupermarketUsers user);
    void deleteUser(Integer id);
    List<EduSupermarketUsers> selectByKeyword(@Param("keyword") String keyword);

}