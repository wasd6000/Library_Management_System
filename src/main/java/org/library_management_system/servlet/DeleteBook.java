package org.library_management_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.library_management_system.JavaBeans.Book;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/DeleteBook")
public class DeleteBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");
            if (bookList != null) {
                for (int i = 0; i < bookList.size(); i++) {
                    if (bookList.get(i).getBook_id().equals(id)) {
                        bookList.remove(i);
                        break;
                    }
                }
                getServletContext().setAttribute("bookArrayList", bookList);
            }
        }
        response.sendRedirect("showAllbook.jsp");
    }
}