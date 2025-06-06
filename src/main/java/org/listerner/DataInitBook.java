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

        Book book5 = new Book();
        book5.setBook_id("9787572623509");
        book5.setBook_url("https://book.douban.com/subject/37289742/");
        book5.setTitle("罪与罚");
        book5.setAuthor("[俄]费奥多尔·陀思妥耶夫斯基");
        book5.setPublisher("湖南文艺出版社");
        book5.setPublish_date("2025-5");
        book5.setCategory("经典");
        book5.setStock_quantity(3);
        book5.setBook_img_url("https://img3.doubanio.com/view/subject/s/public/s35113953.jpg");
        bookArrayList.add(book5);

        Book book6 = new Book();
        book6.setBook_id("9787559880154");
        book6.setBook_url("https://book.douban.com/subject/37310455/");
        book6.setTitle("还可以的金女士");
        book6.setAuthor("金子");
        book6.setPublisher("广西师范大学出版社");
        book6.setPublish_date("2025-4");
        book6.setCategory("小说");
        book6.setStock_quantity(3);
        book6.setBook_img_url("https://img1.doubanio.com/view/subject/s/public/s35133749.jpg");
        bookArrayList.add(book6);

        Book book7 = new Book();
        book7.setBook_id("9787521774320");
        book7.setBook_url("https://book.douban.com/subject/37269363/");
        book7.setTitle("哲学家的最后一课");
        book7.setAuthor("朱锐");
        book7.setPublisher("中信出版社");
        book7.setPublish_date("2025-3");
        book7.setCategory("哲学");
        book7.setStock_quantity(6);
        book7.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s35124195.jpg");
        bookArrayList.add(book7);

        Book book8 = new Book();
        book8.setBook_id("9787522536149");
        book8.setBook_url("https://book.douban.com/subject/37235059/");
        book8.setTitle("怪物之乡");
        book8.setAuthor("邱常婷");
        book8.setPublisher("九州出版社");
        book8.setPublish_date("2025-5");
        book8.setCategory("小说");
        book8.setStock_quantity(4);
        book8.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s35120245.jpg");
        bookArrayList.add(book8);

        Book book9 = new Book();
        book9.setBook_id("9787521758399");
        book9.setBook_url("https://book.douban.com/subject/36518892/");
        book9.setTitle("埃隆·马斯克传");
        book9.setAuthor("[美]沃尔特·艾萨克森");
        book9.setPublisher("中信出版社");
        book9.setPublish_date("2023-9-12");
        book9.setCategory("传记");
        book9.setStock_quantity(2);
        book9.setBook_img_url("https://img1.doubanio.com/view/subject/s/public/s34654248.jpg");
        bookArrayList.add(book9);

        Book book10 = new Book();
        book10.setBook_id("9787541161834");
        book10.setBook_url("https://book.douban.com/subject/35726467/");
        book10.setTitle("盗墓笔记 1");
        book10.setAuthor("南派三叔");
        book10.setPublisher("四川文艺出版社");
        book10.setPublish_date("2022-4");
        book10.setCategory("小说");
        book10.setStock_quantity(3);
        book10.setBook_img_url("https://img1.doubanio.com/view/subject/s/public/s34263440.jpg");
        bookArrayList.add(book10);

        Book book11 = new Book();
        book11.setBook_id("9787521768770");
        book11.setBook_url("https://book.douban.com/subject/37212965/");
        book11.setTitle("源代码");
        book11.setAuthor(" [美] 比尔·盖茨");
        book11.setPublisher("中信出版社");
        book11.setPublish_date("2025-1");
        book11.setCategory("自传");
        book11.setStock_quantity(5);
        book11.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s35075224.jpg");
        bookArrayList.add(book11);

        Book book12 = new Book();
        book12.setBook_id("9787115618085");
        book12.setBook_url("https://book.douban.com/subject/36449803/");
        book12.setTitle("这就是ChatGPT");
        book12.setAuthor("[美] 斯蒂芬·沃尔弗拉姆（Stephen Wolfram）");
        book12.setPublisher("人民邮电出版社");
        book12.setPublish_date("2023-7");
        book12.setCategory("自传");
        book12.setStock_quantity(9);
        book12.setBook_img_url("https://img1.doubanio.com/view/subject/s/public/s34566250.jpg");
        bookArrayList.add(book12);

        Book book13 = new Book();
        book13.setBook_id("9787208113039");
        book13.setBook_url("https://book.douban.com/subject/21979017/");
        book13.setTitle("魔戒");
        book13.setAuthor("[英] J.R.R.托尔金");
        book13.setPublisher("上海人民出版社");
        book13.setPublish_date("2013-9");
        book13.setCategory("小说");
        book13.setStock_quantity(3);
        book13.setBook_img_url("https://img1.doubanio.com/view/subject/s/public/s27063429.jpg");
        bookArrayList.add(book13);

        Book book14 = new Book();
        book14.setBook_id("9787020096695");
        book14.setBook_url("https://book.douban.com/subject/24531956/");
        book14.setTitle("哈利·波特");
        book14.setAuthor("J.K.罗琳 (J.K.Rowling)");
        book14.setPublisher("人民文学出版社");
        book14.setPublish_date("2008-12-1");
        book14.setCategory("小说");
        book14.setStock_quantity(3);
        book14.setBook_img_url("https://img9.doubanio.com/view/subject/s/public/s29101586.jpg");
        bookArrayList.add(book14);

        application.setAttribute( "bookArrayList", bookArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {ServletContextListener.super.contextDestroyed(sce);}
}
