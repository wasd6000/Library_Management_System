<%@ page import="org.library_management_system.JavaBeans.Book" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Crush
  Date: 2025/6/7
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <!-- 引入LayUI CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/layui/2.9.6/css/layui.min.css">
    <style>
        body {
            background-color: #f5f7fa;
            font-family: 'Microsoft YaHei', sans-serif;
            padding: 20px;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            background-color: #009688;
            color: white;
        }
        .header h2 {
            font-size: 24px;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
        }
        .header h2 i {
            margin-right: 10px;
            font-size: 28px;
        }
        .content {
            padding: 25px;
        }
        .toolbar {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
        }
        .action-cell .layui-btn {
            margin: 2px;
        }
        .footer {
            text-align: center;
            padding: 20px;
            color: #999;
            font-size: 14px;
            border-top: 1px solid #eee;
        }
        .book-title {
            font-weight: bold;
            color: #333;
        }


    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2><i class="layui-icon layui-icon-read"></i> 图书管理系统</h2>
        <div>
            <a href="DoAddBook.jsp" class="layui-btn layui-btn-normal layui-btn-radius">
                <i class="layui-icon layui-icon-add-1"></i> 添加书籍
            </a>
        </div>
    </div>

    <div class="content">
        <div class="toolbar">
            <h3>书籍列表 <span class="layui-badge-dot"></span></h3>
            <div class="layui-form layui-form-pane">
                <div class="layui-form-item" style="margin-bottom: 0;">
                </div>
            </div>
        </div>

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
            <%
                ArrayList<Book> bookList = (ArrayList<Book>) application.getAttribute("bookArrayList");
                if (bookList != null && !bookList.isEmpty()) {
                    for (Book book : bookList) {
            %>
            <tr>
                <td><%= book.getBook_id() %></td>
                <td><span class="book-title"><%= book.getTitle() %></span></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getPublisher() %></td>
                <td><%= book.getPublish_date() %></td>
                <td><span class="book-category"><%= book.getCategory() %></span></td>
                <td><%= book.getStock_quantity()%></td>
                <td class="action-cell">
                    <a href="UpBook?id=<%= book.getBook_id() %>" class="layui-btn layui-btn-xs layui-bg-blue">
                        <i class="layui-icon layui-icon-edit"></i> 修改
                    </a>
                    <a href="DeleteBook?id=<%= book.getBook_id() %>" class="layui-btn layui-btn-xs layui-btn-danger">
                        <i class="layui-icon layui-icon-delete"></i> 删除
                    </a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr>
                <td colspan="8">
                    <div class="no-data">
                        <i class="layui-icon layui-icon-tips"></i>
                        <div>暂无书籍数据</div>
                    </div>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>

</div>

</body>
</html>

