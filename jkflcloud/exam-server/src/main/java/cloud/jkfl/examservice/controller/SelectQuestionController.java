package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.SelectQuestion;
import cloud.jkfl.examservice.pojo.vo.SelectQuestionVo;
import cloud.jkfl.examservice.service.SelectQuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/select")
public class SelectQuestionController {


    @Autowired
    private SelectQuestionService selectQuestionService;


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @PostMapping("/addlist")
    public R addList(@RequestHeader("Authorization")String token,
                     @RequestBody SelectQuestionVo selectQuestionVo){
        boolean token1 = tokenFeignClient.token(token, 2);
        if (!token1)
            return R.ok().message("Info");

        List<SelectQuestion> addlist = new ArrayList<>();
        for (SelectQuestion item: selectQuestionVo.getList()){
            SelectQuestion s = new SelectQuestion();
            s.setSqAnswer(item.getSqAnswer());
            s.setSqAnswerA(item.getSqAnswerA());
            s.setSqAnswerB(item.getSqAnswerB());
            s.setSqAnswerC(item.getSqAnswerC());
            s.setSqAnswerD(item.getSqAnswerD());
            s.setSqQuestion(item.getSqQuestion());
            s.setSqLevel("2");
            s.setSqScore(2);
            s.setSqSubject(item.getSqSubject());
            s.setSqAnalysis(item.getSqAnalysis());
            addlist.add(s);
        }
        boolean b = selectQuestionService.saveBatch(addlist);
        if (b)
            return R.ok().message("Success");
        else
            return R.ok().message("Fail");
    }



    @PostMapping("/list")
    public R list(@RequestHeader("Authorization")String token){
        boolean token1 = tokenFeignClient.token(token, 2);
        if (!token1)
            return R.error().message("登录信息丢失");

        List<SelectQuestion> list = selectQuestionService.list(null);
        return R.ok().data("data",list);
    }


    @PostMapping("/selectQuestion")
    public R add(@RequestHeader("Authorization")String token,
                 @RequestBody SelectQuestion selectQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            //System.out.println(selectQuestion);
            SelectQuestion s = new SelectQuestion();
            s.setSqAnswer(selectQuestion.getSqAnswer());
            s.setSqAnswerA(selectQuestion.getSqAnswerA());
            s.setSqAnswerB(selectQuestion.getSqAnswerB());
            s.setSqAnswerC(selectQuestion.getSqAnswerC());
            s.setSqAnswerD(selectQuestion.getSqAnswerD());
            s.setSqQuestion(selectQuestion.getSqQuestion());
            s.setSqLevel(selectQuestion.getSqLevel());
            s.setSqScore(selectQuestion.getSqScore());
            s.setSqSubject(selectQuestion.getSqSubject());
            s.setSqAnalysis(selectQuestion.getSqAnalysis());

            boolean save = selectQuestionService.save(s);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.error().message("Info");

    }


    @GetMapping("/selectQuestionId")
    public R selectQuestionId(){
        SelectQuestion onlyQuestionId = selectQuestionService.findOnlyQuestionId();
        return R.ok().data("onlyQusId",onlyQuestionId);
    }

}
