package cloud.jkfl.userservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.Teacher;
import cloud.jkfl.userservice.pojo.vo.TeacherQuery;
import cloud.jkfl.userservice.service.TeacherService;
import cloud.jkfl.userservice.service.impl.LoginServiceImpl;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/tea")
public class TeacherController {


    @Autowired
    private LoginServiceImpl loginService;


    @Autowired
    private TeacherService teacherService;


    @ApiModelProperty(value = "通过老师token返回老师name")
    @RequestMapping(value = "/token", method = RequestMethod.GET)
    public String teacherWithToken(@RequestParam("token") String token){
        return teacherService.teacherNameWithToken(token);
    }


    @ApiModelProperty(value = "通过老师token返回老师id")
    @RequestMapping(value = "/tokenForId",  method = RequestMethod.GET)
    public Long TokenForId(@RequestParam("token") String token){
        return teacherService.teacherIdWithToken(token);

    }


    @ApiModelProperty(value = "返回所有老师列表")
    @GetMapping("list")
    public R getAllTeacher(){
        List<Teacher> list = teacherService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "逻辑删除指定id的老师")
    @DeleteMapping("del/{id}")
    public R delTeacherById(@PathVariable("id") Long id){
        boolean remove = teacherService.removeById(id);
        if (remove)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "分页查询所有老师列表")
    @GetMapping("getTeaPage/{current}/{limit}")
    public R getStudentByPage(@PathVariable("current") Long current,
                              @PathVariable("limit") Long limit){
        Page<Teacher> page = new Page<>(current,limit);
        teacherService.page(page, null);
        List<Teacher> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);

    }


    @ApiModelProperty(value = "待条件分页查询所有老师列表")
    @PostMapping ("getTeaPage/{current}/{limit}")
    public R getStudentByPageVo(@PathVariable("current") Long current,
                                @PathVariable("limit") Long limit,
                                @RequestBody TeacherQuery teacherQuery){
        // 1 - 取出查询条件
        String name = teacherQuery.getName();
        Integer type = teacherQuery.getType();
        String start = teacherQuery.getStart();
        String end = teacherQuery.getEnd();

        // 2 - 不为null拼写sql
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(name))
            wrapper.like("tea_name",name);
        if (!StringUtils.isEmpty(type))
            wrapper.eq("tea_type",type);
        if (!StringUtils.isEmpty(start))
            wrapper.ge("tea_create_time",start);
        if (!StringUtils.isEmpty(end))
            wrapper.le("tea_create_time",end);

        Page<Teacher> page = new Page<>(current,limit);
        teacherService.page(page, wrapper);
        List<Teacher> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);
    }


    @ApiModelProperty(value = "添加老师")
    @PostMapping("add")
    public R addTeacher(@RequestBody Teacher teacher){
        boolean save = teacherService.save(teacher);
        if (save)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "根据id查老师")
    @GetMapping("getTeaById/{id}")
    public R findTeacher(@PathVariable("id") Long id){
        Teacher byId = teacherService.getById(id);
        return R.ok().data("teacherWithId",byId);
    }


    @ApiModelProperty(value = "修改老师")
    @PostMapping("update")
    public R updateTeacher(@RequestBody Teacher teacher){
        boolean b = teacherService.updateById(teacher);
        if (b)
            return R.ok();
        else
            return R.error();
    }


    @PostMapping("/updatePwd")
    public R updateTeacherPwd(@RequestHeader("Authorization")String token,
                              @RequestParam("pwd") String pwd,
                              @RequestParam("old") String old){
        Long aLong = loginService.checkToken(token);
        Teacher byId = teacherService.getById(aLong);
        //return R.ok().data("data",byId);
        if (byId==null)
            return R.error().message("登录信息失效");

        if (!old.equals(byId.getTeaPwd()))
            return R.ok().message("Warning");

        Teacher newt = new Teacher();
        newt.setTeaId(aLong);
        newt.setTeaPwd(pwd);

        boolean b = teacherService.updateById(newt);
        if (b)
            return R.ok().message("Success");
        else
            return R.ok().message("Fail");
    }

}
