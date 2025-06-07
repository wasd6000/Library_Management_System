<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加书籍</title>
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
<h2>添加新书</h2>
<form action="AddBook" method="post">
    <label>书籍ID:</label>
    <input type="text" name="book_id" required>

    <label>书名:</label>
    <input type="text" name="title" required>

    <label>作者:</label>
    <input type="text" name="author" required>

    <label>出版社:</label>
    <input type="text" name="publisher" required>

    <label>出版时间:</label>
    <input type="text" name="publish_date" placeholder="YYYY-MM-DD" required>

    <label>类别:</label>
    <select name="category" required>
        <option value="">请选择类别</option>
        <option value="经典">经典</option>
        <option value="小说">小说</option>
        <option value="历史">历史</option>
        <option value="哲学">哲学</option>
        <option value="漫画">漫画</option>
        <option value="自传">自传</option>
        <option value="学术">学术</option>
        <option value="传记">传记</option>

    </select>

    <label>数量:</label>
    <input type="number" name="stock_quantity" min="1" required>

    <button type="submit">添加书籍</button>
</form>
</body>
</html>
