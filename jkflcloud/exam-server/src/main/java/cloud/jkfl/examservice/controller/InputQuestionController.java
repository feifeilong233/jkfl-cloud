package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.InputQuestion;
import cloud.jkfl.examservice.pojo.vo.InputQuestionVo;
import cloud.jkfl.examservice.service.InputQuestionService;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@CrossOrigin
@RestController
@RequestMapping("input")
public class InputQuestionController {


    @Autowired
    private InputQuestionService inputQuestionService;


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @PostMapping("inputQuestion")
    @CrossOrigin
    @ApiModelProperty(value = "添加填空题")
    public R add(@RequestHeader("Authorization")String token,
                 @RequestBody InputQuestion inputQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){
            InputQuestion i = new InputQuestion();
            i.setIqQuestion(inputQuestion.getIqQuestion());
            i.setIqAnswer(inputQuestion.getIqAnswer());
            i.setIqAnalysis(inputQuestion.getIqAnalysis());
            i.setIqLevel(inputQuestion.getIqLevel());
            i.setIqScore(inputQuestion.getIqScore());
            i.setIqSubject(inputQuestion.getIqSubject());

            boolean save = inputQuestionService.save(i);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }


    @ApiModelProperty(value = "查询最后一条数据，并返回只有其id的对象")
    @GetMapping("inputQuestionId")
    public R findOnlyQuestionId(){
        InputQuestion onlyQuestionId = inputQuestionService.findOnlyQuestionId();
        return R.ok().data("onlyQusId",onlyQuestionId);
    }


    @PostMapping("/addlist")
    public R addlist(@RequestHeader("Authorization")String token,
                     @RequestBody InputQuestionVo inputQuestion){

        boolean token1 = tokenFeignClient.token(token, 2);
        List<InputQuestion> addlist = new ArrayList<>();

        if (token1){
            for (InputQuestion item: inputQuestion.getList()){
                InputQuestion i = new InputQuestion();
                i.setIqQuestion(item.getIqQuestion());
                i.setIqAnswer(item.getIqAnswer());
                i.setIqAnalysis(item.getIqAnalysis());
                i.setIqLevel("2");
                i.setIqScore(3);
                i.setIqSubject(item.getIqSubject());
                addlist.add(item);
            }

            boolean save = inputQuestionService.saveBatch(addlist);
            if (save)
                return R.ok().message("Success");
            else
                return R.ok().message("Fail");
        }else
            return R.ok().message("Info");

    }



}
