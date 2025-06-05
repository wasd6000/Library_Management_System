package org.listerner;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.library_management_system.JavaBeans.User;

import java.util.ArrayList;

@WebListener
public class DataInitUser implements ServletContextListener {
    public void contextInitialized(jakarta.servlet.ServletContextEvent sce) {
        System.out.println("------------------初始化用户------------------");
        ServletContext application = sce.getServletContext();
        ArrayList<User> userArrayList = new ArrayList<User>();
        User user1 = new User();
        user1.setUser_id("00001");
        user1.setUsername("admin");
        user1.setPassword("123456");
        user1.setName("普通用户1");
        user1.setEmail("00001@qq.com");
        user1.setPhone("12345678901");
        user1.setUser_type("0");//普通用户
        userArrayList.add(user1);

        User user2 = new User();
        user2.setUser_id("00002");
        user2.setUsername("root");
        user2.setPassword("root");
        user2.setName("管理员1");
        user2.setEmail("00002@163.com");
        user2.setPhone("12345678910");
        user2.setUser_type("1");//管理员
        userArrayList.add(user2);

        User user3 = new User();
        user3.setUser_id("00003");
        user3.setUsername("test");
        user3.setPassword("123");
        user3.setName("普通用户1");
        user3.setEmail("123@126.com");
        user3.setPhone("01234567891");
        user3.setUser_type("0");//普通用户
        userArrayList.add(user3);

        User user4 = new User();
        user4.setUser_id("00004");
        user4.setUsername("wasd6000");
        user4.setPassword("123456");
        user4.setName("管理员2");
        user4.setEmail("wasd6000@126.com");
        user4.setPhone("12345612345");
        user4.setUser_type("1");//管理员
        userArrayList.add(user4);

        application.setAttribute( "userArrayList", userArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {ServletContextListener.super.contextDestroyed(sce);}
}
