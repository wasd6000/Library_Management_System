![image](https://github.com/user-attachments/assets/155133c5-57d8-45ae-87a8-0a7681fe7e60)##项目结构
图书类 (Book)
对象元素：
图书编号 (book_id)：唯一标识，主键
图书名称 (title)：图书的名称
作者 (author)：图书的作者
出版社 (publisher)：图书的出版社
出版日期 (publish_date)：图书的出版时间
分类 (category)：图书所属的分类
摘要 (abstract)：图书的简要介绍
状态 (status)：表示图书是否可借（可借/已借出/维护中等）
库存数量 (stock_quantity)：图书的库存数量
![image](https://github.com/user-attachments/assets/b8b48ced-eafd-436f-b557-213a87b1e9ea)

用户类 (User)
对象元素：
用户编号 (user_id)：唯一标识，主键
用户名 (username)：用户的登录名
密码 (password)：用户的密码（加密存储）
姓名 (name)：用户的真实姓名
邮箱 (email)：用户的电子邮箱
电话 (phone)：用户的联系电话
用户类型 (user_type)：区分普通用户和管理员用户（普通用户/管理员）
![image](https://github.com/user-attachments/assets/671206aa-aa04-4762-b3f0-634befd87f3c)
