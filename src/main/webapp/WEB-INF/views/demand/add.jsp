<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/6
  Time: 17:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加采购需求</title>
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
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>添加采购需求</h1>
    </div>

    <div class="form-container">
        <form action="${pageContext.request.contextPath}/demand/add" method="post">

            <div class="form-group">
                <label>需求编号:</label>
                <input type="text" name="demandId" required>
            </div>


            <div class="form-group">
                <label>商品编号:</label>
                <select name="productId" required>
                    <option value="">请选择商品</option>
                    <c:forEach items="${products}" var="product">
                        <option value="${product.id}">${product.id} - ${product.name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>需求数量:</label>
                <input type="text" name="demandQuantity" required>
            </div>
            <div class="form-group">
                <label>需求日期:</label>
                <input type="text" name="demandDate" placeholder="YYYY-MM-DD HH:MM:SS" required>
            </div>
            <div class="form-group">
                <label>状态:</label>
                <select name="is_closed" disabled> <!-- 添加 disabled 属性 -->
                    <option value="0" selected>未审核</option>
                </select>
            </div>
            <div class="form-actions">
                <input type="submit" value="提交" class="action-btn">
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/demand/list" class="back-link">返回列表</a>
    </div>
</div>

</body>
</html>