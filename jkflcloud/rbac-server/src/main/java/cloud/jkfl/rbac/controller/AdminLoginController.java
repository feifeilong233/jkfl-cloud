package cloud.jkfl.rbac.controller;


import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.LoginServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/back")
public class AdminLoginController {

    @Autowired
    private LoginServiceImpl loginService;

    @Autowired
    private LogServiceImpl logService;

    @ApiModelProperty(value = "管理员后端登录")
    @PostMapping("/authentication")
    public R BackLogin(@RequestParam("tel") String tel,
                       @RequestParam("pwd") String pwd){
        System.out.println("Tel: "+tel+"   pwd:  "+pwd);

        if (tel==null || pwd==null)
            return R.error().message("参数不合法");

        Long _tel = Long.parseLong(tel);
        R result = loginService.getLogin(_tel, pwd);

        Log log = new Log();
        log.setMsg(LogInfoMsg.LOGIN_MSG);
        logService.save(log);

        return result;
    }

}
