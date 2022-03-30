package cloud.jkfl.rbac.controller;

import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/back")
public class SwaggerController {

    @Autowired
    private LogServiceImpl logService;

    @Autowired
    private RootInfoServiceImpl rootInfoService;

    @ApiModelProperty(value = "Swagger文档查询")
    @PostMapping("/swagger")
    public R Swagger(@RequestHeader("Authorization") String token){
        R rootByToken = rootInfoService.findRootByToken(token);

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_SWAGGER);
        logService.save(log);


        return R.ok().message("swagger查询成功！");


    }



}
