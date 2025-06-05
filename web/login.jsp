<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>登录</title>
</head>
<body>
<h2>Login</h2>
<form action="DoLoginServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    <button type="submit">Login</button>
    <button type="button" onclick="location.href='DoSignUpServlet'">Sign Up</button>
</form>
</body>
</html>
