package org.library_management_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.library_management_system.JavaBeans.Book;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/UpBook")
public class UpBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        if (id != null && !id.isEmpty()) {
            ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");
            if (bookList != null) {
                for (Book book : bookList) {
                    // 修改为使用getBook_id()方法
                    if (book.getBook_id().equals(id)) {
                        request.setAttribute("book", book);
                        request.getRequestDispatcher("updateBook.jsp").forward(request, response);
                        return;
                    }
                }
            }
        }
        response.sendRedirect("showAllbook.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // 修改参数名称以匹配表单字段
        String id = request.getParameter("book_id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String publishDate = request.getParameter("publish_date");
        String category = request.getParameter("category");
        int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity"));

        ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");
        if (bookList != null) {
            for (int i = 0; i < bookList.size(); i++) {
                // 修改为使用getBook_id()方法
                if (bookList.get(i).getBook_id().equals(id)) {
                    // 使用无参构造函数和setter方法
                    Book updatedBook = new Book();
                    updatedBook.setBook_id(id);
                    updatedBook.setTitle(title);
                    updatedBook.setAuthor(author);
                    updatedBook.setPublisher(publisher);
                    updatedBook.setPublish_date(publishDate);
                    updatedBook.setCategory(category);
                    updatedBook.setStock_quantity(stockQuantity);

                    // 保留原有的URL属性值
                    updatedBook.setBook_url(bookList.get(i).getBook_url());
                    updatedBook.setBook_img_url(bookList.get(i).getBook_img_url());

                    bookList.set(i, updatedBook);
                    break;
                }
            }
            getServletContext().setAttribute("bookArrayList", bookList);
        }
        response.sendRedirect("showAllbook.jsp");
    }
}