rbac-server服务

rbac为鉴权和后台管理系统，为系统管理员服务，提供所有人员，数据操作处理，同时可以监控微服务运行状态。

/src/main/java/cloud/jkfl/rbac

    config包中保存websocket长连接配置：
     - WebSocketConfig 长连接配置

    controller层是视图控制层；
     - AdminLoginController 管理控制层
     - AdminUserInfoController 管理员信息控制层
     - DataBaseController 数据库查询控制层
     - InterfaceController 接口查询控制层
     - LogController 日志查询控制层
     - StudentController 学生管理控制层
     - SwaggerController Swagger文档接口控制层
     - SysOptController 组织管理控制层
     - TeacherController 教师管理控制层
     - WebSocketController 长连接控制层

    mapper层是数据库映射层，存放查询语句的映射接口文件；
     - LogMapper 日志映射
     - RootMapper 管理用户映射
     - StudentMapper 学生管理映射
     - SysAcademyMapper 学术管理映射
     - SysSchoolMapper 学校管理映射
     - TeacherMapper 教师管理映射
     - UserMapper 用户管理映射

    pojo是对应数据库的具体实体类：
     - Academy 学术，对应academy
     - Log 日志，对应log
     - Root 管理员，对应root
     - School 学校，对应school
     - Student 学生，对应student
     - Teacher 教师，对应teacher
     - User 用户，对应user

    pojo包下的vo包中存放具体的查询实体类：
     - SysOptChildVo 树状表查询
     - SysOptVo 系统查询映射

    server中存放长连接服务器；
     - WebSocketServer socket服务器

    service和service包中impl包存放具体的逻辑业务员，
    由于其一一对应的关系，这里只介绍impl中的函数；
     - LoginServiceImpl 登录业务
     - LogServiceImpl 日志业务
     - RootInfoServiceImpl 管理员信息业务
     - ScrewServiewImpl 扳手，数据库处理工具
     - StudentServiceImpl 学生管理业务
     - SysOptServiceImpl 组织管理业务
     - TeacherServiceImpl 教师管理业务
     - UserServiceImpl 用户管理业务

    其中主文件夹下RBACApplication为启动类

/src/main/resources下application.yaml为配置文件