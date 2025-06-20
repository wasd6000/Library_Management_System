<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>借阅记录查阅 | 图书管理系统</title>
    <link rel="stylesheet" href="res/css/layui.css">
    <style>
        /* 顶部标题栏样式 */
        .header {
            background-color: #009f95;
            color: white;
            padding: 15px 20px;
            border-radius: 4px;
            margin-bottom: 20px;
            box-shadow: 0 1px 2px rgba(0,0,0,0.1);
        }
        /* 状态标签基础样式 */
        .status {
            padding: 3px 8px;
            border-radius: 3px;
            font-size: 12px;
        }
        /* 已归还状态样式 */
        .status-returned {
            background-color: #e8f9f0;
            color: #0a7b3e;
            border: 1px solid #c3e6cb;
        }
        /* 已超期状态样式 */
        .status-overdue {
            background-color: #fde8e8;
            color: #c23b3b;
            border: 1px solid #f5c6cb;
        }
        /* 借阅中状态样式 */
        .status-borrowing {
            background-color: #e3f2fd;
            color: #1a6bc4;
            border: 1px solid #bee5eb;
        }
        /* 页脚样式 */
        .footer {
            text-align: center;
            padding: 20px 0;
            color: #999;
            font-size: 13px;
            margin-top: 20px;
        }
        /* 用户信息样式 */
        .user-info {
            float: right;
            font-size: 14px;
        }

    </style>
</head>
<body>
<!-- 顶部标题栏 -->
<div class="header">
    <div class="layui-row">
        <div class="layui-col-md9">
            <h2><i class="layui-icon layui-icon-read"></i> 借阅记录查询</h2>
        </div>
        <div class="layui-col-md3">
            <div class="user-info">
                <i class="layui-icon layui-icon-username"></i> ${sessionScope.currentUser.username}
                <a href="homeroot.jsp" class="layui-btn layui-btn-sm layui-btn-primary">
                    <i class="layui-icon layui-icon-home"></i> 返回主页
                </a>
            </div>
        </div>
    </div>
</div>
<!-- 借阅记录表格 -->
<div class="card">
    <div class="card-title">
        <i class="layui-icon layui-icon-form"></i> 借阅记录列表
    </div>
    <table class="layui-table" lay-size="sm">
        <colgroup>
            <col width="120">
            <col width="200">
            <col width="120">
            <col width="100">
            <col width="100">
            <col width="100">
            <col width="80">

        </colgroup>
        <thead>
        <tr>
            <th>借阅ID</th>
            <th>书籍名称</th>
            <th>借阅用户</th>
            <th>借阅时间</th>
            <th>应还日期</th>
            <th>归还日期</th>
            <th>状态</th>
        </tr>
        </thead>
        <tbody>
        <!-- 使用JSTL遍历借阅记录 -->
        <c:forEach items="${applicationScope.borrowRecordArrayList}" var="record">
            <c:set var="bookName" value="未知书籍" />
            <c:forEach items="${applicationScope.bookArrayList}" var="book">
                <c:if test="${book.id == record.book_id}">
                    <c:set var="bookName" value="${book.name}" />
                </c:if>
            </c:forEach>

            <c:set var="userName" value="未知用户" />
            <c:forEach items="${applicationScope.userArrayList}" var="user">
                <c:if test="${user.id == record.user_id}">
                    <c:set var="userName" value="${user.username}" />
                </c:if>
            </c:forEach>

            <tr>
                <td>${record.id.substring(0, 10)}</td>
                <td>${bookName}</td>
                <td>${userName}</td>
                <td><fmt:formatDate value="${record.borrow_time}" pattern="yyyy-MM-dd"/></td>
                <td><fmt:formatDate value="${record.due_time}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <c:choose>
                        <c:when test="${not empty record.return_time}">
                            <fmt:formatDate value="${record.return_time}" pattern="yyyy-MM-dd"/>
                        </c:when>
                        <c:otherwise>-</c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${not empty record.return_time}">
                            <span class="status status-returned">已归还</span>
                        </c:when>
                        <c:when test="${record.is_overdue}">
                            <span class="status status-overdue">已超期</span>
                        </c:when>
                        <c:otherwise>
                            <span class="status status-borrowing">在借中</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td class="action-btn">
                    <button class="layui-btn layui-btn-xs layui-btn-normal">
                        <i class="layui-icon layui-icon-about"></i> 详情
                    </button>

                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- 分页控件 -->
    <div id="pagination" style="text-align: center; margin-top: 20px;"></div>
</div>

<!-- 页脚 -->
<div class="footer">
    <p>© 四川文理学院 2023级14班 图书管理系统 | 借阅记录管理</p>
</div>

<script src="res/layui.js"></script>
<script>
    layui.use(['form', 'laypage'], function(){
        var form = layui.form;
        var laypage = layui.laypage;

        // 初始化分页
        laypage.render({
            elem: 'pagination',
            count: ${applicationScope.borrowRecordArrayList.size()},
            limit: 10,
            layout: ['count', 'prev', 'page', 'next', 'skip'],
            theme: '#1e9fff',
            jump: function(obj, first){
                if(!first){
                    // 模拟分页效果
                    var rows = document.querySelectorAll('tbody tr');
                    rows.forEach(function(row, index){
                        if(index >= (obj.curr-1)*obj.limit && index < obj.curr*obj.limit){
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }
            }
        });

        // 初始化表单元素
        form.render();
    });
</script>
</body>
</html>
