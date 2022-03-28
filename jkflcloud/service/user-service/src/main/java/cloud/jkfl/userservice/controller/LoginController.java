package cloud.jkfl.userservice.controller;


import cloud.jkfl.commonutils.R;
import cloud.jkfl.userservice.pojo.Student;
import cloud.jkfl.userservice.service.StudentService;
import cloud.jkfl.userservice.service.impl.LoginServiceImpl;
import cloud.jkfl.userservice.service.impl.StudentServiceImpl;
import cloud.jkfl.userservice.service.impl.TeacherServiceImpl;
import com.netflix.discovery.converters.Auto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/usr")
public class LoginController {

    @Autowired
    private StudentServiceImpl studentService;

    @Autowired
    private TeacherServiceImpl teacherService;

    @Autowired
    private LoginServiceImpl loginService;

    @PostMapping("/login")
    @CrossOrigin
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

    @RequestMapping(value = "/token", method = RequestMethod.GET)
    public boolean token(@RequestParam("token") String token,
                         @RequestParam("type") String _type){
        Integer type = Integer.parseInt(_type);
        return loginService.userWithToken(token,type);
    }


}
