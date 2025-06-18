package com.ldl.entity;




public class EduSupermarketUsers{
    private String id;
    private String username;
    private String password;
    private EduSupermarketRoles role;
    private Integer status;

    @Override
    public String toString() {
        return "EduSupermarketUsers{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", role=" + role +
                ", status=" + status +
                '}';
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public EduSupermarketRoles getRole() {
        return role;
    }

    public void setRole(EduSupermarketRoles role) {
        this.role = role;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}