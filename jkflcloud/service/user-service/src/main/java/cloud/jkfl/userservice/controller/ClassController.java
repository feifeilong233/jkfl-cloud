package cloud.jkfl.userservice.controller;

import cloud.jkfl.commonutils.R;
import cloud.jkfl.userservice.pojo.Class;
import cloud.jkfl.userservice.pojo.Student;
import cloud.jkfl.userservice.pojo.Teacher;
import cloud.jkfl.userservice.pojo.vo.StudentListQuery;
import cloud.jkfl.userservice.service.impl.ClassServiceImpl;
import cloud.jkfl.userservice.service.impl.LoginServiceImpl;
import cloud.jkfl.userservice.service.impl.StudentServiceImpl;
import cloud.jkfl.userservice.service.impl.TeacherServiceImpl;
import com.netflix.discovery.converters.Auto;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
    private StudentServiceImpl studentService;

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
    @CrossOrigin
    public R findStuListWithTea(@RequestHeader("Authorization")String token){

        Long aLong = loginService.checkToken(token);

        Teacher teacher = teacherService.getById(aLong);
        if (teacher==null)
            return R.error().message("登录信息丢失");
        List<StudentListQuery> list = new LinkedList<>();
        Long classId = teacher.getClassId();

        Class byId = classService.getById(classId);

        String className = byId.getClassName();

        List<Student> st = studentService.getListWithClassId(classId);

        for(Student item : st){
            StudentListQuery s = new StudentListQuery();
            s.setId(item.getStuId());
            s.setClassName(className);
            s.setPid(item.getStuPid());
            s.setTel(item.getStuTel());
            s.setEmail(item.getStuEmail());
            s.setStuName(item.getStuName());
            list.add(s);
        }

        return R.ok().data("data",list);

    }

    @CrossOrigin
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
            List<Student> st = studentService.getListWithName(value);
            for(Student item : st){
                StudentListQuery s = new StudentListQuery();
                s.setId(item.getStuId());
                s.setClassName(className);
                s.setPid(item.getStuPid());
                s.setTel(item.getStuTel());
                s.setEmail(item.getStuEmail());
                s.setStuName(item.getStuName());
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

            List<Student> st = studentService.getListWithPid(Long.parseLong(value));
            for(Student item : st){
                StudentListQuery s = new StudentListQuery();
                s.setId(item.getStuId());
                s.setClassName(className);
                s.setPid(item.getStuPid());
                s.setTel(item.getStuTel());
                s.setEmail(item.getStuEmail());
                s.setStuName(item.getStuName());
                list.add(s);
            }
            return R.ok().data("data",list);
        }

        return R.error().message("数据拉取失败");
    }


    @CrossOrigin
    @PostMapping("/getClassList")
    public R getClassList(@RequestHeader("Authorization")String token){
        Long tokenId = loginService.checkToken(token);
        Teacher teacher = teacherService.getById(tokenId);
        if (teacher==null)
            return R.error().message("登录信息丢失");

        List<Class> list = classService.list(null);
        return R.ok().data("data",list);
    }

    @RequestMapping(value = "/feignClass",method = RequestMethod.GET)
    public Map<Long,String> feignClass(){
        List<Class> list = classService.list(null);
        Map<Long,String> map = new HashMap<>();
        for (Class s : list){
            map.put(s.getClassId(),s.getClassName());
        }
        return map;
    }

    @ApiModelProperty(value = "通过Tea的id得到所教班级")
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


    @CrossOrigin
    @PostMapping("/addStu")
    public R addClass(@RequestHeader("Authorization")String token,
                      @RequestParam("value") String value,
                      @RequestParam("text") String text){
        Long tokenId = loginService.checkToken(token);
        Teacher teacher = teacherService.getById(tokenId);
        if (teacher==null)
            return R.error().message("登录信息丢失");

        Student student = studentService.getStuByName(text);
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
