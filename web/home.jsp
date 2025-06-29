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
        <li class="layui-nav-item layui-this"><a href="<c:url value="/Home"/>">首页</a></li>
        <li class="layui-nav-item">
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
        <li class="layui-nav-item" lay-unselect style="float: right;">
            <c:if test="${loqinname==null}">
                <a href="DoLoginServlet" class="layui-btn layui-btn-primary" lay-on="test-page-custom">
                    <img src="https://bpic.588ku.com/element_origin_min_pic/19/04/09/e3330d623cad123abc8545573a86cc38.jpg" class="layui-nav-img">
                    登录
                </a>
            </c:if>
            <c:if test="${loqinname!=null}">
                <a class="layui-btn layui-btn-primary" lay-on="test-page-custom">
                    <img src="https://img95.699pic.com/element/40203/3579.png_300.png" class="layui-nav-img">
                        ${loqinname}
                </a>
                <dl class="layui-nav-child">
                    <dd style="text-align: center;"><a href="<c:url value="/DoLogout"/>">退出</a></dd>
                </dl>
            </c:if>
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
