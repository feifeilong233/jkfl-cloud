package cloud.jkfl.video.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;

@Configuration
public class WebMvcConfig extends WebMvcConfigurationSupport {

    /**
     * 添加静态资源映射路径，css、js等都放在classpath下的static中
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        /**
         * addResourceHandler 指的是对外暴露的访问路径
         * addResourceLocations 指的是文件配置的目录
         */

        //文件上传路径映射
        registry.addResourceHandler("/jkfl-cloud/data/upload/**")
                .addResourceLocations("file:F:/Projection/jkfl-cloud/data/upload/");

        super.addResourceHandlers(registry);
    }
}
