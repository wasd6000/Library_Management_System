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
        User user = new User();
        user.setUser_id("00001");
        user.setUsername("admin");
        user.setPassword("123456");
        user.setName("普通用户1");
        user.setEmail("00001@qq.com");
        user.setPhone("12345678901");
        user.setUser_type("0");//普通用户
        userArrayList.add(user);

        user.setUser_id("00002");
        user.setUsername("root");
        user.setPassword("root");
        user.setName("管理员1");
        user.setEmail("00002@163.com");
        user.setPhone("12345678910");
        user.setUser_type("1");//管理员
        userArrayList.add(user);

        user.setUser_id("00003");
        user.setUsername("test");
        user.setPassword("123");
        user.setName("普通用户1");
        user.setEmail("123@126.com");
        user.setPhone("01234567891");
        user.setUser_type("0");//普通用户
        userArrayList.add(user);

        user.setUser_id("00004");
        user.setUsername("wasd6000");
        user.setPassword("123456");
        user.setName("管理员2");
        user.setEmail("wasd6000@126.com");
        user.setPhone("12345612345");
        user.setUser_type("1");//管理员
        userArrayList.add(user);

        application.setAttribute( "userArrayList", userArrayList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {ServletContextListener.super.contextDestroyed(sce);}
}
