package cloud.jkfl.userservice.controller;

import cloud.jkfl.commonutils.EmailUtils;
import cloud.jkfl.commonutils.R;
import cloud.jkfl.commonutils.TelUtils;
import cloud.jkfl.userservice.pojo.Student;
import cloud.jkfl.userservice.service.StudentService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Random;

@RestController
@RequestMapping("stu")
public class StudentController {


    @Autowired
    private StudentService studentService;


    @ApiModelProperty(value = "添加学生")
    @PostMapping("add")
    public R addStudent(@RequestBody Student student){
        boolean save = studentService.save(student);
        if (save)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "查找所有学生")
    @GetMapping("list")
    public R getAllStu(){
        List<Student> list = studentService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "根据Id查找学生")
    @GetMapping("getById/{id}")
    public R getStudentById(@PathVariable("id") Long id){
        Student byId = studentService.getById(id);
        return R.ok().data("studentWithId",byId);
    }


    @ApiModelProperty(value = "根据Id删学生")
    @DeleteMapping("del/{id}")
    public R delStudentById(@PathVariable("id") Long id){
        boolean b = studentService.removeById(id);
        if (b)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "修改学生信息")
    @PostMapping("update")
    public R update(@RequestBody Student student){
        boolean b = studentService.updateById(student);
        if (b)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "分页查询所有学生列表")
    @GetMapping("getStuPage/{current}/{limit}")
    public R getStudentByPage(@PathVariable("current") Long current,
                              @PathVariable("limit") Long limit){
        Page<Student> page = new Page<>(current,limit);
        studentService.page(page, null);
        List<Student> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);
    }


    @ApiModelProperty(value = "Postman接口向数据库插入fake学生数据")
    @PostMapping("/addStuListTest/Dev")
    public R addStuListTestDev(){
        for (int i=2; i<33; i++){
            Student student = new Student();
            student.setStuName("数媒1902-学生-"+i);
            student.setStuTel(TelUtils.getTel());
            student.setStuEmail(EmailUtils.getEmail(2,9));
            student.setStuInstitute("普通三本");
            student.setStuMajor("数媒");
            student.setStuLevel("2");
            student.setStuSex(i%2==0?"男":"女");
            student.setStuPwd("123456");
            student.setStuIdentityCard("3206212001072800"+( i / 10 == 0 ? ("0" + i) : i ));
            student.setClassId(1501180422934241281L);
            student.setStuGrade("1");
            student.setStuSchool("江南大学");
            student.setStuAcademy("人工智能与计算机学院");
            student.setStuDescription("这是二班第 "+i+" 个学生!");
            student.setStuAddress("江南大学清苑79号楼-4"+i);

            boolean save = studentService.save(student);
            if (!save)
                return R.ok().message("第 "+i+" 条插入失败");

        }

        return R.ok().message("ok");
    }

}
