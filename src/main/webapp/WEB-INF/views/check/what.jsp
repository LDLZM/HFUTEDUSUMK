<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审核中心</title>
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

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
            max-width: 500px;
            margin: 0 auto;
        }

        .audit-btn {
            display: block;
            padding: 14px 20px;
            background-color: #ac1618;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-align: center;
        }

        .audit-btn:hover {
            background-color: #c5181a;
            transform: translateY(-2px);
        }

        .audit-btn:active {
            transform: translateY(0);
        }

        .icon {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="page-header">
        <img src="../images/xh.png" alt="学校校徽" class="school-logo">
        <h1>审核中心</h1>
    </div>

    <div class="btn-group">
        <a href="/check/Demandlist" class="audit-btn">
            <i class="fa fa-shopping-cart icon"></i> 审核采购需求
        </a>

        <a href="/check/Bidlist" class="audit-btn">
            <i class="fa fa-tags icon"></i> 审核报价
        </a>

        <a href="/check/ProductCheckList" class="audit-btn">
            <i class="fa fa-cubes icon"></i> 审核货物
        </a>

        <a href="/check/Refundlist" class="audit-btn">
            <i class="fa fa-cubes icon"></i> 审核退货
        </a>

    </div>
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