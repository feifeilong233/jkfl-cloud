package cloud.jkfl.rbac.controller;


import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.pojo.Teacher;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.RootInfoServiceImpl;
import cloud.jkfl.rbac.service.Impl.TeacherServiceImpl;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/back")
public class TeacherController {

    @Autowired
    private TeacherServiceImpl teacherService;

    @Autowired
    private LogServiceImpl logService;

    @Autowired
    private RootInfoServiceImpl rootInfoService;

    @PostMapping("/findTea")
    public R FindTea(@RequestHeader("Authorization") String token){

        R rootByToken = rootInfoService.findRootByToken(token);

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_TEACHERLIST);
        logService.save(log);

        List<Teacher> list = teacherService.list(null);

        return R.ok().data("list",list);
    }

    @PostMapping("/selectTeaList")
    public R SelectTeaList(@RequestHeader("Authorization") String token,
                           @RequestBody String data
                           ){
        //System.out.println(data);
        JSONObject jsonObject = JSONObject.parseObject(data);
        Object data1 = jsonObject.get("data");
        Map<String,List<String>> map = JSONObject.parseObject(data1.toString(), Map.class);
        //System.out.println(map.get("江南大学"));

        List<Teacher> selectTea = teacherService.getSelectTea(map);
        //System.out.println(selectTea);

        return R.ok().data("list",selectTea);
    }


}
