<%--
  Created by IntelliJ IDEA.
  User: CITS
  Date: 2025/6/5
  Time: 22:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑用户</title>
    <style>
        /* 继承原有样式，新增表单样式 */
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

        /* 新增表单样式 */
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

        /* 错误消息样式 */
        .error-message {
            color: #ff3333;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        /* 价格比较提示样式 */
        .price-hint {
            margin-top: 8px;
            padding: 8px;
            border-radius: 4px;
            font-size: 14px;
            display: none;
        }

        .price-hint.up {
            background-color: #ffe6e6;
            color: #cc0000;
        }

        .price-hint.down {
            background-color: #e6ffe6;
            color: #008000;
        }

        .price-hint.same {
            background-color: #e6f7ff;
            color: #0066cc;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <h1>编辑商品</h1>
    </div>

    <div class="form-container">
        <form id="editProductForm" action="${pageContext.request.contextPath}/products/edit" method="post">
            <!-- 隐藏域传递用户ID -->
            <input type="hidden" name="id" value="${product.id}">

            <div class="form-group">
                <label>商品名:</label>
                <!-- 使用EL表达式获取product对象的name属性作为默认值 -->
                <input type="text" name="name" required value="${product.name}">
            </div>

            <div class="form-group">
                <label>商品类别:</label>
                <div class="flex flex-col sm:flex-row gap-4">
                    <div class="flex flex-wrap gap-2 mb-2">
                        <button type="button" class="category-btn bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded-full transition-all" data-value="食品">食品</button>
                        <button type="button" class="category-btn bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded-full transition-all" data-value="文具">文具</button>
                        <button type="button" class="category-btn bg-blue-100 hover:bg-blue-200 text-blue-800 px-4 py-2 rounded-full transition-all" data-value="日用品">日用品</button>
                    </div>
                    <div class="relative">
                        <input type="text" name="category" required placeholder="${product.category}" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all">
                    </div>
                </div>
            </div>

            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const categoryButtons = document.querySelectorAll('.category-btn');
                    const categoryInput = document.querySelector('input[name="category"]');
                    const clearButton = document.getElementById('clear-btn');

                    // 点击类别按钮
                    categoryButtons.forEach(button => {
                        button.addEventListener('click', function() {
                            categoryInput.value = this.getAttribute('data-value');
                            updateSelectedState();
                        });
                    });

                    // 输入框内容变化时
                    categoryInput.addEventListener('input', function() {
                        updateSelectedState();
                    });

                    // 清除按钮点击事件
                    clearButton.addEventListener('click', function() {
                        categoryInput.value = '';
                        clearButton.classList.add('hidden');
                    });

                    // 更新选中状态和清除按钮显示
                    function updateSelectedState() {
                        // 重置所有按钮样式
                        categoryButtons.forEach(button => {
                            button.classList.remove('bg-blue-500', 'text-white');
                            button.classList.add('bg-blue-100', 'text-blue-800');
                        });

                        // 检查是否与某个按钮值匹配
                        const inputValue = categoryInput.value.trim();
                        let matched = false;
                        categoryButtons.forEach(button => {
                            if (button.getAttribute('data-value') === inputValue) {
                                button.classList.remove('bg-blue-100', 'text-blue-800');
                                button.classList.add('bg-blue-500', 'text-white');
                                matched = true;
                            }
                        });

                        // 控制清除按钮显示
                        if (inputValue) {
                            clearButton.classList.remove('hidden');
                        } else {
                            clearButton.classList.add('hidden');
                        }
                    }
                });
            </script>

            <div class="form-group">
                <label>单价:</label>
                <input type="text" id="unitPrice" name="unitPrice" required value="${product.unitPrice}">
                <div class="error-message" id="priceError">价格必须为正数</div>
                <div class="price-hint" id="priceHint">
                    <span id="priceChangeText"></span>
                    <span id="priceChangePercent"></span>
                </div>
            </div>
            <div class="form-actions">
                <input type="submit" value="提交" class="action-btn">
            </div>
        </form>

        <a href="${pageContext.request.contextPath}/products/list" class="back-link">返回商品列表</a>
    </div>
</div>

<script>
    // 页面加载完成后执行
    document.addEventListener('DOMContentLoaded', function() {
        // 获取价格输入框和相关元素
        const priceInput = document.getElementById('unitPrice');
        const priceError = document.getElementById('priceError');
        const priceHint = document.getElementById('priceHint');
        const priceChangeText = document.getElementById('priceChangeText');
        const priceChangePercent = document.getElementById('priceChangePercent');
        const editForm = document.getElementById('editProductForm');

        // 保存原始价格
        const originalPrice = parseFloat('${product.unitPrice}');

        // 价格输入框失去焦点时验证
        priceInput.addEventListener('blur', function() {
            validatePrice();
        });

        // 价格输入框输入时实时显示价格变化提示
        priceInput.addEventListener('input', function() {
            showPriceChangeHint();
        });

        // 表单提交时验证
        editForm.addEventListener('submit', function(e) {
            if (!validatePrice()) {
                e.preventDefault(); // 阻止表单提交
            }
        });

        // 验证价格格式
        function validatePrice() {
            const price = priceInput.value.trim();
            const pricePattern = /^\d+(\.\d{1,2})?$/;

            if (price === '') {
                priceError.textContent = '价格不能为空';
                priceError.style.display = 'block';
                return false;
            }

            if (!pricePattern.test(price)) {
                priceError.style.display = 'block';
                return false;
            }

            if (parseFloat(price) <= 0) {
                priceError.textContent = '价格必须大于0';
                priceError.style.display = 'block';
                return false;
            }

            // 价格合理，隐藏错误消息
            priceError.style.display = 'none';
            return true;
        }

        // 显示价格变化提示
        function showPriceChangeHint() {
            const price = parseFloat(priceInput.value.trim());

            // 如果价格为空或不是数字，隐藏提示
            if (isNaN(price)) {
                priceHint.style.display = 'none';
                return;
            }


            // 设置提示内容和样式
            if (price > originalPrice) {
                priceChangeText.textContent = '价格上涨';
                priceHint.className = 'price-hint up';
                priceHint.style.display = 'block';
            } else if (price < originalPrice && price>0) {
                priceChangeText.textContent = '价格下降';
                priceHint.className = 'price-hint down';
                priceHint.style.display = 'block';
            } else if( price == originalPrice){
                priceChangeText.textContent = '价格保持不变';
                priceChangePercent.textContent = '';
                priceHint.className = 'price-hint same';
                priceHint.style.display = 'block';
            }
        }
    });
</script>
</body>
</html>
