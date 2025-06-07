package org.library_management_system.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.library_management_system.JavaBeans.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpuserSer")
public class UpUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 将 GET 请求转发到 POST 请求
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        // 获取用户输入的注册信息
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String user_type = req.getParameter("user_type");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        // 从上下文中获取用户列表
        List<User> userArrayList = (List<User>) getServletContext().getAttribute("userArrayList");


        // 查找用户并更新信息
        for (User user : userArrayList) {
            if (user.getUsername().equals(username)) {
                user.setPassword(password);
                user.setUser_type(user_type);
                user.setEmail(email);
                user.setPhone(phone);
                break;
            }
        }

        // 更改成功，重定向修改页面
        resp.sendRedirect("showAlluser.jsp");

    }
}