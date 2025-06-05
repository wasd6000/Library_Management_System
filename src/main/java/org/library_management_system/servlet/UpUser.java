package org.library_management_system.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.library_management_system.JavaBeans.User;
import java.io.*;
import java.util.ArrayList;
@WebServlet("/UpUser")
public class UpUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        ArrayList<User> userArrayList = (ArrayList<User>) getServletContext().getAttribute("userArrayList");

        if (userArrayList != null) {
            for (User user : userArrayList) {
                if (user.getUsername().equals(username)) {
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("updateUser.jsp").forward(request, response);
                    return;
                }
            }
        }

        response.getWriter().println("User not found.");
    }
}