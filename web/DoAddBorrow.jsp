<%@ page import="org.library_management_system.JavaBeans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>图书管理系统</title>
    <link rel="stylesheet" href="res/css/layui.css">
    <style>
        body {
            background-color: #f8f9fa;
            color: #333;
            font-family: Arial, sans-serif;
        }
        h2 {
            color: #009688;
            text-align: center;
        }
        .layui-table {
            background-color: #ffffff;
            border: 1px solid #90ee90;
        }
        .layui-table th {
            background-color: #009688;
            color: #fff;
        }
        .layui-btn-normal {
            background-color: #009688;
            color: #fff;
        }
        .layui-btn-danger {
            background-color: #ff6347;
            color: #fff;
        }
        .table-container {
            width: 80%;
            margin: 0 auto;
            overflow-y: auto;
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
<c:if test="${loqinname==null}">
    <meta http-equiv="refresh" content="0;url=DoLoginServlet">
</c:if>
<ul class="layui-nav">
    <li class="layui-nav-item"><a href="<c:url value="/HomeRoot"/>">首页</a></li>
    <li class="layui-nav-item layui-this">
        <a href="DoAddBorrow.jsp">借阅</a>
    </li>
    <li class="layui-nav-item">
        <a href="DueBook.jsp">归还</a>
    </li>
    <li class="layui-nav-item">
        <a href="DoAddBook.jsp">书籍添加</a>
    </li>
    <li class="layui-nav-item">
        <a href="showAllBorrow.jsp">借阅记录展示</a>
    </li>
    <c:if test="${root==1}">
        <li class="layui-nav-item">
            <a href="javascript:;">管理</a>
            <dl class="layui-nav-child">
                <dd><a href="showAlluser.jsp">用户管理</a></dd>
                <dd><a href="showAllbook.jsp">书籍管理</a></dd>
            </dl>
        </li>
    </c:if>
    <li class="layui-nav-item" lay-unselect style="float: right;">
        <c:if test="${loqinname==null}">
            <a href="DoLoginServlet" class="layui-btn layui-btn-primary">
                <img src="https://bpic.588ku.com/element_origin_min_pic/19/04/09/e3330d623cad123abc8545573a86cc38.jpg" class="layui-nav-img">
                登录
            </a>
        </c:if>
        <c:if test="${loqinname!=null}">
            <a class="layui-btn layui-btn-primary">
                <img src="https://tse2-mm.cn.bing.net/th/id/OIP-C.NwamPndfqz2IZkxK_5racwHaHa?r=0&rs=1&pid=ImgDetMain" class="layui-nav-img">
                    ${loqinname}
            </a>
            <dl class="layui-nav-child">
                <dd style="text-align: center;"><a href="<c:url value="/DoLogout"/>">退出</a></dd>
            </dl>
        </c:if>
    </li>
</ul>

<div class="carousel">
    <div class="layui-carousel" lay-filter="book-offer-carousel">
        <div carousel-item="">
            <div><img src="https://img3.doubanio.com/view/subject/s/public/s35119153.jpg" alt="Offer 1"></div>
            <div><img src="https://via.placeholder.com/1200x300?text=Book+Offer+2" alt="Offer 2"></div>
            <div><img src="https://via.placeholder.com/1200x300?text=Book+Offer+3" alt="Offer 3"></div>
        </div>
    </div>
</div>

<h2 class="layui-title user-title">书籍借阅</h2>
<div class="table-container">
    <table class="layui-table">
        <colgroup>
            <col width="80">
            <col width="200">
            <col width="120">
            <col width="150">
            <col width="120">
            <col width="100">
            <col width="80">
            <col width="160">
        </colgroup>
        <thead>
        <tr>
            <th>ID</th>
            <th>书名</th>
            <th>作者</th>
            <th>出版社</th>
            <th>出版时间</th>
            <th>类别</th>
            <th>数量</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${applicationScope.bookArrayList}" var="book">
            <tr>
                <td>${book.book_id}</td>
                <td><span class="book-title">${book.title}</span></td>
                <td>${book.author}</td>
                <td>${book.publisher}</td>
                <td>${book.publish_date}</td>
                <td><span class="book-category">${book.category}</span></td>
                <td>${book.stock_quantity}</td>
                <td class="action-cell">
                    <a href="DoAddBorrow?id=${book.book_id}&name=${loqinname}" class="layui-btn layui-btn-xs layui-bg-blue">
                        <i class="layui-icon layui-icon-edit"></i> 借阅
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

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
        <img src="https://img9.doubanio.com/view/subject/s/public/s35120245.jpg" alt="New Book 4">
        <h3>怪物之乡</h3>
    </div>
    <div class="book-card">
        <img src="https://img1.doubanio.com/view/subject/s/public/s34263440.jpg" alt="New Book 5">
        <h3>盗墓笔记 1</h3>
    </div>
</div>

<script src="res/layui.js"></script>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        carousel.render({
            elem: '#book-offer-carousel',
            width: '100%',
            height: '300px',
            arrow: 'always',
            anim: 'fadein',
            interval: 3000
        });
    });
</script>
</body>
</html>