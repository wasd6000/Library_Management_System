package org.listerner;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.library_management_system.JavaBeans.Book;

import java.util.ArrayList;

@WebListener
public class DataInitBook implements ServletContextListener {
    public void contextInitialized(jakarta.servlet.ServletContextEvent sce){
        System.out.println("------------------初始化书籍------------------");
        ServletContext application = sce.getServletContext();
        ArrayList<Book> bookArrayList = new ArrayList<Book>();
        Book book = new Book();
        book.setBook_id("9787559877666");
        book.setTitle("相反的人");
        book.setPublisher("广西师范大学出版社");
        book.setPublish_date("2025-4");
        book.setCategory("漫画");
        book.setStock_quantity(3);
        bookArrayList.add(book);

        book.setBook_id("9787208193604");
        book.setTitle("无名的艺术力");
        book.setPublisher("上海人民出版社");
        book.setPublish_date("2025-4-30");
        book.setCategory("学术");
        book.setStock_quantity(5);
        bookArrayList.add(book);

        book.setBook_id("9787511748140");
        book.setTitle("意大利马克思主义史");
        book.setPublisher("中央编译出版社");
        book.setPublish_date("2025-4");
        book.setCategory("历史");
        book.setStock_quantity(2);
        bookArrayList.add(book);

        book.setBook_id("9787522832753");
        book.setTitle("日本社会的历史");
        book.setPublisher("社会科学文献出版社");
        book.setPublish_date("2025-4");
        book.setCategory("历史");
        book.setStock_quantity(3);
        bookArrayList.add(book);

        application.setAttribute( "bookArrayList", bookArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {ServletContextListener.super.contextDestroyed(sce);}
}
