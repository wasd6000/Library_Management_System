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
![image](https://github.com/user-attachments/assets/ef1cc04f-d70c-46d7-808e-e04b3c915619)


### 借阅记录类 (BorrowRecord)
借阅记录编号 (record_id)：唯一标识，主键
图书编号 (book_id)：外键，关联图书
用户编号 (user_id)：外键，关联用户
借阅日期 (borrow_date)：记录借阅的时间
应还日期 (due_date)：根据借阅规则计算得出
实际归还日期 (return_date)：记录实际归还时间（为空表示未归还）
是否超期 (is_overdue)：判断借阅是否超期
![image](https://github.com/user-attachments/assets/2084578f-917c-4659-99b8-77742a85c09c)

## 一、用户
  a.用户登录界面(login.jsp和DoLoginServlet.java),路由地址取"/DoLoginServlet"
  
  b.实现用户登录,点击登录,通过查询application的userArrayList实现用户登录,查询当前登录的用户权限(user_type)判断是否为管理员,如果是管理员跳转到"/HomeRoot",如果不是跳转到"/Home"
  
  c.实现用户注册,点击注册,跳转到注册界面(路由取"/DoSignUpServlet",文件取"DoSignUpServlet.java",前端取"signup.jsp"),判断username是否被注册(已经被注册的账号显示注册失败,未被注册的注册成功),注册完成后跳转会login.jsp界面,注册成功的账号保存到application中的userArrayList中
  
  d.实现用户管理,通过表格展示(文件取"showAlluser.jsp"),数据为application中的userArrayList,实现删除(路由取"/DeleteUser",文件取"DeleteUser.java")和修改(路由取"/UpUser",文件取"UpUser.java")
## 二、图书
  a.实现主页(路由为"/Home"和"/HomeRoot",文件为"home.jsp"和"homeroot.jsp"),主页显示application中的bookArrayList存储的信息。homeroot.jsp格外多出用户管理和书籍管理按钮,按钮跳转分别为(用户管理"showAlluser.jsp",书籍管理"showAllbook.jsp")
  
  b.实现书籍管理,通过表格展示(文件取"showAllbook.jsp"),数据为application中的bookArrayList,实现删除(路由取"/DeleteBook",文件取"DeleteBook.java")和修改(路由取"/UpBook",文件取"UpBook.java")
  
  c.实现书籍添加,在"home.jsp"和"homeroot.jsp"中添加书籍添加按钮,跳转到路由"/DoAddBook"界面为"DoAddBook.jsp",设置表单(书籍id,书名,作者,出版社,出版时间,类别,数量),添加到application中的bookArrayList
## 三、借阅记录
  a.实现借阅,在"home.jsp"和"homeroot.jsp"中添加借阅按钮,跳转到借阅路由"/DoAddBorrow"界面"borrow.jsp",设置表单(借阅id,书籍id,用户id,借阅时间,应还日期,实际归还日期,是否超期),实际归还日期和是否超期为NULL,将提交的信息存储到application中的borrowRecordArrayList中,当书籍数量为0时无法借阅,借阅成功书籍数量减一
  
  b.实现书籍归还,在"home.jsp"和"homeroot.jsp"中添加归还按钮,跳转到路由"/DueBook"界面为"duebook.jsp",用表格显示application中borrowRecordArrayList中user_id与当前用户id相同的信息,点击归还按钮,将实际归还日期更新为当前日期,更新是否超期,并保存更新到application中的borrowRecordArrayList中
  
  c.实现借阅记录展示,在"homeroot.jsp"中添加借阅展示按钮,跳转到"showAllBorrow.jsp",用表格展示所有借阅记录

