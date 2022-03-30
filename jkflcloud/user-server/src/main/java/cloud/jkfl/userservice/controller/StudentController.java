package cloud.jkfl.userservice.controller;

import cloud.jkfl.common.utils.EmailUtils;
import cloud.jkfl.common.utils.NickNameUtils;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.common.utils.TelUtils;
import cloud.jkfl.userservice.pojo.User;
import cloud.jkfl.userservice.pojo.vo.ReadVo;
import cloud.jkfl.userservice.service.StudentService;
import cloud.jkfl.userservice.service.impl.UserServiceImpl;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@CrossOrigin
@RestController
@RequestMapping("stu")
public class StudentController {


    @Autowired
    private UserServiceImpl studentService;


    @ApiModelProperty(value = "通过userId返回nickname")
    @RequestMapping(value = "returnNicknameWithId", method = RequestMethod.GET)
    public String ReturnNicknameWithId(@RequestParam("id") String id){
        User byId = studentService.getById(id);
        return byId.getUserNickname()+"!"+byId.getUserPid();
    }


    @ApiModelProperty(value = "通过pid学号查询学生编号id")
    @RequestMapping(value = "returnIdWithPid", method = RequestMethod.GET)
    public String ReturnIdWithPid(@RequestParam("pid") String _pid){

        Long pid = Long.parseLong(_pid);
        String id = studentService.getIdWithPid(pid);

        return id;
    }


    @ApiModelProperty(value = "通过Map查询考试列表vo")
    @RequestMapping(value = "returnVoWithIds", method = RequestMethod.GET)
    public List<ReadVo> ReturnVoWithIds(@RequestParam Map<String, String> ids){

        List<ReadVo> list = new ArrayList<>();
        for (String item : ids.keySet()){

            User byId = studentService.getById(item);
            ReadVo vo = new ReadVo();
            vo.setUserNickname(byId.getUserNickname());
            vo.setUserPid(byId.getUserPid());
            vo.setStatus(ids.get(item).equals("-1") ? "未批阅" : "已批阅");
            list.add(vo);
        }

        return list;
    }



    @ApiModelProperty(value = "添加学生")
    @PostMapping("add")
    public R addStudent(@RequestBody User student){
        boolean save = studentService.save(student);
        if (save)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "查找所有学生")
    @GetMapping("list")
    public R getAllStu(){
        List<User> list = studentService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "根据Id查找学生")
    @GetMapping("getById/{id}")
    public R getStudentById(@PathVariable("id") Long id){
        User byId = studentService.getById(id);
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
    public R update(@RequestBody User student){
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
        Page<User> page = new Page<>(current,limit);
        studentService.page(page, null);
        List<User> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);
    }


    @ApiModelProperty(value = "Postman接口向数据库插入fake学生数据")
    @PostMapping("/addStuListTest/Dev")
    public R addStuListTestDev(){
        for (int i=2; i<33; i++){
            User student = new User();
            student.setUserUsername(NickNameUtils.generateRandomNickname());
            student.setUserNickname("mr123");
            student.setUserPhone(String.valueOf(TelUtils.getTel()));
            student.setUserEmail(EmailUtils.getEmail(2,9));
            student.setUserInstitute("本科");
            student.setUserMajor("数字媒体技术");
            //student.setStuLevel("2");
            student.setUserSex(i%2==0?"男":"女");
            student.setUserRoleId(3);
            student.setUserPassword("123");
            student.setUserIdentityCard("32066219001010702"+( i / 10 == 0 ? ("0" + i) : i ));
            student.setClassId(1501180911373524993L);
            //student.setUserGrade("1");
            student.setUserSchool("江南大学");
            student.setUserAcademy("人工智能与计算机学院");
            student.setUserDescription("这是2110班第 "+i+" 个学生!");
            student.setUserAddress("江南大学澈苑号公寓83号楼-2"+i);
            student.setUserPid(Long.parseLong("11912110"+( i / 10 == 0 ? ("0" + i) : i )));

            boolean save = studentService.save(student);
            if (!save)
                return R.ok().message("第 "+i+" 条插入失败");

        }

        return R.ok().message("ok");
    }

}
