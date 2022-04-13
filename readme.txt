# jkfl-cloud

 基于教考分离的虚拟学习教育平台
  项目源代码主文件夹

## 项目结构

- exam-vue-electron	---学生端前端项目
- frontend	---React系前端Web项目
  - exam-teacher	---教师端前端项目
  - jkfl-home	---系统门户网站
  - manage-react	---后台管理员端前端项目
- jkflcloud	---整个项目的后端
	- client-server： 客户端微服务，处理学生端的操作请求
	- config-server： 发现中心，配置类，负责包管理以及部署工具类、处理器等
	- eureka-server： 注册中心，负责监控微服务状态
	- exam-server： 考试微服务，对应教师端后端系统，提供教师的各类操作
	- rbac-server： 后端管理系统，面向系统管理人员，提供鉴权，人员管理，系统监控等操作
	- teach-server： 教育模块，尚未适配
	- user-server： 用户微服务，提供各类用户的基本操作。
- sql	---数据库及备份文件

具体项目的具体功能及文件结构请进入具体文件夹下查看，每一个子文件夹下都具有配套的readme.txt文件，此文档仅阐述项目主要文件结构
