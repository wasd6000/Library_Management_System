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

@WebServlet("/DoLogin")
public class DoLoginServlet extends HttpServlet {
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
        // 获取用户输入的用户名和密码
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        HttpSession  session = req.getSession();
        // 从上下文中获取用户列表
        List<User> userArrayList = (List<User>) getServletContext().getAttribute("userArrayList");

        // 如果用户列表为空，则初始化
        if (userArrayList == null) {
            userArrayList = new ArrayList<>();
            getServletContext().setAttribute("userArrayList", userArrayList);
        }

        // 登录逻辑
        boolean loginSuccess = false;
        String redirectUrl = "home.jsp";
        for (User user : userArrayList) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                loginSuccess = true;
                if ("1".equals(user.getUser_type())) {
                    redirectUrl = "homeroot.jsp";
                    session.setAttribute("root", "1");
                }else{
                    session.setAttribute("root", "0");
                }
                session.setAttribute("loqinname", username);
                break;
            }
        }

        // 根据登录结果进行处理
        if (loginSuccess) {
            // 登录成功，重定向到相应页面
            resp.sendRedirect(redirectUrl);
        } else {
            // 登录失败，重定向回登录页面并携带错误信息
            req.setAttribute("error", "Login failed. Please try again.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}