本项目采用Tomcat 10.0.23本地部署

本项目结合课程不采用SQL数据库存储数据，用Servlet 上下文（application）存储数据

## 项目结构
### 图书类 (Book)
图书编号 (book_id)：唯一标识，主键
图书名称 (title)：图书的名称
作者 (author)：图书的作者
出版社 (publisher)：图书的出版社
出版日期 (publish_date)：图书的出版时间
分类 (category)：图书所属的分类
库存数量 (stock_quantity)：图书的库存数量
![image](https://github.com/user-attachments/assets/1b25b46e-492a-44ff-a404-86e0ce951c58)


### 用户类 (User)
用户编号 (user_id)：唯一标识，主键
用户名 (username)：用户的登录名
密码 (password)：用户的密码（加密存储）
姓名 (name)：用户的真实姓名
邮箱 (email)：用户的电子邮箱
电话 (phone)：用户的联系电话
用户类型 (user_type)：区分普通用户和管理员用户（普通用户/管理员）
![image   图像](https://github.com/user-attachments/assets/671206aa-aa04-4762-b3f0-634befd87f3c)

### 借阅记录类 (BorrowRecord)
借阅记录编号 (record_id)：唯一标识，主键
图书编号 (book_id)：外键，关联图书
用户编号 (user_id)：外键，关联用户
借阅日期 (borrow_date)：记录借阅的时间
应还日期 (due_date)：根据借阅规则计算得出
实际归还日期 (return_date)：记录实际归还时间（为空表示未归还）
是否超期 (is_overdue)：判断借阅是否超期
![image](https://github.com/user-attachments/assets/cbd23e60-e32c-4e79-9b81-36cfaeb1e118)
