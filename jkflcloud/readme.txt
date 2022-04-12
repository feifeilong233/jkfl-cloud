主项目名称jkflcloud，是基于教考分离理念的考试学习系统
技术选型使用微服务技术

此文档只阐述各服务文件夹含义，查看具体服务的具体函数功能请进入具体文件夹下查看
【如：进入exam-server文件夹查看readme.txt了解exam-server各文件夹的具体承担任务】

client-server： 客户端微服务，处理学生端的操作请求

config-server： 发现中心，配置类，负责包管理以及部署工具类、处理器等

eureka-server： 注册中心，负责监控微服务状态

exam-server： 考试微服务，对应教师端后端系统，提供教师的各类操作

rbac-server： 后端管理系统，面向系统管理人员，提供鉴权，人员管理，系统监控等操作

teach-server： 教育模块，尚未适配。

user-server： 用户微服务，提供各类用户的基本操作。