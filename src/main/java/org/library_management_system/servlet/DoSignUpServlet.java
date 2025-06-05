package org.library_management_system.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.library_management_system.JavaBeans.User;
import java.io.*;
import java.util.ArrayList;
@WebServlet("/DoSignUpServlet")
public class DoSignUpServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        ArrayList<User> userArrayList = (ArrayList<User>) getServletContext().getAttribute("userArrayList");

        if (userArrayList == null) {
            userArrayList = new ArrayList<>();
            getServletContext().setAttribute("userArrayList", userArrayList);
        }

        boolean isUsernameExists = false;
        for (User user : userArrayList) {
            if (user.getUsername().equals(username)) {
                isUsernameExists = true;
                break;
            }
        }

        if (isUsernameExists) {
            response.getWriter().println("Username already exists. Please try a different one.");
        } else {
            User newUser = new User();
            userArrayList.add(newUser);
            response.sendRedirect("login.jsp");
        }
    }
}
