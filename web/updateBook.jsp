<%--
  Created by IntelliJ IDEA.
  User: Crush
  Date: 2025/6/7
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改书籍信息</title>
    <style>
        form {
            width: 500px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            padding: 10px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>修改书籍信息</h2>
<form action="UpBook" method="post">
    <input type="hidden" name="book_id" value="${book.book_id}">
    <label>书名:</label>
    <input type="text" name="title" value="${book.title}" required>
    <label>作者:</label>
    <input type="text" name="author" value="${book.author}" required>
    <label>出版社:</label>
    <input type="text" name="publisher" value="${book.publisher}" required>
    <label>出版时间:</label>
    <input type="text" name="publish_date" value="${book.publish_date}" required>
    <label>类别:</label>
    <select name="category" required>
        <option value="">请选择类别</option>
        <option value="经典" ${book.category == '经典' ? 'selected' : ''}>经典</option>
        <option value="小说" ${book.category == '小说' ? 'selected' : ''}>小说</option>
        <option value="历史" ${book.category == '历史' ? 'selected' : ''}>历史</option>
        <option value="哲学" ${book.category == '哲学' ? 'selected' : ''}>哲学</option>
        <option value="漫画" ${book.category == '漫画' ? 'selected' : ''}>漫画</option>
        <option value="自传" ${book.category == '自传' ? 'selected' : ''}>自传</option>
        <option value="学术" ${book.category == '学术' ? 'selected' : ''}>学术</option>
        <option value="传记" ${book.category == '传记' ? 'selected' : ''}>传记</option>
    </select>
    <label>数量:</label>
    <input type="number" name="stock_quantity" value="${book.stock_quantity}" required>
    <button type="submit">保存修改</button>
</form>
</body>
</html>