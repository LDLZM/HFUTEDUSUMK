<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="com.ldl.entity.EduSupermarketUsers"
         session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>已审核采购需求</title>
    <!-- 复用库存管理页面的CSS -->
    <style>
        /* 原有CSS样式保持不变 */
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 0; padding: 20px; }
        .container { background-color: #ffffff; padding: 30px; border-radius: 12px; box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1); width: 90%; max-width: 1200px; margin: 0 auto; }
        .page-header { text-align: center; margin-bottom: 30px; }
        .school-logo { width: 120px; height: 100px; margin: 0 auto 15px; display: block; border-radius: 50%; background-color: #f8f9fa; padding: 10px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05); }
        .page-header h1 { color: #333; margin-bottom: 8px; font-size: 24px; }
        .action-btn-group { margin-bottom: 25px; text-align: center; }
        .action-btn { display: inline-block; padding: 12px 20px; background-color: #ac1618; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 14px; font-weight: 500; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease; }
        .action-btn:hover { background-color: #ac1618; transform: translateY(-2px); }
        .action-btn:active { transform: translateY(0); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; color: #555; font-weight: 600; }
        tr:hover { background-color: #f5f5f5; }
        .action { width: 150px; }
        .action-link { color: #ac1618; text-decoration: none; margin-right: 10px; font-size: 14px; }
        .action-link:hover { text-decoration: underline; }
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
        <h1>已审核采购需求</h1>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>产品</th>
            <th>需求数量</th>
            <th>需求日期</th>
            <th>审核时间</th>
            <th>截止日期</th>
            <th>中标供应商id</th>
            <th>中标价格</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${demands}" var="demand">
            <tr>
                <td>${demand.approvedId}</td>
                <td>${demand.product.name}</td>
                <td>${demand.demandQuantity}</td>
                <td>${demand.demandDate}</td>
                <td>${demand.approvedAt}</td>
                <td>${demand.deadlineDate}</td>
                <td>${demand.winningSupplierId}</td>
                <td>${demand.winningPrice}</td>
                <td>${demand.status == 0 ? "开放报价" : "已结束"}</td>
                <td>
                    <!-- 新增条件判断：仅当状态为开放报价（status=0）时显示按钮 -->
                    <c:if test="${demand.status == 0}">
                        <a href="${pageContext.request.contextPath}/supplierBid/list/${demand.approvedId}" class="action-link">发起报价</a>
                    </c:if>
                </td>
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








