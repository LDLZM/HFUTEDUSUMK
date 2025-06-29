<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加商品</title>
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

        /* 添加错误消息样式 */
        .error-message {
            color: #ff0000;
            margin-top: 5px;
            display: none;
        }

        /* 添加成功消息样式 */
        .success-message {
            color: #008000;
            margin-top: 5px;
            display: none;
        }

        /* 加载指示器样式 */
        .loader {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #3498db;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            animation: spin 1s linear infinite;
            margin: 0 auto;
            display: none;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>添加商品</h1>
    </div>

    <div class="form-container">
        <form id="productForm" action="${pageContext.request.contextPath}/products/add" method="post">
            <div class="form-group">
                <label>商品号:</label>
                <input type="text" name="id" required  placeholder="示例G01010108"  onchange="checkProductId(this)">
                <div id="idError" class="error-message"></div>
            </div>
            <script>
                function checkProductId(input) {
                    const value = input.value.trim();
                    const errorDiv = document.getElementById('idError');

                    if (value.length !== 9) {
                        errorDiv.textContent = '商品号必须为九位编码，请重新输入';
                        errorDiv.style.display = 'block';
                        input.focus(); // 让输入框重新获得焦点，方便用户修改
                        return false;
                    } else {
                        errorDiv.style.display = 'none';
                        return true;
                    }
                }
            </script>
            <div class="form-group">
                <label>商品名:</label>
                <input type="text" name="name" required>
                <div id="nameError" class="error-message"></div>
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
                        <input type="text" name="category" required placeholder="输入其他类别" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-all">
                    </div>
                </div>
                <div id="categoryError" class="error-message"></div>
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
                <input type="text" name="unitPrice" required>
                <div id="priceError" class="error-message"></div>
            </div>
            <div class="form-actions">
                <input type="submit" value="提交" class="action-btn">
                <div class="loader" id="loader"></div>
                <div id="successMessage" class="success-message">商品添加成功！</div>
            </div>
        </form>
        <a href="${pageContext.request.contextPath}/products/list" class="back-link">返回列表</a>
    </div>
</div>

<script>
    // 页面加载完成后执行
    document.addEventListener('DOMContentLoaded', function() {
        const form = document.getElementById('productForm');
        const loader = document.getElementById('loader');
        const successMessage = document.getElementById('successMessage');

        // 阻止表单默认提交行为
        form.addEventListener('submit', function(e) {
            e.preventDefault();

            // 显示加载指示器
            loader.style.display = 'block';

            // 清除之前的错误消息
            clearErrorMessages();

            // 验证表单
            if (!validateForm()) {
                loader.style.display = 'none';
                return;
            }

            // 收集表单数据
            const formData = new FormData(form);

            // 发送AJAX请求
            fetch('${pageContext.request.contextPath}/products/add', {
                method: 'POST',
                body: formData
            })
                .then(response => {
                    // 隐藏加载指示器
                    loader.style.display = 'none';

                    // 检查响应状态
                    if (response.ok) {
                        return response.json();
                    } else {
                        return response.json().then(errorData => {
                            throw new Error(errorData.message || '添加商品失败');
                        });
                    }
                })
                .then(data => {
                    // 显示成功消息
                    successMessage.style.display = 'block';

                    // 重置表单
                    form.reset();

                    // 3秒后隐藏成功消息
                    setTimeout(() => {
                        successMessage.style.display = 'none';
                    }, 3000);
                })
                .catch(error => {
                    // 显示错误消息
                    showErrorMessage(error.message);
                });
        });

        // 表单验证函数
        function validateForm() {
            let isValid = true;

            // 验证商品ID
            const idInput = document.querySelector('input[name="id"]');
            if (!checkProductId(idInput)) {
                isValid = false;
            }

            // 验证商品名称
            const nameInput = document.querySelector('input[name="name"]');
            if (!nameInput.value.trim()) {
                document.getElementById('nameError').textContent = '商品名称不能为空';
                document.getElementById('nameError').style.display = 'block';
                isValid = false;
            }

            // 验证商品类别
            const categoryInput = document.querySelector('input[name="category"]');
            if (!categoryInput.value.trim()) {
                document.getElementById('categoryError').textContent = '商品类别不能为空';
                document.getElementById('categoryError').style.display = 'block';
                isValid = false;
            }

            // 验证单价
            const priceInput = document.querySelector('input[name="unitPrice"]');
            const priceValue = priceInput.value.trim();
            if (!priceValue) {
                document.getElementById('priceError').textContent = '单价不能为空';
                document.getElementById('priceError').style.display = 'block';
                isValid = false;
            } else if (isNaN(priceValue) || parseFloat(priceValue) <= 0) {
                document.getElementById('priceError').textContent = '单价必须是正数';
                document.getElementById('priceError').style.display = 'block';
                isValid = false;
            }

            return isValid;
        }

        // 清除所有错误消息
        function clearErrorMessages() {
            const errorElements = document.querySelectorAll('.error-message');
            errorElements.forEach(element => {
                element.style.display = 'none';
            });
        }

        // 显示错误消息
        function showErrorMessage(message) {
            // 尝试将错误消息映射到特定字段
            if (message.includes('商品ID已存在')) {
                document.getElementById('idError').textContent = message;
                document.getElementById('idError').style.display = 'block';
            } else {
                // 如果无法映射到特定字段，则显示通用错误消息
                alert('错误: ' + message);
            }
        }
    });
</script>
</body>
</html>
