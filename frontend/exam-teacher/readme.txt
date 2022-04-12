exam-teacher是基于React搭建的教师端项目

其中data文件夹是早期测试的mock假数据

dist是编译后的打包文件

src存放工程文件：
 - action redux操作的具体行为定义
 - assets 静态资源文件
 - components 分离出来的可复用组件
 - constants 是分离出来可以复用的变量
 - containers 路由对应的页面：
    - login 存放登陆页面
        -axios login登陆所需要的axios请求配置
    - main 存放登陆后具体功能页面
        - header_bar 顶部栏
        - homepage 主页
            - fast_enter_card 分离组件：快捷跳转卡片
        - p_manage 试题管理
            - subpage 分离组件： 可选择卡片
        - paper_manage 试卷管理
            - subpage 分离组件： 阅卷
        - personal_center 个人中心页面
        - q_checkin 对应具体题目的操作页面
            - subpage 分离组件： 6中题型的插入卡片
        - score_search 得分查询
        - student_manage 学生查询
 - lib 工具类依赖文件夹
 - reducers 存放redux
 - store 数据仓库，redux配套服务