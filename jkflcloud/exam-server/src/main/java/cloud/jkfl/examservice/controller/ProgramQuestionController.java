package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.ProgramQuestion;
import cloud.jkfl.examservice.pojo.vo.ProgramQuestionVo;
import cloud.jkfl.examservice.service.impl.ProgramQuestionServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("/program")
public class ProgramQuestionController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private ProgramQuestionServiceImpl programQuestionService;


    @PostMapping("add_program")
    @ApiModelProperty(value = "添加编程题")
    public R add(@RequestHeader("Authorization")String token,
                 @RequestBody ProgramQuestion programQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            ProgramQuestion p = new ProgramQuestion();
            p.setPqSubject(programQuestion.getPqSubject());
            p.setPqQuestion(programQuestion.getPqQuestion());
            p.setPqAnalysis(programQuestion.getPqAnalysis());
            p.setPqScore(programQuestion.getPqScore());
            p.setPqLevel(programQuestion.getPqLevel());

            boolean save = programQuestionService.save(p);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }

    @PostMapping("addlist")
    @ApiModelProperty(value = "添加编程题")
    public R addlist(@RequestHeader("Authorization")String token,
                 @RequestBody ProgramQuestionVo programQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);
        List<ProgramQuestion> addlist = new ArrayList<>();

        if (token1){
            for (ProgramQuestion item: programQuestion.getList()){
                ProgramQuestion p = new ProgramQuestion();
                p.setPqSubject(item.getPqSubject());
                p.setPqQuestion(item.getPqQuestion());
                p.setPqAnalysis(item.getPqAnalysis());
                p.setPqScore(10);
                p.setPqLevel("2");
                addlist.add(p);

            }

            boolean save = programQuestionService.saveBatch(addlist);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }

}
