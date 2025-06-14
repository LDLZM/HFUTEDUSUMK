<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/6
  Time: 22:21
  To change this template use File | Settings | File Templates.
--%>
<!-- Demandreview.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>验收货物</title>
  <!-- 引入与列表页面相同的样式 -->
  <style>
    /* 保持与列表页面相同的样式 */
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
      max-width: 600px;
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
    .form-group select, .form-group textarea {
      width: 100%;
      padding: 8px 12px;
      border: 1px solid #ddd;
      border-radius: 4px;
      box-sizing: border-box;
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
    .back-link {
      display: block;
      text-align: center;
      margin-top: 15px;
      color: #ac1618;
      text-decoration: none;
    }
  </style>
</head>
<body>
<div class="container">
  <h2>验收货物 #${productCheck.id}</h2>

  <form action="${pageContext.request.contextPath}/check/processProductReview" method="post">

    <input type="hidden" name="id" value="${productCheck.id}">

    <div class="form-group">
      <label>商品ID:</label>
      <p>${productCheck.approvedPurchaseDemand.productId}</p>
    </div>

    <div class="form-group">
      <label>需求数量:</label>
      <p>${productCheck.approvedPurchaseDemand.demandQuantity}</p>
    </div>
    <div class="form-group">
      <label for="remarks">备注:</label>
      <input
              type="text"
              id="remarks"
              name="remarks"
              class="form-control"
              value="${productCheck.remarks}"
              placeholder="请输入备注信息"
      >
    </div>
    <div class="form-group">
      <label>审核结果:</label>
      <select name="isOK" required>
        <option value="">请选择...</option>
        <option value="1">审核通过</option>
        <option value="2">审核不通过</option>
      </select>
    </div>

<%--    <div class="form-group">--%>
<%--      <label>审核备注:</label>--%>
<%--      <textarea name="reviewComments" rows="4" placeholder="请输入审核备注..."></textarea>--%>
<%--    </div>--%>

    <div class="form-group">
      <button type="submit" class="action-btn">提交审核</button>
    </div>
  </form>

  <a href="${pageContext.request.contextPath}/check/ProductviewList" class="back-link">返回列表</a>
</div>
</body>
</html>
