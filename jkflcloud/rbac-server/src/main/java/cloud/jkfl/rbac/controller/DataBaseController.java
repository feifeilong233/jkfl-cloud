package cloud.jkfl.rbac.controller;
;
import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import cloud.jkfl.rbac.service.Impl.ScrewServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
