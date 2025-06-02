package org.listerner;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.library_management_system.JavaBeans.BorrowRecord;

import java.util.ArrayList;

@WebListener
public class DataInitBorrowRecord implements ServletContextListener {
    public void contextInitialized(jakarta.servlet.ServletContextEvent sce){
        System.out.println("------------------初始化借阅记录------------------");
        ServletContext application = sce.getServletContext();
        ArrayList<BorrowRecord> borrowRecordArrayList = new ArrayList<BorrowRecord>();
        application.setAttribute("borrowRecordArrayList",borrowRecordArrayList);
    }

    @Override
     public void contextDestroyed(ServletContextEvent sce) {
        ServletContextListener.super.contextDestroyed(sce);
    }
}
