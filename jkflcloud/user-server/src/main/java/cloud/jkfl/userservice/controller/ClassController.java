package cloud.jkfl.userservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.Class;
import cloud.jkfl.userservice.pojo.Teacher;
import cloud.jkfl.userservice.pojo.User;
import cloud.jkfl.userservice.pojo.vo.StudentListQuery;
import cloud.jkfl.userservice.service.impl.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/class")
public class ClassController {


    @Autowired
    private ClassServiceImpl classService;


    @Autowired
    private LoginServiceImpl loginService;


    @Autowired
    private TeacherServiceImpl teacherService;


    @Autowired
    private UserServiceImpl studentService;

    @ApiModelProperty(value = "添加班级")
    @PostMapping("/add")
    public R add(@RequestParam("name")String name){
        Class c = new Class();
        c.setClassName(name);
        boolean save = classService.save(c);
        if (save)
            return R.ok().message("保存成功");
        else
            return R.ok().message("保存失败");
    }


    @ApiModelProperty(value = "通过老师id找到对应的所有学生")
    @PostMapping("/findStuListWithTea")
    public R findStuListWithTea(@RequestHeader("Authorization")String token){

        Long aLong = loginService.checkToken(token);

        Teacher teacher = teacherService.getById(aLong);
        if (teacher==null)
            return R.error().message("登录信息丢失");
        List<StudentListQuery> list = new LinkedList<>();
        Long classId = teacher.getClassId();

        Class byId = classService.getById(classId);

        String className = byId.getClassName();

        List<User> st = studentService.getListWithClassId(classId);

        for(User item : st){
            StudentListQuery s = new StudentListQuery();
            //s.setId(item.getUserId());
            s.setUserName(item.getUserUsername());
            s.setClassName(className);
            s.setPid(item.getUserPid());
            s.setTel(item.getUserPhone());
            s.setEmail(item.getUserEmail());
            s.setStuName(item.getUserNickname());
            list.add(s);
        }

        return R.ok().data("data",list);

    }


    @ApiModelProperty(value = "查询该老师对应的所有学生列表")
    @PostMapping("/getDataList")
    public R getDataList(@RequestHeader("Authorization")String token,
                         @RequestParam("type") String type,
                         @RequestParam("value") String value){
        Long tokenId = loginService.checkToken(token);
        Teacher teacher = teacherService.getById(tokenId);
        if (teacher==null)
            return R.error().message("登录信息丢失");
        List<StudentListQuery> list = new LinkedList<>();
        Long classId = teacher.getClassId();
        Class byId = classService.getById(classId);
        String className = byId.getClassName();

        if (type.equals("stuName")){
            List<User> st = studentService.getListWithName(value);
            for(User item : st){
                StudentListQuery s = new StudentListQuery();
                //s.setId(item.getUserId());
                s.setUserName(item.getUserUsername());
                s.setClassName(className);
                s.setPid(item.getUserPid());
                s.setTel(item.getUserPhone());
                s.setEmail(item.getUserEmail());
                s.setStuName(item.getUserNickname());
                list.add(s);
            }
            return R.ok().data("data",list);
        }

        if (type.equals("pid")){

            try{
                Long tmp = Long.parseLong(value);
            }catch (Exception e){
                return R.error().message("数据错误");
            }

            List<User> st = studentService.getListWithPid(Long.parseLong(value));
            for(User item : st){
                StudentListQuery s = new StudentListQuery();
                //s.setId(item.getUserId());
                s.setUserName(item.getUserUsername());
                s.setClassName(className);
                s.setPid(item.getUserPid());
                s.setTel(item.getUserPhone());
                s.setEmail(item.getUserEmail());
                s.setStuName(item.getUserNickname());
                list.add(s);
            }
            return R.ok().data("data",list);
        }

        return R.error().message("数据拉取失败");
    }


    @ApiModelProperty(value = "得到班级列表")
    @PostMapping("/getClassList")
    public R getClassList(@RequestHeader("Authorization")String token){
        Long tokenId = loginService.checkToken(token);
        Teacher teacher = teacherService.getById(tokenId);
        if (teacher==null)
            return R.error().message("登录信息丢失");

        List<Class> list = classService.list(null);
        return R.ok().data("data",list);
    }


    @ApiModelProperty(value = "通过OpenFeign向外暴露查询班级列表")
    @RequestMapping(value = "/feignClass",method = RequestMethod.GET)
    public Map<Long,String> feignClass(){
        List<Class> list = classService.list(null);
        Map<Long,String> map = new HashMap<>();
        for (Class s : list){
            map.put(s.getClassId(),s.getClassName());
        }
        return map;
    }


    @ApiModelProperty(value = "通过Tea的id得到所教班级 班级id+班级名称")
    @RequestMapping(value = "/feginClassWithTea",method = RequestMethod.GET)
    public Map<Long, String> feginClassWithTea(@RequestParam("id") String id){
        Long _id = Long.parseLong(id);
        Teacher byId = teacherService.getById(_id);
        Long classId = byId.getClassId();
        Class clazz = classService.getById(classId);
        Map<Long, String> map = new HashMap<>();
        map.put(classId, clazz.getClassName());
        return map;
    }


    @ApiModelProperty(value = "将学生添加到自己班级")
    @PostMapping("/addStu")
    public R addClass(@RequestHeader("Authorization")String token,
                      @RequestParam("value") String value,
                      @RequestParam("text") String text){
        Long tokenId = loginService.checkToken(token);
        Teacher teacher = teacherService.getById(tokenId);
        if (teacher==null)
            return R.error().message("登录信息丢失");

        User student = studentService.getStuByName(text);
        if (student==null)
            return R.ok().message("None");

        if (student.getClassId()==null){
            Long class_id = classService.getClassIdByName(value);
            student.setClassId(class_id);
            boolean b = studentService.updateById(student);
            if (b)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else{
            return R.ok().message("Have");
        }

    }
}
