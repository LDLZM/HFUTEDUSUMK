<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品</title>
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

        /* 添加提示框样式 */
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            display: none;
        }

        .alert-success {
            color: #3c763d;
            background-color: #dff0d8;
            border-color: #d6e9c6;
        }

        .alert-danger {
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>商品管理</h1>
        <div class="action-btn-group">
            <a href="${pageContext.request.contextPath}/products/add" class="action-btn">添加商品</a>
        </div>

        <!-- 搜索表单 -->
        <form action="${pageContext.request.contextPath}/products/list" method="get">
            <div style="display: flex; gap: 10px; justify-content: center; margin-top: 20px;">
                <input type="text" name="keyword" placeholder="搜索商品"
                       value="${param.keyword}" style="padding: 8px 15px; border: 1px solid #ddd; border-radius: 4px;">
                <button type="submit" class="action-btn" style="background-color: #ac1618; padding: 8px 20px;">搜索</button>
            </div>
        </form>
    </div>

    <!-- 添加提示框 -->
    <div id="alertBox" class="alert">
        <span id="alertMessage"></span>
    </div>

    <table>
        <tr>
            <th>商品ID</th>
            <th>商品名</th>
            <th>商品类别</th>
            <th>单价</th>
            <th class="action">操作</th>
        </tr>
        <c:forEach items="${products}" var="product">
            <tr id="productRow_${product.id}">
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.category}</td>
                <td>${product.unitPrice}</td>
                <td class="action">
                    <a href="${pageContext.request.contextPath}/products/edit/${product.id}" class="action-link">编辑</a>
                    <a href="javascript:void(0);" onclick="deleteProduct('${product.id}', '${product.name}')" class="action-link">下架</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    // 显示提示框
    function showAlert(message, isSuccess) {
        const alertBox = document.getElementById('alertBox');
        const alertMessage = document.getElementById('alertMessage');

        // 设置提示内容和样式
        alertMessage.textContent = message;
        if (isSuccess) {
            alertBox.className = 'alert alert-success';
        } else {
            alertBox.className = 'alert alert-danger';
        }

        // 显示提示框
        alertBox.style.display = 'block';

        // 3秒后隐藏提示框
        setTimeout(() => {
            alertBox.style.display = 'none';
        }, 3000);
    }

    // 删除商品
    function deleteProduct(productId, productName) {
        // 确认是否要删除
        if (!confirm(`确定要下架商品吗？`)) {
            return;
        }

        // 发送AJAX请求
        fetch('${pageContext.request.contextPath}/products/delete/' + productId, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-Requested-With': 'XMLHttpRequest'
            }
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('请检查是否有依赖此商品的其他信息');
                }
            })
            .then(data => {
                if (data.success) {
                    // 删除成功，显示成功消息并从表格中移除该行
                    showAlert(data.message, true);
                    document.getElementById('productRow_' + productId).remove();
                } else {
                    // 删除失败，显示错误消息
                    showAlert(data.message, false);
                }
            })
            .catch(error => {
                // 请求异常，显示错误消息
                showAlert('下架商品失败: ' + error.message, false);
            });
    }
</script>
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
