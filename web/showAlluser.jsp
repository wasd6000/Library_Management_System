<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/layui-src/dist/css/layui.css">
    <style>
        /* 绿白色主题样式 */
        body {
            background-color: #f8f9fa; /* 白色背景 */
            color: #333; /* 深灰色文字 */
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #009688; /* 深绿色标题 */
        }
        .layui-table {
            background-color: #ffffff; /* 白色表格背景 */
            border: 1px solid #90ee90; /* 浅绿色边框 */
        }
        .layui-table th {
            background-color: #009688; /* 深绿色表头 */
            color: #fff; /* 白色文字 */
        }
        .layui-btn-normal {
            background-color: #009688; /* 浅绿色按钮 */
            color: #fff; /* 白色文字 */
        }
        .layui-btn-danger {
            background-color: #ff6347; /* 番茄红按钮 */
            color: #fff; /* 白色文字 */
        }
        .user-title {
            text-align: center;
        }
        .table-container {
            width: 80%; /* 设置表格容器的宽度 */
            margin: 0 auto; /* 居中显示 */
            overflow-y: auto; /* 启用垂直滚动条 */
        }
        .layui-table {
            width: 100%; /* 表格宽度占满容器 */
        }
        .carousel {
            width: 100%;
            margin: 20px 0;
        }
        .carousel img {
            width: 100%;
            height: auto;
        }
        .new-books {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px 0;
        }
        .new-books .book-card {
            width: 200px;
            margin: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .new-books .book-card img {
            width: 100%;
            height: auto;
            margin-bottom: 10px;
        }
        .new-books .book-card h3 {
            font-size: 16px;
            margin: 0;
        }
    </style>
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item layui-this"><a href="<c:url value="/HomeRoot"/>">首页</a></li>
    <li class="layui-nav-item">
        <a href="<c:url value="/DoAddBorrow"/>">借阅</a>
    </li>
    <li class="layui-nav-item">
        <a href="<c:url value="/DueBook"/>">归还</a>
    </li>
    <li class="layui-nav-item">
        <a href="DoAddBook.jsp">书籍添加</a>
    </li>
    <li class="layui-nav-item">
        <a href="showAllBorrow.jsp">借阅记录展示</a>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">管理</a>
        <dl class="layui-nav-child">
            <dd><a href="showAlluser.jsp">用户管理</a></dd>
            <dd><a href="showAllbook.jsp">书籍管理</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item" lay-unselect style="float: right;">
        <c:if test="${loqinname==null}">
            <a href="DoLoginServlet" class="layui-btn layui-btn-primary" lay-on="test-page-custom">
                <img src="https://bpic.588ku.com/element_origin_min_pic/19/04/09/e3330d623cad123abc8545573a86cc38.jpg" class="layui-nav-img">
                登录
            </a>
        </c:if>
        <c:if test="${loqinname!=null}">
            <a class="layui-btn layui-btn-primary" lay-on="test-page-custom">
                <img src="https://tse2-mm.cn.bing.net/th/id/OIP-C.NwamPndfqz2IZkxK_5racwHaHa?r=0&rs=1&pid=ImgDetMain" class="layui-nav-img">
                    ${loqinname}
            </a>
            <dl class="layui-nav-child">
                <dd style="text-align: center;"><a href="<c:url value="/DoLogout"/>">退出</a></dd>
            </dl>
        </c:if>
    </li>
</ul>

<!-- 图书购买优惠轮播图 -->
<div class="carousel">
    <div class="layui-carousel" lay-filter="book-offer-carousel">
        <div carousel-item="">
            <div><img src="https://img3.doubanio.com/view/subject/s/public/s35119153.jpg" alt="Offer 1"></div>
            <div><img src="https://via.placeholder.com/1200x300?text=Book+Offer+2" alt="Offer 2"></div>
            <div><img src="https://via.placeholder.com/1200x300?text=Book+Offer+3" alt="Offer 3"></div>
        </div>
    </div>
</div>

<h2 class="layui-title user-title">用户管理</h2>
<div class="table-container">
    <table class="layui-table">
        <colgroup>
            <col width="80">
            <col width="80">
            <col width="80">
            <col width="60">
            <col width="80">
            <col width="60">
        </colgroup>
        <thead>
        <tr>
            <th>用户名</th>
            <th>密码</th>
            <th>用户类型</th>
            <th>邮箱</th>
            <th>电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${applicationScope.userArrayList}" var="user">
            <tr>
                <td>${user.username}</td>
                <td>******</td> <!-- 隐藏密码 -->
                <td>
                    <c:choose>
                        <c:when test="${user.user_type == 1}">
                            管理员
                        </c:when>
                        <c:otherwise>
                            普通用户
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>
                    <a href="DeleteUser?username=${user.username}" class="layui-btn layui-btn-danger">删除</a>
                    <a href="UpUser?username=${user.username}" class="layui-btn layui-btn-normal">修改</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 新书广告 -->
<h2 class="layui-title user-title">新书上架</h2>
<div class="new-books">
    <div class="book-card">
        <img src="https://img3.doubanio.com/view/subject/s/public/s35119153.jpg" alt="New Book 1">
        <h3>相反的人</h3>
    </div>
    <div class="book-card">
        <img src="https://img9.doubanio.com/view/subject/s/public/s35125024.jpg" alt="New Book 2">
        <h3>无名的艺术力</h3>
    </div>
    <div class="book-card">
        <img src="https://img9.doubanio.com/view/subject/s/public/s35124195.jpg" alt="New Book 3">
        <h3>哲学家的最后一课</h3>
    </div>
    <div class="book-card">
        <img src="https://img9.doubanio.com/view/subject/s/public/s35120245.jpg"" alt="New Book 2">
        <h3>怪物之乡</h3>
    </div>
    <div class="book-card">
        <img src="https://img1.doubanio.com/view/subject/s/public/s34263440.jpg" alt="New Book 2">
        <h3>盗墓笔记 1</h3>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/layui-src/dist/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        // 设置轮播图
        carousel.render({
            elem: '#book-offer-carousel',
            width: '100%', // 设置轮播图宽度
            height: '300px', // 设置轮播图高度
            arrow: 'always', // 总是显示箭头
            anim: 'fadein', // 切换动画方式
            interval: 3000 // 切换时间间隔
        });
    });
</script>
</body>
</html>