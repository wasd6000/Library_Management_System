<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<!DOCTYPE html>
<html>
<head>
  <title>注册</title>
  <!-- 引入 Layui CSS -->
  <link rel="stylesheet" href="res/css/layui.css" media="all">
  <!-- 自定义样式 -->
  <style>
    /* 背景样式 */
    body {
      background-image: url('https://ts1.tc.mm.bing.net/th/id/R-C.ac133896b2735871271f35272484cfbf?rik=k0a86ZhyanNt9g&riu=http%3a%2f%2fn.sinaimg.cn%2fsinacn10114%2f600%2fw1920h1080%2f20190518%2f1372-hwzkfpv2143245.jpg&ehk=DU3HSmHLIjdJx1fj6fhR1FLcDsewKDsoKdyrELfab%2bg%3d&risl=&pid=ImgRaw&r=0'); /* 添加背景图片 */
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      height: 100vh;
      margin: 0;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .centered-card {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* 让容器占满整个视口高度 */
    }
    .layui-card {
      width: 400px; /* 设置卡片宽度 */
      border: 2px solid #009688; /* 添加边框，颜色为 Layui 主色调 */
      border-radius: 8px; /* 添加圆角边框 */
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
      background-color: rgba(255, 255, 255, 0.95); /* 半透明背景 */
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
    .layui-input-block {
      position: relative;
    }
    .layui-input-block i {
      position: absolute;
      left: 10px;
      top: 50%;
      transform: translateY(-50%);
      color: #999;
    }
    .layui-input {
      padding-left: 30px; /* 为输入框留出图标空间 */
    }
  </style>
</head>
<body>
<div class="centered-card">
  <div class="layui-card">
    <div class="layui-card-header">
      <h2>注册</h2> <!-- 标题居中 -->
    </div>
    <div class="layui-card-body">
      <form class="layui-form" action="DoSignUp" method="post">
        <div class="layui-form-item">
          <label class="layui-form-label">用户名</label>
          <div class="layui-input-block">
            <i class="layui-icon layui-icon-username"></i>
            <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">密码</label>
          <div class="layui-input-block">
            <i class="layui-icon layui-icon-password"></i>
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">邮箱</label>
          <div class="layui-input-block">
            <i class="layui-icon layui-icon-email"></i>
            <input type="email" name="email" required lay-verify="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">电话</label>
          <div class="layui-input-block">
            <i class="layui-icon layui-icon-cellphone"></i>
            <input type="text" name="phone" required lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
          </div>
        </div>
        <div class="layui-form-item">
          <label class="layui-form-label">用户类型</label>
          <div class="layui-input-block">
            <select name="user_type" required lay-verify="required">
              <option value="">请选择用户类型</option>
              <option value="1">管理员</option>
              <option value="0">普通用户</option>
            </select>
          </div>
        </div>
        <div class="layui-form-item">
          <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
            <button type="button" class="layui-btn layui-btn-normal" onclick="location.href='DoLogin'">登录</button>
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