package cloud.jkfl.rbac.controller;

import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.server.WebSocketServer;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequestMapping("/back")
public class AdminUserInfoController {

    @Autowired
    private RootInfoServiceImpl rootInfoService;

    @Autowired
    private LogServiceImpl logService;

    @PostMapping("/currentRoot")
    @ApiModelProperty(value = "当前admin用户信息查询")
    public R AdminCurrentRootInfo(@RequestHeader("Authorization") String token) throws IOException {

        R rootByToken = rootInfoService.findRootByToken(token);

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_USERINFO);
        logService.save(log);

        WebSocketServer.sendInfo(LogInfoMsg.SEARCH_USERINFO);

        return rootByToken;
    }

}
