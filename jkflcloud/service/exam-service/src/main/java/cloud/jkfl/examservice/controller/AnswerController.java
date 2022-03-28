package cloud.jkfl.examservice.controller;

import cloud.jkfl.commonutils.R;
import cloud.jkfl.examservice.pojo.vo.AnswerQuery;

import cloud.jkfl.examservice.service.impl.AnswerServiceImpl;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("answer")
public class AnswerController {

    @Autowired
    private AnswerServiceImpl answerService;

    @GetMapping("pages/{current}/{limit}")
    @ApiModelProperty(value = "分页查询所有题库")
    public R findQuestionPages(@PathVariable("current") Integer current,
                               @PathVariable("limit") Integer limit){
        Page<AnswerQuery> page = new Page<>(current,limit);
        IPage<AnswerQuery> all = answerService.findAll(page);
        return R.ok().data("list",all);
    }


}
