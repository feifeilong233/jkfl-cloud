package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.*;
import cloud.jkfl.examservice.service.InputQuestionService;
import cloud.jkfl.examservice.service.JudgeQuestionService;
import cloud.jkfl.examservice.service.PaperManageService;
import cloud.jkfl.examservice.service.SelectQuestionService;
import cloud.jkfl.examservice.service.impl.MultipleQuestionServiceImpl;
import cloud.jkfl.examservice.service.impl.ProgramQuestionServiceImpl;
import cloud.jkfl.examservice.service.impl.ShortAnswerQuestionServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/paper")
public class PaperManageController {


    @Autowired
    private PaperManageService paperManageService;


    @Autowired
    private SelectQuestionService selectQuestionService;


    @Autowired
    private MultipleQuestionServiceImpl multipleQuestionService;


    @Autowired
    private JudgeQuestionService judgeQuestionService;


    @Autowired
    private InputQuestionService inputQuestionService;


    @Autowired
    private ShortAnswerQuestionServiceImpl shortAnswerQuestionService;


    @Autowired
    private ProgramQuestionServiceImpl programQuestionService;


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @PostMapping("/add")
    public R add(@RequestBody PaperManage paperManage){
        boolean save = paperManageService.save(paperManage);
        if (save)
            return R.ok().message("试卷添加成功");
        else
            return R.error().message("试卷添加失败");
    }


    @GetMapping("/list")
    public R findAll(){
        List<PaperManage> list = paperManageService.list(null);
        return R.ok().data("list",list);
    }


    @PostMapping("/getPaperById")
    public R getById(@RequestHeader("Authorization")String token,
                     @RequestParam("id") String _id){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (!token1)
            return R.error().message("登录信息失效");

        Long id = Long.parseLong(_id);

        List<SelectQuestion> selectQuestionList = selectQuestionService.findByIdAndType(id);// 选择 type = 1
        List<MultipleQuestion> multipleQuestionList = multipleQuestionService.findByIdAndType(id);//2
        List<JudgeQuestion> judgeQuestionList = judgeQuestionService.findByIdAndType(id);// 判断 type = 3
        List<InputQuestion> inputQuestionList = inputQuestionService.findByIdAndType(id);// 填空 type = 4
        List<ShortAnswerQuestion> shortAnswerQuestionList = shortAnswerQuestionService.findByIdAndType(id);//5
        List<ProgramQuestion> programQuestionList = programQuestionService.findByIdAndType(id);//6


        Map<String, Object> map = new HashMap<>();
        map.put("select", selectQuestionList);
        map.put("multiple",multipleQuestionList);
        map.put("judge", judgeQuestionList);
        map.put("input", inputQuestionList);
        map.put("shortAnswer",shortAnswerQuestionList);
        map.put("program",programQuestionList);
        return R.ok().data(map);
    }


    @ApiModelProperty(value = "阅卷所需要主管题目，只需要三种类型")
    @PostMapping("getReadList")
    public R getReadList(@RequestHeader("Authorization")String token,
                         @RequestParam("id") String _id){
        boolean token1 = tokenFeignClient.token(token, 2);

        if (!token1)
            return R.error().message("登录信息失效");

        Long id = Long.parseLong(_id);

        List<InputQuestion> inputQuestionList = inputQuestionService.findByIdAndType(id);// 填空 type = 4
        List<ShortAnswerQuestion> shortAnswerQuestionList = shortAnswerQuestionService.findByIdAndType(id);//5
        List<ProgramQuestion> programQuestionList = programQuestionService.findByIdAndType(id);//6


        Map<String, Object> map = new HashMap<>();
        map.put("input", inputQuestionList);
        map.put("shortAnswer",shortAnswerQuestionList);
        map.put("program",programQuestionList);
        return R.ok().data(map);
    }

}
