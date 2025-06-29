<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/29
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/12
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
=
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>退货审核</title>
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
        .action-link.disabled-link {
            color: gray;
            cursor: not-allowed;
            pointer-events: none;
            text-decoration: none;
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
    <!-- 显示错误消息 -->
    <c:if test="${not empty error}">
        <div class="alert alert-danger error-message" role="alert">
            <strong>错误:</strong> ${error}
        </div>
    </c:if>
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>退货审核</h1>
        <div class="action-btn-group">
            <a href="${pageContext.request.contextPath}/sales/add" class="action-btn">添加销售记录</a>
        </div>
    </div>

    <table>
        <tr>
            <th>销售号</th>
            <th>销售日期</th>
            <th>商品编号</th>
            <th>销售数量</th>
            <th>总金额</th>
            <th>支付方式</th>
            <th>支付状态</th>
            <th>备注</th>
            <th>退货状态</th>
            <th class="action">操作</th>
        </tr>
        <c:forEach items="${salesList}" var="sale">
            <tr>
                <td>${sale.orderId}</td>
                <td>${sale.orderDate}</td>
                <td>${sale.productId}</td>
                <td>${sale.quantity}</td>
                <td>${sale.totalAmount}</td>
                <td>${sale.paymentMethod}</td>
                <td>
                    <c:choose>
                        <c:when test="${sale.paymentStatus == 0}">未支付</c:when>
                        <c:when test="${sale.paymentStatus == 1}">已支付</c:when>
                    </c:choose>
                </td>
                <td>${sale.remarks}</td>
                <td>
                    <c:choose>
                        <c:when test="${sale.refundState == 0}">无退货申请</c:when>
                        <c:when test="${sale.refundState == 1}">申请退货中</c:when>
                        <c:when test="${sale.refundState == 2}">拒绝退货</c:when>
                        <c:when test="${sale.refundState == 3}">同意退货</c:when>
                    </c:choose>
                </td>
                <td class="action">
                    <c:if test="${sale.refundState == 1}">
                        <a href="${pageContext.request.contextPath}/check/RefundReview/${sale.orderId}" class="action-link">审核</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


</body>
</html>

