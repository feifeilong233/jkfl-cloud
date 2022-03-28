package cloud.jkfl.rbac.controller;

import cloud.jkfl.commonutils.LogInfoMsg;
import cloud.jkfl.commonutils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import cloud.jkfl.rbac.service.Impl.ScrewServiceImpl;
import cn.smallbun.screw.core.Configuration;
import cn.smallbun.screw.core.engine.EngineConfig;
import cn.smallbun.screw.core.engine.EngineFileType;
import cn.smallbun.screw.core.engine.EngineTemplateType;
import cn.smallbun.screw.core.execute.DocumentationExecute;
import cn.smallbun.screw.core.process.ProcessConfig;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.context.ApplicationContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@RequestMapping("/back")
@RestController
public class DataBaseController {

    @Autowired
    private ScrewServiceImpl screwService;

    @Autowired
    private RootInfoServiceImpl rootInfoService;

    @Autowired
    private LogServiceImpl logService;

    @ApiModelProperty(value = "数据库文档")
    @PostMapping("/database")
    public R DataBase(@RequestHeader("Authorization") String token){

        R rootByToken = rootInfoService.findRootByToken(token);

        boolean contextLoads = screwService.contextLoads();
        if (contextLoads) {

            Log log = new Log();
            log.setMsg(LogInfoMsg.SEARCH_DATABASE);
            logService.save(log);

            return R.ok().data("msg", contextLoads);
        }
        return R.ok().data("msg","查询失败");
    }

}
