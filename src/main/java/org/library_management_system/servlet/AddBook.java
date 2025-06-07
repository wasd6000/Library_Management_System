package org.library_management_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.library_management_system.JavaBeans.Book;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/AddBook")
public class AddBook extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        // 获取表单参数（根据JSP表单字段名和Book类属性调整）
        String book_id = request.getParameter("book_id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String publish_date = request.getParameter("publish_date");
        String category = request.getParameter("category");
        int stockQuantity = Integer.parseInt(request.getParameter("stock_quantity"));

        // 创建新的书籍对象（使用无参构造函数，通过setter方法设置属性）
        Book newBook = new Book();
        newBook.setBook_id(book_id);
        newBook.setTitle(title);
        newBook.setAuthor(author);
        newBook.setPublisher(publisher);
        newBook.setPublish_date(publish_date);
        newBook.setCategory(category);
        newBook.setStock_quantity(stockQuantity);

        // 设置默认的URL值
        newBook.setBook_url("javascript:;");
        newBook.setBook_img_url("javascript:;");

        // 从application中获取书籍列表
        ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");

        // 如果列表不存在，则初始化
        if (bookList == null) {
            bookList = new ArrayList<>();
            getServletContext().setAttribute("bookArrayList", bookList);
        }

        // 将新书添加到列表
        bookList.add(newBook);

        // 重定向到书籍列表页面
        response.sendRedirect("showAllbook.jsp");
    }
}