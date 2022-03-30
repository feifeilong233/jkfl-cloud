package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.MultipleQuestion;
import cloud.jkfl.examservice.pojo.vo.MultipleQuestionVo;
import cloud.jkfl.examservice.service.impl.MultipleQuestionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/multiple")
public class MultipleQuestionController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private MultipleQuestionServiceImpl multipleQuestionService;


    @PostMapping("add_multiple")
    @CrossOrigin
    public R add(@RequestHeader("Authorization")String token,
                 @RequestBody MultipleQuestion multipleQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            MultipleQuestion m = new MultipleQuestion();
            m.setMqSubject(multipleQuestion.getMqSubject());
            m.setMqQuestion(multipleQuestion.getMqQuestion());
            m.setMqAnalysis(multipleQuestion.getMqAnalysis());
            m.setMqScore(multipleQuestion.getMqScore());
            m.setMqLevel(multipleQuestion.getMqLevel());
            m.setMqAnswerA(multipleQuestion.getMqAnswerA());
            m.setMqAnswerB(multipleQuestion.getMqAnswerB());
            m.setMqAnswerC(multipleQuestion.getMqAnswerC());
            m.setMqAnswerD(multipleQuestion.getMqAnswerD());
            m.setMqAnswer(multipleQuestion.getMqAnswer());

            boolean save = multipleQuestionService.save(m);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }


    @PostMapping("addlist")
    public R addlist(@RequestHeader("Authorization")String token,
                     @RequestBody MultipleQuestionVo multipleQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);
        List<MultipleQuestion> addlist = new ArrayList<>();

        if (token1){

            for (MultipleQuestion item: multipleQuestion.getList()){
                MultipleQuestion m = new MultipleQuestion();
                m.setMqSubject(item.getMqSubject());
                m.setMqQuestion(item.getMqQuestion());
                m.setMqAnalysis(item.getMqAnalysis());
                m.setMqScore(4);
                m.setMqLevel("2");
                m.setMqAnswerA(item.getMqAnswerA());
                m.setMqAnswerB(item.getMqAnswerB());
                m.setMqAnswerC(item.getMqAnswerC());
                m.setMqAnswerD(item.getMqAnswerD());
                m.setMqAnswer(item.getMqAnswer());
                addlist.add(m);
            }

            boolean save = multipleQuestionService.saveBatch(addlist);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");
    }


}
