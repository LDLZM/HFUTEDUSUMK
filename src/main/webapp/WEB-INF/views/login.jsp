<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教育超市信息系统—登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            width: 380px;
            max-width: 90%;
        }
        .login-header {
            text-align: center;
            margin-bottom: 25px;
        }
        .school-logo {
            width: 120px;
            height: 100px;
            margin: 0 auto 15px;
            display: block;
            border-radius: 50%;
            background-color: #f8f9fa;
            padding: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .login-header h2 {
            color: #333;
            margin-bottom: 8px;
            font-size: 24px;
        }
        .login-header p {
            color: #666;
            margin: 0;
            font-size: 14px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
            font-weight: 500;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }
        .form-group input:focus {
            outline: none;
            border-color: #ac1618;
            box-shadow: 0 0 0 2px rgb(232, 191, 192);
        }
        .role-selection {
            margin-bottom: 25px;
        }
        .role-selection label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 14px;
            font-weight: 500;
        }
        .role-selection select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }
        .role-selection select:focus {
            outline: none;
            border-color: #ac1618;
            box-shadow: 0 0 0 2px rgb(232, 191, 192);
        }
        .login-button {
            width: 100%;
            padding: 14px;
            background-color: #ac1618;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .login-button:hover {
            background-color: #ac1618;
            transform: translateY(-2px);
        }
        .login-button:active {
            transform: translateY(0);
        }
        .error {
            color: red;
            margin-bottom: 15px;
            text-align: center;
            padding: 8px;
            background-color: #ffebee;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h2>教育超市信息系统</h2>
        <p>请登录</p>
    </div>

    <c:if test="${not empty errorMsg}">
        <div class="error">${errorMsg}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">
        <div class="form-group">
            <label for="id">账号：</label>
            <input type="text" id="id" name="id" required>
        </div>
        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="role-selection">
            <label for="roleId">选择角色：</label>
            <select id="roleId" name="roleId" required>
                <option value="">请选择角色</option>
                <option value="1">总经理</option>
                <option value="2">商品信息中心</option>
                <option value="3">采购部门</option>
                <option value="4">审核部门</option>
                <option value="5">仓库部门</option>
                <option value="6">销售部门</option>
                <option value="7">财务部门</option>
                <option value="8">供应商</option>
                <option value="9">人力资源</option>
            </select>
        </div>
        <button type="submit" class="login-button">登录</button>
    </form>
</div>
</body>
</html>