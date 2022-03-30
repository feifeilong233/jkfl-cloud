package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.pojo.Score;
import cloud.jkfl.examservice.service.ScoreService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("score")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;


    @ApiModelProperty(value = "查看所有学生成绩")
    @GetMapping("list")
    public R getAllScore(){
        List<Score> list = scoreService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "分页查看所有学生成绩")
    @GetMapping("pages/{current}/{limit}")
    public R getPages(@PathVariable("current") Integer current,
                      @PathVariable("limit") Integer limit){
        Page<Score> page = new Page<>(current,limit);
        scoreService.page(page,null);
        List<Score> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);
    }

    @ApiModelProperty(value = "通过id查询")
    @GetMapping("getById/{id}")
    public R getScoreById(@PathVariable("id") Long id){
        Score byId = scoreService.getById(id);
        return R.ok().data("scoreWithId",byId);
    }

    @PostMapping("add")
    public R add(@RequestBody Score score){
        boolean save = scoreService.save(score);
        if (save)
            return R.ok().message("添加成功");
        else
            return R.error().message("添加失败");
    }

    @GetMapping("findByExam/{examId}")
    public R findByExamId(@PathVariable("examId") Long examId){
        List<Score> scores = scoreService.findByExamId(examId);
        return R.ok().data("list",scores);
    }

}
