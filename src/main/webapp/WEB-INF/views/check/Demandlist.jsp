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
  <title>采购需求管理</title>
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

    .filter-group {
      display: flex;
      gap: 10px;
      justify-content: center;
      margin: 20px 0;
    }

    .filter-group input, .filter-group button, .filter-group select {
      padding: 8px 15px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .filter-group button {
      background-color: #ac1618;
      color: white;
      cursor: pointer;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="page-header">
    <img src="../images/xh.png" alt="学校校徽" class="school-logo">
    <h1>采购需求审核</h1>
    <div class="action-btn-group">
      <a href="${pageContext.request.contextPath}/inventory/check_list" class="action-btn">查看库存情况</a>
    </div>

    <!-- 搜索和过滤表单 -->
    <form action="${pageContext.request.contextPath}/check/Demandlist" method="get">
      <div class="filter-group">
        <input type="text" name="keyword" placeholder="搜索商品"
               value="${param.keyword}" style="flex: 1;">
        <button type="submit" class="action-btn">查找</button>
      </div>
    </form>
  </div>

  <table>
    <tr>
      <th>需求ID</th>
      <th>商品名</th>
      <th>需求数量</th>
      <th>需求日期</th>
      <th>状态</th>
      <th class="action">操作</th>
    </tr>
    <c:forEach items="${demands}" var="demand">
      <tr>
        <td>${demand.demandId}</td>
        <td>${demand.product.name}</td>
        <td>${demand.demandQuantity}</td>
        <td>${demand.demandDate}</td>

        <td>
            ${
                    demand.is_closed == 1 ? '审核通过' :
                            demand.is_closed == 0 ? '未审核' : '审核不通过'
                    }
        </td>
        <td class="action">
          <c:if test="${demand.is_closed == 0}"> <!-- 只对未审核的需求显示审核链接 -->
            <a href="${pageContext.request.contextPath}/check/Demandreview/${demand.demandId}" class="action-link">审核</a>
          </c:if>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>