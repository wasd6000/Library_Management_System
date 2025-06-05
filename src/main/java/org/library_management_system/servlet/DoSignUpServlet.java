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

@WebServlet("/DoSignUp")
public class DoSignUpServlet extends HttpServlet {
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

        // 如果用户列表为空，则初始化
        if (userArrayList == null) {
            userArrayList = new ArrayList<>();
            getServletContext().setAttribute("userArrayList", userArrayList);
        }

        // 检查用户名是否已存在
        boolean isUsernameExists = false;
        for (User user : userArrayList) {
            if (user.getUsername().equals(username)) {
                isUsernameExists = true;
                break;
            }
        }

        // 根据检查结果进行处理
        if (isUsernameExists) {
            // 用户名已存在，重定向回注册页面并携带错误信息
            req.setAttribute("error", "Username already exists. Please try a different one.");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
        } else {
            // 用户名可用，创建新用户并添加到用户列表
            User newUser = new User();
            newUser.setUsername(username);
            newUser.setPassword(password);
            newUser.setUser_type(user_type);
            newUser.setEmail(email);
            newUser.setPhone(phone);
            newUser.setUser_id(String.valueOf(userArrayList.size() + 1));
            userArrayList.add(newUser);

            // 注册成功，重定向到注册成功页面
            resp.sendRedirect("login.jsp");
        }
    }
}