<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的报价</title>
    <style>
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .nav { margin-bottom: 20px; }
        .nav a { margin-right: 15px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        .winning-bid { background-color: #d4edda; }
        .losing-bid { background-color: #f8d7da; }
    </style>
</head>
<body>
<div class="container">
    <div class="nav">
        <a href="/supplier/dashboard">供应商中心</a>
        <a href="/demand/list">可报价需求</a>
        <a href="/supplier/bids">我的报价</a>
        <a href="/supplier/logout">退出登录</a>
    </div>

    <h2>我的报价</h2>

    <table>
        <tr>
            <th>需求ID</th>
            <th>产品名称</th>
            <th>报价金额 (元)</th>
            <th>可供应数量</th>
            <th>交货天数</th>
            <th>报价时间</th>
            <th>状态</th>
        </tr>
        <c:forEach items="${bids}" var="bid">
            <tr class="${bid.getWinningClass()}">
                <td>${bid.approvedId}</td>
                <td>${bid.productName}</td>
                <td>${bid.bidPrice}</td>
                <td>${bid.bidQuantity}</td>
                <td>${bid.deliveryDays}</td>
                <td>${bid.bidTime}</td>
                <td>${bid.getWinningText()}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<script src="https://lf-cdn.coze.cn/obj/unpkg/flow-platform/chat-app-sdk/1.2.0-beta.10/libs/cn/index.js"></script>
<script>
    new CozeWebSDK.WebChatClient({
        config: {
            bot_id: '7521240449312063515',
        },
        componentProps: {
            title: 'Coze',
        },
        auth: {
            type: 'token',
            token: 'pat_0UJzLODfShms56AIrLWpwCrXUx19qjMgFYgEPBmjAwR4pom9jML68Mjc9BGwbPrw',
            onRefreshToken: function () {
                return 'pat_0UJzLODfShms56AIrLWpwCrXUx19qjMgFYgEPBmjAwR4pom9jML68Mjc9BGwbPrw'
            }
        }
    });
</script>
</body>
</html>