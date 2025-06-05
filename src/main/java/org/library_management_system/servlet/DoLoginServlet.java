package org.library_management_system.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.library_management_system.JavaBeans.User;
import java.io.*;
import java.util.ArrayList;
@WebServlet("/DoSignUpServlet")
public class DoLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        ArrayList<User> userArrayList = (ArrayList<User>) getServletContext().getAttribute("userArrayList");

        if (userArrayList == null) {
            userArrayList = new ArrayList<>();
            getServletContext().setAttribute("userArrayList", userArrayList);
        }

        boolean loginSuccess = false;
        String redirectUrl = "/Home";
        for (User user : userArrayList) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                loginSuccess = true;
                if ("admin".equals(user.getUser_type())) {
                    redirectUrl = "/HomeRoot";
                }
                break;
            }
        }

        if (loginSuccess) {
            response.sendRedirect(redirectUrl);
        } else {
            response.getWriter().println("Login failed. Please try again.");
        }
    }
}
