<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.ldl.entity.EduSupermarketUsers"
         session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>供应商报价</title>
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
<c:if test="${not empty sessionScope.currentUser}">
    <c:set var="currentUser" value="${sessionScope.currentUser}" />

    <p>用户ID：${currentUser.id}</p>
    <p>用户名：${currentUser.username}</p>
</c:if>

<c:if test="${empty sessionScope.currentUser}">
    <p>未登录或会话已过期</p>
    <a href="login.jsp">点击登录</a>
</c:if>
<div class="container">
    <div class="page-header">
        <h1>产品: ${demand.product.name} 的报价列表</h1>
        <h3>需求数量: ${demand.demandQuantity}</h3>
        <h3>截止日期: ${demand.deadlineDate}</h3>
        <h3>状态: ${demand.status == 0 ? "开放报价" : "已结束"}</h3>

        <c:if test="${demand.status == 0}">
            <a href="${pageContext.request.contextPath}/supplierBid/add/${demand.approvedId}" class="action-btn">提交报价</a>
        </c:if>
    </div>

    <table>
        <tr>
            <th>报价编号</th>
            <th>供应商</th>
            <th>报价</th>
            <th>交货天数</th>
            <th>报价时间</th>
            <th>是否中标</th>
            <th>备注</th>
        </tr>
        <c:forEach items="${bids}" var="bid">
            <tr>
                <td>${bid.bidId}</td>
                <td>${bid.supplier.supplierName}</td>
                <td>${bid.bidPrice}</td>
                <td>${bid.deliveryDays}</td>
                <td>${bid.bidTime}</td>
                <td>
                    <c:choose>
                        <c:when test="${bid.isWinning == 0}">未审核</c:when>
                        <c:when test="${bid.isWinning == 1}">中标</c:when>
                        <c:when test="${bid.isWinning == 2}">未中标</c:when>
                        <c:otherwise>未知状态</c:otherwise>
                    </c:choose>
                </td>
                <td>${bid.bidRemarks}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>