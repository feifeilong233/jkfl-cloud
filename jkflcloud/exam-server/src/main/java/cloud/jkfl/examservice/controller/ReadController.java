package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.ExamRecord;
import cloud.jkfl.examservice.pojo.vo.ReadVo;
import cloud.jkfl.examservice.service.impl.ExamRecordServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@CrossOrigin
@RequestMapping("/read")
public class ReadController {

    @Autowired
    private ExamRecordServiceImpl examRecordService;

    @Autowired
    private TokenFeignClient tokenFeignClient;

    @ApiModelProperty(value = "阅卷")
    @PostMapping("/readAllPaper")
    public R ReadAllPaper(@RequestParam("examId") String _id){
        Long id = Long.parseLong(_id);//得到exam id

        //在exam_record中查到所有exam_id = id的数据
        List<ExamRecord> recordsWithExamId = examRecordService.getRecordsWithExamId(id);

        Map<String, String> ids = new HashMap<>();
        for (ExamRecord item : recordsWithExamId){
            //遍历list，并通过对应joiner-id查询学生表得到学生信息，塞到vo里面发送回去
            ids.put(item.getExamJoinerId(), String.valueOf(item.getExamSubScore()));
        }

        List<ReadVo> readVos = tokenFeignClient.ReturnVoWithIds(ids);

        return R.ok().data("data",readVos);
    }

    @PostMapping("/readSinglePaper")
    @ApiModelProperty(value = "返回单个学生得试卷")
    public R ReadSinglePaper(@RequestParam("pid") String _pid){
        //Long pid = Long.parseLong(_pid);
        String joiner_id = tokenFeignClient.ReturnIdWithPid(_pid);

        ExamRecord examRecord = examRecordService.getRecordWithJoinerId(joiner_id);

        return R.ok().data("data",examRecord);

    }


    @PostMapping("/updateSubScore")
    @ApiModelProperty(value = "更新主观题成绩")
    public R UpdateSubScore(@RequestParam("pid") String _pid,
                            @RequestParam("total") String _total,
                            @RequestHeader("Authorization") String token){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (!token1)
            return R.ok().message("None");

        Integer total = Integer.parseInt(_total);

        String joiner_id = tokenFeignClient.ReturnIdWithPid(_pid);
        ExamRecord examRecord = examRecordService.getRecordWithJoinerId(joiner_id);

        ExamRecord e = new ExamRecord();
        e.setExamRecordId(examRecord.getExamRecordId());
        e.setExamSubScore(total);
        boolean update = examRecordService.updateById(e);

        if (update)
            return R.ok().message("Success");
        else
            return R.ok().message("Fail");


    }


}
