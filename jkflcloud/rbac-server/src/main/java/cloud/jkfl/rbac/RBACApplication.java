package cloud.jkfl.rbac;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@Slf4j
@SpringBootApplication
@ComponentScan(basePackages = {"cloud.jkfl"})
public class RBACApplication {
    public static void main(String[] args) {
        SpringApplication.run(RBACApplication.class,args);

        log.info("swagger url:  http://localhost:8000/swagger-ui.html");
    }
}
