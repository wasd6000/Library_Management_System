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
    <title>表格展示</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .action-btn {
            padding: 5px 10px;
            margin-right: 5px;
        }
    </style>
</head>
<body>
<h2>书籍列表</h2>
<a href="DoAddBook.jsp" class="action-btn">添加书籍</a>
<table>
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
    <%
        ArrayList<Book> bookList = (ArrayList<Book>) application.getAttribute("bookArrayList");
        if (bookList != null) {
            for (Book book : bookList) {
    %>
    <tr>
        <td><%= book.getBook_id() %></td>
        <td><%= book.getTitle() %></td>
        <td><%= book.getAuthor() %></td>
        <td><%= book.getPublisher() %></td>
        <td><%= book.getPublish_date() %></td>
        <td><%= book.getCategory() %></td>
        <td><%= book.getStock_quantity() %></td>
        <td>
            <a href="UpBook?id=<%= book.getBook_id() %>" class="action-btn">修改</a>
            <a href="DeleteBook?id=<%= book.getBook_id() %>" class="action-btn">删除</a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="8">暂无书籍数据</td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
