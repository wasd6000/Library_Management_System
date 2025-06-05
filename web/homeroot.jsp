<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="referrer" content="never">
    <title>首页</title>
    <style>
        .info {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* 间距 */
        }
        .book {
            border: 1px solid #ddd;
            padding: 10px;
            width: 200px; /* 每个书籍的宽度 */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .book img {
            max-width: 100%;
            height: auto;
        }
        .title a {
            text-decoration: none;
            color: black;
        }
        .author, .year, .publisher {
            font-size: 0.9em;
            color: #666;
        }
    </style>
    <link href="res/css/layui.css" rel="stylesheet">
</head>
<body>
<ul class="layui-nav">
    <li class="layui-nav-item layui-this"><a href="">首页</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;">借阅</a>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:;">管理</a>
        <dl class="layui-nav-child">
            <dd><a href="">用户管理</a></dd>
            <dd><a href="">书籍管理</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item" lay-unselect style="float: right;">
        <a href="javascript:;">
            <img src="//unpkg.com/outeres@0.0.10/img/layui/icon-v2.png" class="layui-nav-img">
        </a>
        <dl class="layui-nav-child">
            <dd style="text-align: center;"><a href="">退出</a></dd>
        </dl>
    </li>
</ul>
<div class="info">
    <c:forEach  items="${bookArrayList}" var="book">
        <div  class="book">
            <div class="title">
                <a href="${book.book_url}" title="${book.title}"><img src="${book.book_img_url}" alt="${book.title}"></a>
            </div>

            <div class="author">
                    ${book.author}
            </div>
            <div class="more-meta">
                <h4 class="title">
                        ${book.title}
                </h4>
                <p>
                        <span class="author">
                                ${book.author}
                        </span>
                    /
                    <span class="year">
                            ${book.publish_date}
                    </span>
                    /
                    <span class="publisher">
                            ${book.publisher}
                    </span>
                </p>
            </div>
        </div>
    </c:forEach>
</div>
<script src="res/layui.js"></script>
</body>
</html>
