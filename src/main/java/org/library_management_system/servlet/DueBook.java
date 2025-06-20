package org.library_management_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.library_management_system.JavaBeans.Book;
import org.library_management_system.JavaBeans.BorrowRecord;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

@WebServlet("/DueBook")
public class DueBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        String name = req.getParameter("name");
        String book_id = req.getParameter("id");
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String now_time = now.format(formatter);

        ArrayList<BorrowRecord> borrowrecordList = (ArrayList<BorrowRecord>) getServletContext().getAttribute("borrowRecordArrayList");
        ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getBook_id().equals(book_id)) {
                // 更新库存
                bookList.get(i).setStock_quantity(bookList.get(i).getStock_quantity() + 1);
                break;
            }
        }
        for (int i = 0; i < borrowrecordList.size(); i++){
            if (borrowrecordList.get(i).getBook_id().equals(book_id)&&borrowrecordList.get(i).getUser_id().equals(name)){
                borrowrecordList.get(i).setReturn_date(now_time);
                borrowrecordList.get(i).setIs_overdue("0");
                break;
            }
        }
        resp.sendRedirect("DueBook.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
