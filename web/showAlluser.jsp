<%@ page import="java.util.ArrayList" %>
<%@ page import="org.library_management_system.JavaBeans.User" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
</head>
<body>
<h2>User Management</h2>
<table border="1">
    <tr>
        <th>Username</th>
        <th>Password</th>
        <th>User Type</th>
        <th>Actions</th>
    </tr>
    <%
        ArrayList<User> userArrayList = (ArrayList<User>) application.getAttribute("userArrayList");
        if (userArrayList != null) {
            for (User user : userArrayList) {
    %>
    <tr>
        <td><%= user.getUsername() %></td>
        <td><%= user.getPassword() %></td>
        <td><%= user.getUser_type() %></td>
        <td>
            <a href="DeleteUser?username=<%= user.getUsername() %>">Delete</a>
            <a href="UpUser?username=<%= user.getUsername() %>">Update</a>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
