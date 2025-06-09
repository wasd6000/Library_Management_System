<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加书籍</title>
    <style>
        /* 全局样式 */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://picsum.photos/id/1068/1920/1080');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* 遮罩层 */
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        /* 主容器 */
        .container {
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 600px;
            padding: 30px 40px;
            margin: 20px;
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        /* 标题样式 */
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
            letter-spacing: -0.5px;
            position: relative;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background-color: #4CAF50;
            border-radius: 3px;
        }

        /* 表单样式 */
        form {
            width: 100%;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #555;
            font-size: 16px;
        }

        input, select {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
            box-sizing: border-box;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #4CAF50;
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.2);
        }

        /* 按钮样式 */
        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        button {
            padding: 12px 30px;
            background: linear-gradient(135deg, #4CAF50 0%, #2E7D32 100%);
            color: white;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.3);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(76, 175, 80, 0.4);
        }

        button:active {
            transform: translateY(1px);
        }

        /* 动画效果 */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.5s ease forwards;
        }
    </style>
</head>
<body>
<div class="overlay"></div>
<div class="container">
    <h2>添加新书</h2>
    <form action="AddBook" method="post">
        <div class="form-group">
            <label>书籍ID:</label>
            <input type="text" name="book_id" required>
        </div>

        <div class="form-group">
            <label>书名:</label>
            <input type="text" name="title" required>
        </div>

        <div class="form-group">
            <label>作者:</label>
            <input type="text" name="author" required>
        </div>

        <div class="form-group">
            <label>出版社:</label>
            <input type="text" name="publisher" required>
        </div>

        <div class="form-group">
            <label>出版时间:</label>
            <input type="text" name="publish_date" placeholder="YYYY-MM-DD" required>
        </div>

        <div class="form-group">
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
        </div>

        <div class="form-group">
            <label>数量:</label>
            <input type="number" name="stock_quantity" min="1" required>
        </div>

        <div class="button-container">
            <button type="submit">添加书籍</button>
        </div>
    </form>
</div>
</body>
</html>