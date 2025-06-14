<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>需求详情</title>
    <style>
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .nav { margin-bottom: 20px; }
        .nav a { margin-right: 15px; }
        .demand-info { margin-bottom: 30px; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
        .demand-info h3 { margin-top: 0; }
        .bid-form { margin-bottom: 30px; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; }
        .form-group input, .form-group textarea { width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 3px; }
        button { padding: 10px 15px; background-color: #4CAF50; color: white; border: none; border-radius: 3px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        .bid-list { margin-bottom: 30px; }
        .bid-list h3 { margin-top: 0; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #f2f2f2; }
        .winning-bid { background-color: #d4edda; }
        .alert { padding: 10px; margin-bottom: 15px; border-radius: 3px; }
        .alert-success { background-color: #d4edda; color: #155724; }
        .alert-error { background-color: #f8d7da; color: #721c24; }
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

    <h2>需求详情: ${demand.approvedId}</h2>

    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-error">${error}</div>
    </c:if>

    <div class="demand-info">
        <h3>需求基本信息</h3>
        <div class="form-group">
            <label>产品名称:</label>
            <p>${demand.productName}</p>
        </div>
        <div class="form-group">
            <label>需求数量:</label>
            <p>${demand.demandQuantity}</p>
        </div>
        <div class="form-group">
            <label>需求日期:</label>
            <p>${demand.demandDate}</p>
        </div>
        <div class="form-group">
            <label>审核日期:</label>
            <p>${demand.approvedAt}</p>
        </div>
        <div class="form-group">
            <label>截止日期:</label>
            <p>
                <c:choose>
                    <c:when test="${demand.isExpired()}">
                        <span class="expired">${demand.deadlineDate} (已截止)</span>
                    </c:when>
                    <c:otherwise>${demand.deadlineDate}</c:otherwise>
                </c:choose>
            </p>
        </div>
        <div class="form-group">
            <label>状态:</label>
            <p>
                <c:choose>
                    <c:when test="${demand.status == 0 && !demand.isExpired()}">
                        <span class="status-open">开放报价</span>
                    </c:when>
                    <c:otherwise>
                        <span class="status-closed">${demand.statusText}</span>
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        <c:if test="${demand.hasWinner()}">
            <div class="form-group">
                <label>中标供应商:</label>
                <p>${demand.winningSupplierName} (${demand.winningPrice}元)</p>
            </div>
        </c:if>
    </div>

    <c:if test="${demand.status == 0 && !demand.isExpired() && !hasBid}">
        <div class="bid-form">
            <h3>提交报价</h3>
            <form action="/demand/bid/submit" method="post">
                <input type="hidden" name="approvedId" value="${demand.approvedId}">
                <div class="form-group">
                    <label>报价金额 (元):</label>
                    <input type="number" name="bidPrice" step="0.01" required>
                </div>
                <div class="form-group">
                    <label>可供应数量:</label>
                    <input type="number" name="bidQuantity" required>
                </div>
                <div class="form-group">
                    <label>交货天数:</label>
                    <input type="number" name="deliveryDays" required>
                </div>
                <div class="form-group">
                    <label>备注:</label>
                    <textarea name="bidRemarks"></textarea>
                </div>
                <button type="submit">提交报价</button>
            </form>
        </div>
    </c:if>

    <c:if test="${hasBid}">
        <div class="bid-form">
            <h3>已提交报价</h3>
            <p>您已对该需求提交了报价，等待审核中。</p>
        </div>
    </c:if>

    <div class="bid-list">
        <h3>所有报价</h3>
        <table>
            <tr>
                <th>供应商</th>
                <th>报价金额 (元)</th>
                <th>可供应数量</th>
                <th>交货天数</th>
                <th>报价时间</th>
                <th>状态</th>
            </tr>
            <c:forEach items="${bids}" var="bid">
                <tr class="${bid.getWinningClass()}">
                    <td>${bid.supplierName}</td>
                    <td>${bid.bidPrice}</td>
                    <td>${bid.bidQuantity}</td>
                    <td>${bid.deliveryDays}</td>
                    <td>${bid.bidTime}</td>
                    <td>${bid.getWinningText()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>