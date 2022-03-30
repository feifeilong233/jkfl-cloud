package cloud.jkfl.userservice.controller;


import cloud.jkfl.common.utils.R;

import cloud.jkfl.userservice.service.impl.LoginServiceImpl;
import cloud.jkfl.userservice.service.impl.StudentServiceImpl;
import cloud.jkfl.userservice.service.impl.TeacherServiceImpl;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
@RequestMapping("/usr")
public class LoginController {


    @Autowired
    private StudentServiceImpl studentService;


    @Autowired
    private TeacherServiceImpl teacherService;


    @Autowired
    private LoginServiceImpl loginService;


    @ApiModelProperty(value = "老师端登陆模块")
    @PostMapping("/login")
    public R Stu_Login(@RequestParam("tel")String _tel,
                       @RequestParam("pwd")String pwd,
                       @RequestParam("type") String _type
                       ){
        //System.out.println(_tel+"  pwd: "+pwd);
        Long tel = Long.parseLong(_tel);
        Integer type = Integer.parseInt(_type);

        R msg = null;
        if (type==1){
            msg =  studentService.getLogin(tel, pwd);
        }else if (type == 2){
           msg = teacherService.getLogin(tel, pwd);
        }
        return msg;
    }


    @ApiModelProperty(value = "通过OpenFeign暴露token检查方法")
    @RequestMapping(value = "/token", method = RequestMethod.GET)
    public boolean token(@RequestParam("token") String token,
                         @RequestParam("type") String _type){
        Integer type = Integer.parseInt(_type);
        return loginService.userWithToken(token,type);
    }


}
