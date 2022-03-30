package cloud.jkfl.rbac.controller;

import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.server.WebSocketServer;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;


@RestController
@RequestMapping("/back")
public class LogController {

    @Autowired
    private RootInfoServiceImpl rootInfoService;

    @Autowired
    private LogServiceImpl logService;

    @ApiModelProperty(value = "查询所有日志")
    @PostMapping("/loginfo")
    public R LogInfo(@RequestHeader("Authorization") String token) throws IOException {
        R rootByToken = rootInfoService.findRootByToken(token);

        List<Log> allLog = logService.getAllLog();

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_LOG);
        logService.save(log);

        WebSocketServer.sendInfo(LogInfoMsg.SEARCH_LOG);

        return R.ok().data("log",allLog);
    }


    @ApiModelProperty(value = "日志逻辑删除")
    @PostMapping("/dellog")
    public R DelLog(@RequestHeader("Authorization") String token,
                    @RequestParam("id") String id){

        R rootByToken = rootInfoService.findRootByToken(token);

        Long _id = Long.parseLong(id);
        boolean remove = logService.removeById(_id);

        if (remove){
            Log log = new Log();
            log.setMsg(LogInfoMsg.DELETE_LOG_SUCCESS);
            logService.save(log);

            return R.ok().message("删除成功");

        }else{
            Log log = new Log();
            log.setMsg(LogInfoMsg.DELETE_LOG_FAIL);
            logService.save(log);

            return R.ok().message("删除失败");
        }

    }


}
