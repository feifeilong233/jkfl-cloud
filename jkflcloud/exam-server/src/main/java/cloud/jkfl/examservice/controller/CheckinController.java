package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.*;
import cloud.jkfl.examservice.service.impl.*;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/exam")
@CrossOrigin
public class CheckinController {


    @Autowired
    private TokenFeignClient tokenFeignClient;
    
    @Autowired
    private CheckinServiceImpl checkinService;


    @Autowired
    private SelectQuestionServiceImpl selectQuestionService;


    @Autowired
    private MultipleQuestionServiceImpl multipleQuestionService;


    @Autowired
    private JudgeQuestionServiceImpl judgeQuestionService;


    @Autowired
    private InputQuestionServiceImpl inputQuestionService;


    @Autowired
    private ShortAnswerQuestionServiceImpl shortAnswerQuestionService;


    @Autowired
    private ProgramQuestionServiceImpl programQuestionService;


    @PostMapping("/knowledge_point")
    @ApiModelProperty(value = "查询知识点列表")
    public R knowledge_point(@RequestHeader("Authorization") String token){
        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){

            List<Checkin> list = checkinService.list(null);


            return R.ok().data("data",list);
        }else{
            return R.ok().data("msg", token1);
        }

    }


    @PostMapping("/getDataList")
    @ApiModelProperty(value = "得到题目列表")
    public R getSelectList(@RequestHeader("Authorization")String token,
                           @RequestParam("type") String type,
                           @RequestParam("value") String value){

        boolean token1 = tokenFeignClient.token(token, 2);
        if (!token1)
            return R.error().message("登录信息失效！");

        if (type.equals("select")){
            List<SelectQuestion> sl = selectQuestionService.findListWithValue(value);
            return R.ok().data("data",sl);
        }
        else if (type.equals("multiple")){
            List<MultipleQuestion> ml = multipleQuestionService.findListWithValue(value);
            return R.ok().data("data",ml);
        }
        else if (type.equals("judge")){
            List<JudgeQuestion> jl = judgeQuestionService.findListWithValue(value);
            return R.ok().data("data",jl);
        }
        else if (type.equals("input")){
            List<InputQuestion> il = inputQuestionService.findListWithValue(value);
            return R.ok().data("data",il);
        }
        else if (type.equals("shortAnswer")){
            List<ShortAnswerQuestion> sal = shortAnswerQuestionService.findListWithValue(value);
            return R.ok().data("data",sal);
        }
        else if (type.equals("program")){
            List<ProgramQuestion> pl = programQuestionService.findListWithValue(value);
            return R.ok().data("data",pl);
        }



        return R.error().message("数据拉取失败");
    }

}
