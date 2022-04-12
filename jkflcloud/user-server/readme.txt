user-server服务

管理用户个人信息的微服务，其中包含学生，教师和管理人员。
是其余微服务的依赖服务，在部署时需要优先部署。

src/main/java/cloud/jkfl/userservice

    其中controller层中：
     -AdminController 管理员控制类
     -ClassController 教学班控制类
     -LoginController 验证token的控制类
     -StudentController 学生控制类
     -TeacherController 教师控制类

    其中mapper层中存储数据库映射文件：
     -AdminMapper 管理员映射
     -ClassMapper 班级映射
     -StudentMapper 学生映射
     -TeacherMapper 教师映射
     -UserMapper 用户角色映射，先用于考试客户端，配合Student使用

    其中pojo为实体类，对于数据库中具体的表：
     - Admin 管理员，对应admin表
     - Class 班级，对应class表
     - Student 学生，对应student表
     - Teacher 教师，对应teacher表
     - User 用户，对应user表，配合student表使用

    pojo中vo包是执行查询操作时对pojo实体类进行的二次封装：
     - AdminQuery 管理查询
     - ReadVo 用户信息查询封装
     - StudentListQuery 学生列表查询封装
     - TeacherQuery 教师查询封装

    service是具体的逻辑业务层，是连接mapper层和controller层的桥梁，同时处理复杂的业务需求，
    service包中impl包是service接口中的实现函数，这里一起介绍：
     - AdminServiceImpl 处理管理员业务
     - ClassServiceImpl 处理班级业务
     - LoginServiceImpl 处理token相关业务
     - StudentServiceImpl 处理学生业务
     - TeacherServiceImpl 处理教师业务
     - UserServiceImpl 处理用户业务，配合student使用

    最后主文件夹下UserServiceApplication为启动类


/src/main/resource/application.yaml中存储配置文件