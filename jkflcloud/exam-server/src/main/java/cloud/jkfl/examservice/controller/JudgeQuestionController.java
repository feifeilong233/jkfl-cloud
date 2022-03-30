package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.JudgeQuestion;
import cloud.jkfl.examservice.pojo.vo.JudgeQuestionVo;
import cloud.jkfl.examservice.service.JudgeQuestionService;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("judge")
public class JudgeQuestionController {


    @Autowired
    private JudgeQuestionService judgeQuestionService;

    @Autowired
    private TokenFeignClient tokenFeignClient;

    @PostMapping("judgeQuestion")
    public R add(@RequestHeader("Authorization") String token,
                 @RequestBody JudgeQuestion judgeQuestion){
        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            JudgeQuestion j = new JudgeQuestion();
            j.setJqQuestion(judgeQuestion.getJqQuestion());
            j.setJqAnalysis(judgeQuestion.getJqAnalysis());
            j.setJqScore(judgeQuestion.getJqScore());
            j.setJqSubject(judgeQuestion.getJqSubject());
            j.setJqAnswer(judgeQuestion.getJqAnswer());
            j.setJqLevel(judgeQuestion.getJqLevel());
            boolean save = judgeQuestionService.save(j);

            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else{
            return R.ok().message("Info");
        }

    }


    @ApiModelProperty(value = "返回最后一个的id地空对象")
    @GetMapping("judgeQuestionId")
    public R findOnlyQuestionId(){
        JudgeQuestion onlyQuestion = judgeQuestionService.findOnlyQuestion();
        return R.ok().data("onlyQusId",onlyQuestion);
    }


    @PostMapping("/addlist")
    public R addlist(@RequestHeader("Authorization") String token,
                     @RequestBody JudgeQuestionVo judgeQuestion){
        boolean token1 = tokenFeignClient.token(token, 2);
        List<JudgeQuestion> addlist = new ArrayList<>();

        if (token1){
            for (JudgeQuestion item: judgeQuestion.getList()) {
                JudgeQuestion j = new JudgeQuestion();
                j.setJqQuestion(item.getJqQuestion());
                j.setJqAnalysis(item.getJqAnalysis());
                j.setJqScore(2);
                j.setJqSubject(item.getJqSubject());
                j.setJqAnswer(item.getJqAnswer());
                j.setJqLevel("2");
                addlist.add(j);
            }
            boolean save = judgeQuestionService.saveBatch(addlist);

            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else{
            return R.ok().message("Info");
        }
    }



}
