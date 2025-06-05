<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<h2>Sign Up</h2>
<form action="DoSignUpServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    <label for="userType">User Type:</label>
    <select id="userType" name="userType">
        <option value="user">User</option>
        <option value="admin">Admin</option>
    </select><br><br>
    <button type="submit">Sign Up</button>
</form>
</body>
</html>
