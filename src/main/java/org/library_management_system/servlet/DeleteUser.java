package org.library_management_system.servlet;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.library_management_system.JavaBeans.User;
import java.io.*;
import java.util.ArrayList;
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        ArrayList<User> userArrayList = (ArrayList<User>) getServletContext().getAttribute("userArrayList");

        if (userArrayList != null) {
            userArrayList.removeIf(user -> user.getUsername().equals(username));
        }

        response.sendRedirect("showAlluser.jsp");
    }
}
