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
        Book book1 = new Book();
        book1.setBook_id("9787559877666");
        book1.setBook_url("https://book.douban.com/subject/37156586/");
        book1.setTitle("相反的人");
        book1.setAuthor("陆冉");
        book1.setPublisher("广西师范大学出版社");
        book1.setPublish_date("2025-4");
        book1.setCategory("漫画");
        book1.setStock_quantity(3);
        book1.setBook_img_url("https://img3.doubanio.com/view/subject/s/public/s35119153.jpg");
        bookArrayList.add(book1);

        Book book2 = new Book();
        book2.setBook_id("9787208193604");
        book2.setBook_url("https://book.douban.com/subject/37309999/");
        book2.setTitle("无名的艺术力");
        book2.setAuthor("鲁明军");
        book2.setPublisher("上海人民出版社");
        book2.setPublish_date("2025-4-30");
        book2.setCategory("学术");
        book2.setStock_quantity(5);
        book2.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s35125024.jpg");
        bookArrayList.add(book2);

        Book book3 = new Book();
        book3.setBook_id("9787511748140");
        book3.setBook_url("https://book.douban.com/subject/37335223/");
        book3.setTitle("意大利马克思主义史");
        book3.setAuthor("保罗·法维利");
        book3.setPublisher("中央编译出版社");
        book3.setPublish_date("2025-4");
        book3.setCategory("历史");
        book3.setStock_quantity(2);
        book3.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s35141494.jpg");
        bookArrayList.add(book3);

        Book book4 = new Book();
        book4.setBook_id("9787522832753");
        book4.setBook_url("https://book.douban.com/subject/37275454/");
        book4.setTitle("日本社会的历史");
        book4.setAuthor("网野善彦");
        book4.setPublisher("社会科学文献出版社");
        book4.setPublish_date("2025-4");
        book4.setCategory("历史");
        book4.setStock_quantity(3);
        book4.setBook_img_url("https://img2.doubanio.com/view/subject/s/public/s35112261.jpg");
        bookArrayList.add(book4);

        application.setAttribute( "bookArrayList", bookArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {ServletContextListener.super.contextDestroyed(sce);}
}
