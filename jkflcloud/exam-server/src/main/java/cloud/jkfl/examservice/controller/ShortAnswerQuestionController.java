package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.ShortAnswerQuestion;
import cloud.jkfl.examservice.pojo.vo.ShortAnswerQuestionVo;
import cloud.jkfl.examservice.service.impl.ShortAnswerQuestionServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/short_answer")
public class ShortAnswerQuestionController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private ShortAnswerQuestionServiceImpl shortAnswerQuestionService;


    @PostMapping("shortAnswerQuestion")
    @CrossOrigin
    @ApiModelProperty(value = "添加简答题")
    public R add(@RequestHeader("Authorization")String token,
                 @RequestBody ShortAnswerQuestion shortAnswerQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            ShortAnswerQuestion s = new ShortAnswerQuestion();
            s.setSaqSubject(shortAnswerQuestion.getSaqSubject());
            s.setSaqQuestion(shortAnswerQuestion.getSaqQuestion());
            s.setSaqAnalysis(shortAnswerQuestion.getSaqAnalysis());
            s.setSaqScore(shortAnswerQuestion.getSaqScore());
            s.setSaqLevel(shortAnswerQuestion.getSaqLevel());

            boolean save = shortAnswerQuestionService.save(s);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }


    @PostMapping("/addlist")
    public R addlist(@RequestHeader("Authorization")String token,
                     @RequestBody ShortAnswerQuestionVo shortAnswerQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);
        List<ShortAnswerQuestion> addlist = new ArrayList<>();

        if (token1){
            for (ShortAnswerQuestion item: shortAnswerQuestion.getList()){
                ShortAnswerQuestion s = new ShortAnswerQuestion();
                s.setSaqSubject(item.getSaqSubject());
                s.setSaqQuestion(item.getSaqQuestion());
                s.setSaqAnalysis(item.getSaqAnalysis());
                s.setSaqScore(10);
                s.setSaqLevel("2");
                addlist.add(s);
            }


            boolean save = shortAnswerQuestionService.saveBatch(addlist);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }

}
