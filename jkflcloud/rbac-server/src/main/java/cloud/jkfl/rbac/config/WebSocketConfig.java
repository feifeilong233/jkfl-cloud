package cloud.jkfl.rbac.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * 打印日志 建立长连接
 */
@Slf4j
@Component
public class WebSocketConfig {

    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        log.info("启动 WebSocket ...");
        return new ServerEndpointExporter();
    }

}
