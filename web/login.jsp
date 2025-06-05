<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
    <!-- 引入 Layui CSS -->
    <link rel="stylesheet" href="res/css/layui.css" media="all">
    <!-- 自定义样式 -->
    <style>
        .centered-card {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50vh; /* 让容器占满整个视口高度 */
            background-color: white; /* 添加背景颜色 */
        }
        .layui-card {
            width: 400px; /* 设置卡片宽度 */
            border: 2px solid #009688; /* 添加边框，颜色为 Layui 主色调 */
            border-radius: 8px; /* 添加圆角边框 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
        }
        .layui-card-header {
            background-color: #009688; /* 设置卡片头部背景颜色 */
            color: white; /* 设置标题文字颜色 */
            text-align: center; /* 标题居中 */
            padding: 15px 0; /* 调整内边距 */
        }
        .layui-card-body {
            padding: 20px; /* 调整卡片内容的内边距 */
        }
        .layui-form-item {
            margin-bottom: 15px; /* 调整表单项间距 */
        }
        .layui-btn {
            margin-right: 10px; /* 调整按钮间距 */
        }
    </style>
</head>
<body>
<div class="centered-card">
    <div class="layui-card">
        <div class="layui-card-header">
            <h2>登录</h2> <!-- 标题居中 -->
        </div>
        <div class="layui-card-body">
            <form class="layui-form" action="DoLoginServlet" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">登录</button>
                        <button type="button" class="layui-btn layui-btn-normal" onclick="location.href='SignUp'">注册</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 引入 Layui JavaScript -->
<script src="res/layui.js"></script>
<script>
    // 初始化 Layui 表单组件
    layui.use('form', function(){
        var form = layui.form;
    });
</script>
</body>
</html>