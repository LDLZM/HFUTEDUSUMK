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

        .form-group input.error,
        .form-group select.error {
            border-color: #dc3545;
            box-shadow: 0 0 0 0.25rem rgba(220, 53, 69, 0.25);
        }

        .error-message {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
            display: none;
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

        .time-warning {
            color: #ff9800;
            font-size: 12px;
            margin-top: 5px;
            display: none;
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
        <form action="${pageContext.request.contextPath}/demand/add" method="post" id="demandForm">

            <div class="form-group">
                <label>需求编号:</label>
                <input type="text" name="demandId" required minlength="8" maxlength="8"
                       title="需求编号必须为8位" id="demandIdInput" placeholder="示例：D2506002">
                <div class="error-message" id="demandIdError">需求编号必须为8位</div>
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
                <input type="number" name="demandQuantity" required min="1" id="demandQuantityInput">
                <div class="error-message" id="quantityError">需求数量必须为正整数</div>
            </div>
            <div class="form-group">
                <label>需求日期:</label>
                <input type="datetime-local" name="demandDate" id="demandDateInput" required>
                <p class="hint-text" style="color: #666; font-size: 12px; margin-top: 5px;">
                    选择日期和时间
                </p>
            </div>

            <div class="form-group">
                <label>状态:</label>
                <select name="is_closed" disabled>
                    <option value="0" selected>未审核</option>
                </select>
            </div>
            <div class="form-actions">
                <input type="submit" value="提交" class="action-btn" id="submitBtn">
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/demand/list" class="back-link">返回列表</a>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const demandForm = document.getElementById('demandForm');
        const demandIdInput = document.getElementById('demandIdInput');
        const demandDateInput = document.getElementById('demandDateInput');
        const submitBtn = document.getElementById('submitBtn');
        const dateError = document.getElementById('dateError');
        const timeWarning = document.getElementById('timeWarning');

        // 设置当前时间为最大值和默认值
        function setCurrentTime() {
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const day = String(now.getDate()).padStart(2, '0');
            const hours = String(now.getHours()).padStart(2, '0');
            const minutes = String(now.getMinutes()).padStart(2, '0');
            const seconds = String(now.getSeconds()).padStart(2, '0');

            // 格式：YYYY-MM-DDTHH:MM:SS
            const currentTime = `${year}-${month}-${day}T${hours}:${minutes}:${seconds}`;
            demandDateInput.max = currentTime;
            demandDateInput.value = currentTime;
            return currentTime;
        }

        const currentTime = setCurrentTime();

        // 实时验证时间选择
        demandDateInput.addEventListener('change', function() {
            const selectedTime = this.value;
            if (!selectedTime) return;

            const selectedDate = new Date(selectedTime.replace('T', ' '));
            const now = new Date(currentTime.replace('T', ' '));

            if (selectedDate > now) {
                // 选择未来时间时显示警告并自动调整为当前时间
                this.value = currentTime;
                timeWarning.style.display = 'block';
                this.classList.add('error');
                dateError.style.display = 'block';

                // 3秒后隐藏警告
                setTimeout(() => {
                    timeWarning.style.display = 'none';
                }, 3000);
            } else {
                timeWarning.style.display = 'none';
                this.classList.remove('error');
                dateError.style.display = 'none';
            }
        });

        // 需求编号输入验证
        demandIdInput.addEventListener('input', validateDemandId);

        // 需求数量输入验证
        document.getElementById('demandQuantityInput').addEventListener('input', validateQuantity);

        // 表单提交验证
        demandForm.addEventListener('submit', function(e) {
            let isValid = true;

            // 验证需求编号
            if (!validateDemandId()) {
                isValid = false;
            }

            // 验证需求日期（再次检查，防止手动输入未来时间）
            if (!validateDate()) {
                isValid = false;
            }

            // 验证需求数量
            if (!validateQuantity()) {
                isValid = false;
            }

            if (!isValid) {
                e.preventDefault();
                // 滚动到第一个错误字段
                const firstError = document.querySelector('.form-group input.error, .form-group select.error');
                if (firstError) firstError.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        });

        // 验证需求编号
        function validateDemandId() {
            const input = demandIdInput;
            const errorMsg = document.getElementById('demandIdError');
            const value = input.value.trim();

            if (value.length !== 8) {
                input.classList.add('error');
                errorMsg.style.display = 'block';
                return false;
            } else {
                input.classList.remove('error');
                errorMsg.style.display = 'none';
                return true;
            }
        }

        // 验证需求日期
        function validateDate() {
            const input = demandDateInput;
            const errorMsg = document.getElementById('dateError');
            const value = input.value;

            if (!value) {
                input.classList.add('error');
                errorMsg.style.display = 'block';
                return false;
            }

            const selectedDate = new Date(value.replace('T', ' ').replace(':', ' ', 10));
            const now = new Date(currentTime.replace('T', ' '));

            if (selectedDate > now) {
                input.classList.add('error');
                errorMsg.style.display = 'block';
                return false;
            } else {
                input.classList.remove('error');
                errorMsg.style.display = 'none';
                return true;
            }
        }

        // 验证需求数量
        function validateQuantity() {
            const input = document.getElementById('demandQuantityInput');
            const errorMsg = document.getElementById('quantityError');
            const value = input.value.trim();

            if (!value || isNaN(Number(value)) || Number(value) < 1) {
                input.classList.add('error');
                errorMsg.style.display = 'block';
                return false;
            } else {
                input.classList.remove('error');
                errorMsg.style.display = 'none';
                return true;
            }
        }
    });
</script>
</body>
</html>