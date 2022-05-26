config-server为配置中心

/src/main/java/cloud/jkfl/common

    config中存放各类插件和依赖项配置
     - Swagger2Config 存放Swagger接口文档配置

    handler存放处理器
     - GlobalException 全局异常
     - GlobalExceptionHandler 全局异常处理器
     - MyBatisPlusHandler mybatis-plus元数据处理器

    utils存放各种工具类
     - EmailUtils 随机生成邮箱工具
     - IdUtils 随机生成省份证号工具
     - JWTUtils token令牌工具
     - LoginInfoMsg 登陆信息工具
     - NickNameUtils 随机姓名生成器工具
     - R Http请求返回类型
     - RestCode 返回码
     - TelUtils 随机电话号码生成器工具