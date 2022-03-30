package cloud.jkfl.rbac.controller;

import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.pojo.User;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import cloud.jkfl.rbac.service.Impl.StudentServiceImpl;
import cloud.jkfl.rbac.service.Impl.UserServiceImpl;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/back")
public class StudentController {


    @Autowired
    private UserServiceImpl studentService;


    @Autowired
    private RootInfoServiceImpl rootInfoService;


    @Autowired
    private LogServiceImpl logService;


    @PostMapping("/findStu")
    public R FindStu(@RequestHeader("Authorization") String token){

        R rootByToken = rootInfoService.findRootByToken(token);

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_STUDENTLIST);
        logService.save(log);

        List<User> list = studentService.list(null);

        return R.ok().data("list",list);
    }


    @PostMapping("/selectStuList")
    public R SelectTeaList(@RequestHeader("Authorization") String token,
                           @RequestBody String data
    ){
        JSONObject jsonObject = JSONObject.parseObject(data);
        Object data1 = jsonObject.get("data");
        Map<String,List<String>> map = JSONObject.parseObject(data1.toString(), Map.class);
        List<User> selectTea = studentService.getSelectStu(map);
        return R.ok().data("list",selectTea);
    }


}
