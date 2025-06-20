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

@WebServlet("/DoAddBorrow")
public class DoAddBorrow extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置请求和响应的编码
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset=UTF-8");

        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String now_time = now.format(formatter);

        String name = req.getParameter("name");
        String book_id = req.getParameter("id");
        String borrow_id = now_time+name;

//        System.out.println(name);
//        System.out.println(book_id);

        BorrowRecord borrow = new BorrowRecord();
        borrow.setRecord_id(borrow_id);
        borrow.setBook_id(book_id);
        borrow.setUser_id(name);
        borrow.setBorrow_date(now_time);
        borrow.setDue_date("3");
        borrow.setReturn_date("");
        borrow.setIs_overdue("0");

        ArrayList<BorrowRecord> borrowrecordList = (ArrayList<BorrowRecord>) getServletContext().getAttribute("borrowRecordArrayList");
        borrowrecordList.add(borrow);

        ArrayList<Book> bookList = (ArrayList<Book>) getServletContext().getAttribute("bookArrayList");

        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getBook_id().equals(book_id)) {
                // 更新库存
                bookList.get(i).setStock_quantity(bookList.get(i).getStock_quantity() - 1);
                break;
            }
        }
        resp.sendRedirect("DoAddBorrow.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
