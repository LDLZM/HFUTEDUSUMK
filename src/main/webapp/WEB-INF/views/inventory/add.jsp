<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/5
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加库存记录</title>
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

        .form-container {
            max-width: 400px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-actions {
            text-align: center;
            margin-top: 20px;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #ac1618;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>添加库存记录</h1>
    </div>

        <!-- 隐藏域传递用户ID -->


    </form>


    <div class="form-container">
        <form action="${pageContext.request.contextPath}/inventory/add" method="post">
            <div class="form-group">
                <label>商品选择:</label>
                <select name="productId" id="productSelect" required>
                    <option value="">请选择商品</option>
                    <c:forEach items="${products}" var="product">
                        <option value="${product.id}" data-code="${product.id}" data-name="${product.name}">${product.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>商品编号:</label>
                <input type="text" id="productCode" readonly>
            </div>
            <div class="form-group">
                <label>商品名称:</label>
                <input type="text" id="productName" readonly>
            </div>

            <script>
                // 监听商品选择变化
                document.getElementById('productSelect').addEventListener('change', function() {
                    var selectedOption = this.options[this.selectedIndex];
                    document.getElementById('productCode').value = selectedOption.getAttribute('data-code');
                    document.getElementById('productName').value = selectedOption.getAttribute('data-name');
                });
            </script>
            <div class="form-group">
                <label>库存数量:</label>
                <input type="text" name="quantity" required>
            </div>
            <div class="form-group">
                <label>更新时间:</label>
                <input type="text" name="lastUpdated" required>
            </div>
            <div class="form-actions">
                <input type="submit" value="提交" class="action-btn">
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/inventory/list" class="back-link">返回列表</a>
    </div>
</div>
</body>
</html>
