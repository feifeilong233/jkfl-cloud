package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.ExamManage;
import cloud.jkfl.examservice.pojo.PaperLook;
import cloud.jkfl.examservice.pojo.vo.ExamVo;
import cloud.jkfl.examservice.service.ExamManageService;
import cloud.jkfl.examservice.service.impl.PaperLookServiceImpl;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("exam")
public class ExamManageController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private ExamManageService examManageService;


    @Autowired
    private PaperLookServiceImpl paperLookService;


    @ApiModelProperty(value = "得到创建考试时候，老师对应的班级信息")
    @CrossOrigin
    @PostMapping("/createExamList")
    public R createExamList(@RequestHeader("Authorization") String token){
        //boolean token1 = tokenFeignClient.token(token,2);
        Long aLong = tokenFeignClient.TokenForId(token);
        //System.out.println(aLong);
        if (aLong==null)
            return R.ok().message("Info");

        Map<Long, String> longStringMap = tokenFeignClient.feginClassWithTea(aLong);

        List<ExamVo> list = new LinkedList<>();
        for (Long m : longStringMap.keySet()){
            ExamVo v = new ExamVo();
            v.setId(m);
            v.setClassName(longStringMap.get(m));
            list.add(v);
        }

        return R.ok().data("data",list);
    }


    @ApiModelProperty(value = "得到考试管理界面的考试列表")
    @PostMapping("list")
    public R getAllExam(@RequestHeader("Authorization")String token){

        boolean token1 = tokenFeignClient.token(token, 2);
        if(!token1){
            return R.ok().message("Info");
        }

        List<ExamManage> list = examManageService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "分页查询试卷")
    @GetMapping(value = "pages/{current}/{limit}")
    public R getPageExams(@PathVariable("current") Integer current,
                          @PathVariable("limit") Integer limit){
        Page<ExamManage> page = new Page<>(current,limit);
        examManageService.page(page,null);
        List<ExamManage> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);

    }


    @GetMapping("getById/{id}")
    public R getExamById(@PathVariable("id") Long id){
        ExamManage byId = examManageService.getById(id);
        return R.ok().data("examWithId",byId);
    }


    @DeleteMapping("del/{id}")
    public R delExamById(@PathVariable("id") Long id){
        boolean b = examManageService.removeById(id);
        if (b)
            return R.ok().message("删除成功！");
        else
            return R.error().message("删除失败");
    }


    @PostMapping("update")
    public R updateExam(@RequestBody ExamManage examManage){
        boolean b = examManageService.updateById(examManage);
        if (b)
            return R.ok().message("更新成功");
        else
            return R.error().message("更新失败");
    }


    @PostMapping("add")
    public R add(@RequestBody ExamManage examManage){
        boolean save = examManageService.save(examManage);
        if (save)
            return R.ok().message("添加成功");
        else
            return R.error().message("添加失败");
    }


    @ApiModelProperty(value = "查询最后一条paperId并返回给前端达到自增的效果")
    @GetMapping("examPaperId")
    public R findOnlyPaperId(){
        ExamManage examManage = examManageService.findOnlyPaperId();
        return R.ok().data("onlyPaperId",examManage);
    }


    @ApiModelProperty(value = "查询试卷列表")
    @PostMapping("/getPaperLook")
    public R getPaperLook(){
        List<PaperLook> list = paperLookService.list(null);
        return R.ok().data("data",list);
    }


    @ApiModelProperty(value = "创建一场考试")
    @PostMapping("/createOneExam")
    public R createOneExam(@RequestHeader("Authorization")String token,
                           @RequestBody ExamVo examVo){

        boolean token1 = tokenFeignClient.token(token, 2);
        if(!token1)
            return R.ok().message("Info");

        String paperName = examVo.getPaperId();
        PaperLook paperLook = paperLookService.getWithName(paperName);

        ExamManage examManage = new ExamManage();
        examManage.setClazzId(examVo.getId());
        examManage.setExamDescription(examVo.getExamDescription());
        examManage.setExamSource(paperLook.getPaperLookTitle());
        examManage.setPaperId(paperLook.getPaperId());
        examManage.setExamDate(examVo.getBeginTime());
        examManage.setExamTotalTime(paperLook.getPaperLookTime());
        examManage.setExamTotalScore(paperLook.getPaperLookScore());
        examManage.setExamType(examVo.getExamType());
        examManage.setExamTips(examVo.getExamTips());

        boolean save = examManageService.save(examManage);

        if (save)
            return R.ok().message("Success");
        else
            return R.ok().message("Fail");


    }

}

