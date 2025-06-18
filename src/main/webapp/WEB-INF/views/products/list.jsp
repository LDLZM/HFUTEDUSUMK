<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/5
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 20px;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        .page-header {
            text-align: center;
            margin-bottom: 30px;
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

        .page-header h1 {
            color: #333;
            margin-bottom: 8px;
            font-size: 24px;
        }

        .action-btn-group {
            margin-bottom: 25px;
            text-align: center;
        }

        .action-btn {
            display: inline-block;
            padding: 12px 20px;
            background-color: #ac1618;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .action-btn:hover {
            background-color: #ac1618;
            transform: translateY(-2px);
        }

        .action-btn:active {
            transform: translateY(0);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f8f9fa;
            color: #555;
            font-weight: 600;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .action {
            width: 150px;
        }

        .action-link {
            color: #ac1618;
            text-decoration: none;
            margin-right: 10px;
            font-size: 14px;
        }

        .action-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>商品管理</h1>
        <div class="action-btn-group">
            <a href="${pageContext.request.contextPath}/products/add" class="action-btn">添加商品</a>
        </div>

        <!-- 搜索表单 -->
        <form action="${pageContext.request.contextPath}/products/list" method="get">
            <div style="display: flex; gap: 10px; justify-content: center; margin-top: 20px;">
                <input type="text" name="keyword" placeholder="搜索商品"
                       value="${param.keyword}" style="padding: 8px 15px; border: 1px solid #ddd; border-radius: 4px;">
                <button type="submit" class="action-btn" style="background-color: #ac1618; padding: 8px 20px;">搜索</button>
            </div>
        </form>
    </div>

    <table>
        <tr>
            <th>商品ID</th>
            <th>商品名</th>
            <th>商品类别</th>
            <th>单价</th>
            <th class="action">操作</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category}</td>
                <td>${product.unitPrice}</td>
                <td class="action">
                    <a href="${pageContext.request.contextPath}/products/edit/${product.id}" class="action-link">编辑</a>
                    <a href="${pageContext.request.contextPath}/products/delete/${product.id}" class="action-link">下架</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>

