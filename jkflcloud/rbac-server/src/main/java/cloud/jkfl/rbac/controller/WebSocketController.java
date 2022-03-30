package cloud.jkfl.rbac.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.server.WebSocketServer;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@Slf4j
@RestController
@RequestMapping("/back/webSocketCtrl")
public class WebSocketController {


    @RequestMapping(value = "/pushMessageToWeb", method = RequestMethod.POST, consumes = "application/json")
    public R pushMessageToWeb(@RequestBody String message) {
        try {
            WebSocketServer.sendInfo("有新内容：" + message);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.ok().message(message);
    }

}
