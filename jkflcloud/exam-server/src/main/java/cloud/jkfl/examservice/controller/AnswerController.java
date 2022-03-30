package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.ExamManage;
import cloud.jkfl.examservice.pojo.ExamRecord;
import cloud.jkfl.examservice.pojo.Score;
import cloud.jkfl.examservice.pojo.vo.AnswerQuery;
import cloud.jkfl.examservice.pojo.vo.ExamVo;
import cloud.jkfl.examservice.pojo.vo.ScoreVo;
import cloud.jkfl.examservice.service.ExamManageService;
import cloud.jkfl.examservice.service.impl.AnswerServiceImpl;
import cloud.jkfl.examservice.service.impl.ExamManageServiceImpl;
import cloud.jkfl.examservice.service.impl.ExamRecordServiceImpl;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.netflix.discovery.converters.Auto;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@CrossOrigin
@RestController
@RequestMapping("answer")
public class AnswerController {

    @Autowired
    private TokenFeignClient tokenFeignClient;

    @Autowired
    private AnswerServiceImpl answerService;

    @Autowired
    private ExamManageServiceImpl examManageService;

    @Autowired
    private ExamRecordServiceImpl examRecordService;

    @GetMapping("pages/{current}/{limit}")
    @ApiModelProperty(value = "分页查询所有题库")
    public R findQuestionPages(@PathVariable("current") Integer current,
                               @PathVariable("limit") Integer limit){
        Page<AnswerQuery> page = new Page<>(current,limit);
        IPage<AnswerQuery> all = answerService.findAll(page);
        return R.ok().data("list",all);
    }


    @PostMapping("getListWithSubScore")
    @ApiModelProperty(value = "得到成绩，同时exam的主观题分数不能为-1S")
    public R GetListWithSUbScore(@RequestHeader("Authorization") String token){

        //老师id
        Long aLong = tokenFeignClient.TokenForId(token);

        //通过老师id再class表里面查到classId
        Map<Long, String> longStringMap = tokenFeignClient.feginClassWithTea(aLong);
        List<ScoreVo> scoreVos = new ArrayList<>();

        for (Long classId : longStringMap.keySet()){
            ExamManage examManage = examManageService.getExamWithClassId(classId);

            //开始名称
            String title = examManage.getExamSource();

            Long examId = examManage.getExamId();
            List<ExamRecord> recordsWithExamId = examRecordService.getRecordsWithExamId(examId);

            for (ExamRecord item : recordsWithExamId){
                //得分
                Integer join = item.getExamJoinScore();
                Integer sub = item.getExamSubScore();
                Integer total = join + sub;

                String userId = item.getExamJoinerId();
                String str = tokenFeignClient.ReturnNicknameWithId(userId);

                //通过约定得到姓名和学号
                String[] splits = str.split("!");
                String nickname = splits[0];
                String pid = splits[1];

                ScoreVo scoreVo = new ScoreVo();
                scoreVo.setNickname(nickname);
                scoreVo.setTitle(title);
                scoreVo.setJoin(join);
                scoreVo.setSub(sub);
                scoreVo.setTotal(total);
                scoreVo.setPid(pid);

                scoreVos.add(scoreVo);
            }

        }

        return R.ok().data("date",scoreVos);
    }


    @ApiModelProperty(value = "带参数查询得分列表")
    @PostMapping("/getListWithParam")
    public R GetListWithParam(@RequestHeader("Authorization") String token,
                              @RequestParam("type") String type,
                              @RequestParam("text") String text){

        //老师id
        Long aLong = tokenFeignClient.TokenForId(token);

        //通过老师id再class表里面查到classId
        Map<Long, String> longStringMap = tokenFeignClient.feginClassWithTea(aLong);
        List<ScoreVo> scoreVos = new ArrayList<>();

        for (Long classId : longStringMap.keySet()){
            ExamManage examManage = examManageService.getExamWithClassId(classId);

            //开始名称
            String title = examManage.getExamSource();

            Long examId = examManage.getExamId();
            List<ExamRecord> recordsWithExamId = examRecordService.getRecordsWithExamId(examId);

            for (ExamRecord item : recordsWithExamId){
                //得分
                Integer join = item.getExamJoinScore();
                Integer sub = item.getExamSubScore();
                Integer total = join + sub;

                String userId = item.getExamJoinerId();

                String str = tokenFeignClient.ReturnNicknameWithId(userId);

                //通过约定得到姓名和学号
                String[] splits = str.split("!");
                String nickname = splits[0];
                String pid = splits[1];

                if (type.equals("1")){
                    boolean contains = nickname.contains(text);
                    if (contains){
                        ScoreVo scoreVo = new ScoreVo();
                        scoreVo.setNickname(nickname);
                        scoreVo.setTitle(title);
                        scoreVo.setJoin(join);
                        scoreVo.setSub(sub);
                        scoreVo.setTotal(total);
                        scoreVo.setPid(pid);

                        scoreVos.add(scoreVo);
                    }
                }

                if (type.equals("2")){
                    boolean contains = pid.contains(text);
                    if (contains){
                        ScoreVo scoreVo = new ScoreVo();
                        scoreVo.setNickname(nickname);
                        scoreVo.setTitle(title);
                        scoreVo.setJoin(join);
                        scoreVo.setSub(sub);
                        scoreVo.setTotal(total);
                        scoreVo.setPid(pid);

                        scoreVos.add(scoreVo);
                    }
                }

                if (type.equals("3")){
                    boolean contains = title.contains(text);
                    if (contains){
                        ScoreVo scoreVo = new ScoreVo();
                        scoreVo.setNickname(nickname);
                        scoreVo.setTitle(title);
                        scoreVo.setJoin(join);
                        scoreVo.setSub(sub);
                        scoreVo.setTotal(total);
                        scoreVo.setPid(pid);

                        scoreVos.add(scoreVo);
                    }
                }

            }

        }


        return R.ok().data("data",scoreVos);
    }


}
