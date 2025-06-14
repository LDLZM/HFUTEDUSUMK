package com.ldl.entity;

public class User {
    private Integer id;
    private String username;
    private String password;
    private String role;  // 对应数据库中的 ENUM 类型
    private Integer status;  // 1-正常，0-禁用
}
