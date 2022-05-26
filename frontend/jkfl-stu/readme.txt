exam-vue-electron 是基于 Vue 搭建的学生端项目

- docs 项目文档

- public 执行 build 后的输出文件结构

- src 存放工程文件
	- api 使用axios与后端通信的配置
	- assets 存放使用到的图标、图片
	- components 主要页面可组件、脚本
	- config 基本配置
		- defaultSetting 网页整体样式配置
		- router.config 路由配置
	- core 加载使用到的依赖库、依赖
		- directives vue自定义指令
		- lazy_lib 按需加载库包
	- layouts 学生端网页基本框架组件
	- plugins 加载使用到的插件
	- router 配置路由
	- store vuex仓库配置
	- utils 封装的一般函数方法
	- views 学生端页面功能组件
		- account 用户信息功能组件
		- examTools 考试工具组件
		- exception 前端路由错误显示路由(403, 404, 500)
		- highlighter 网页选中高亮功能组件
		- home 登录注册页面组件
		- list 考试相关功能组件
		- monitor 监考功能组件
		- test 待完善部分
		- user 登录主页功能组件
- tests jest测试配置