<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.ldl.entity.EduSupermarketUsers"
         session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>提交报价</title>
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
<c:if test="${not empty sessionScope.currentUser}">
  <c:set var="currentUser" value="${sessionScope.currentUser}" />

  <p>用户ID：${currentUser.id}</p>
  <p>用户名：${currentUser.username}</p>
</c:if>

<c:if test="${empty sessionScope.currentUser}">
  <p>未登录或会话已过期</p>
  <a href="login">点击登录</a>
</c:if>
<div class="container">

  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

  <div class="page-header">
    <h1>为 [${demand.product.name}] 提交报价</h1>
    <p>需求数量: ${demand.demandQuantity}</p>
    <p>截止日期: ${demand.deadlineDate}</p>
  </div>

  <div class="form-container">
    <form action="${pageContext.request.contextPath}/supplierBid/add" method="post" onsubmit="return validateForm()">
      <input type="hidden" name="approvedId" value="${demand.approvedId}">

      <div class="form-group">
        <label>供应商编号</label>
        <!-- 使用EL表达式获取当前用户ID并设为只读 -->
        <input type="text" name="supplierId" value="${currentUser.id}" class="readonly-input" readonly required>
      </div>

      <div class="form-group">
        <label>报价单编号</label>
        <input type="text" name="bidId" >
      </div>
      <div class="form-group">
        <label>报价金额 (元):</label>
        <input type="number" step="0.01" name="bidPrice" required>
      </div>



      <div class="form-group">
        <label>交货天数:</label>
        <input type="number" name="deliveryDays" required>
      </div>

      <div class="form-group">
        <label>报价备注:</label>
        <textarea name="bidRemarks" rows="4" cols="50"></textarea>
      </div>

      <div class="form-actions">
        <input type="submit" value="提交报价" class="action-btn">
      </div>
    </form>

    <a href="${pageContext.request.contextPath}/supplierBid/list/${demand.approvedId}" class="back-link">返回报价列表</a>
  </div>
</div>

<script>
  function validateForm() {
    if (document.forms[0]["bidPrice"].value == "") {
      alert("请输入报价金额！");
      return false;
    }
    if (document.forms[0]["deliveryDays"].value == "" ||
            parseInt(document.forms[0]["deliveryDays"].value) <= 0) {
      alert("请输入有效的交货天数！");
      return false;
    }
    return true;
  }
</script>
</body>
</html>