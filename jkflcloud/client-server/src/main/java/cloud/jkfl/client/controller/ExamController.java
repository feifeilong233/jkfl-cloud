/***********************************************************
 * @Description : 考试服务
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.controller;

import cloud.jkfl.client.entity.Exam;
import cloud.jkfl.client.entity.ExamRecord;
import cloud.jkfl.client.service.ExamService;
import cloud.jkfl.client.vo.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@RestController
@Api(tags = "Exam APIs")
@RequestMapping("/api/exam")
public class ExamController {
    @Autowired
    private ExamService examService;

    @GetMapping("/question/detail/{type}/{id}")
    @ApiOperation("根据问题的id获取问题的详细信息")
    @CrossOrigin
    ResultVO<QuestionDetailVo> getQuestionDetail(@PathVariable Long id, @PathVariable Integer type) {
        //  根据问题id获取问题的详细信息
        ResultVO<QuestionDetailVo> resultVO;
        try {
            QuestionDetailVo questionDetailVo = examService.getSelectQuestionDetail(id, type);
            resultVO = new ResultVO<>(0, "获取问题详情成功", questionDetailVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取问题详情失败", null);
        }
        return resultVO;
    }

    @GetMapping("/all")
    @ApiOperation("获取全部考试的列表")
    @CrossOrigin
    ResultVO<List<ExamVo>> getExamAll() {
        // 需要拼接前端需要的考试列表对象
        ResultVO<List<ExamVo>> resultVO;
        try {
            List<ExamVo> examVos = examService.getExamAll();
            resultVO = new ResultVO<>(0, "获取全部考试的列表成功", examVos);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取全部考试的列表失败", null);
        }
        return resultVO;
    }

    @GetMapping("/card/list")
    @ApiOperation("获取考试列表，适配前端卡片列表")
    @CrossOrigin
    ResultVO<List<ExamCardVo>> getExamCardList() {
        // 获取考试列表卡片
        ResultVO<List<ExamCardVo>> resultVO;
        try {
            List<ExamCardVo> examCardVoList = examService.getExamCardList();
            resultVO = new ResultVO<>(0, "获取考试列表卡片成功", examCardVoList);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试列表卡片失败", null);
        }
        return resultVO;
    }

    @GetMapping("/detail/{id}")
    @ApiOperation("根据考试的id，获取考试详情")
    @CrossOrigin
    ResultVO<ExamDetailVo> getExamDetail(@PathVariable Long id) {
        // 根据id获取考试详情
        ResultVO<ExamDetailVo> resultVO;
        try {
            ExamDetailVo examDetail = examService.getExamDetail(id);
            resultVO = new ResultVO<>(0, "获取考试详情成功", examDetail);
        } catch (Exception e) {
            resultVO = new ResultVO<>(-1, "获取考试详情失败", null);
        }
        return resultVO;
    }

    @PostMapping("/finish/sub/{recordId}")
    @ApiOperation("保存主观题答案")
    @CrossOrigin
    ResultVO<String> finishSub(@PathVariable String recordId, @RequestBody HashMap<Long, SubDetailVo> subMap, HttpServletRequest request) {
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            examService.saveSubDetail(userId, recordId, subMap);
            return new ResultVO<>(0, "保存主观题答案成功", null);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResultVO<>(-1, "保存主观题答案失败", null);
        }
    }

    @PostMapping("/finish/{examId}")
    @ApiOperation("根据用户提交的答案对指定id的考试判分")
    @CrossOrigin
    ResultVO<ExamRecord> finishExam(@PathVariable Long examId, @RequestBody HashMap<Long, List<String>> answersMap, HttpServletRequest request) {
        ResultVO<ExamRecord> resultVO;
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            // 下面根据用户提交的信息进行判分,返回用户的得分情况
            ExamRecord examRecord = examService.judge(userId, examId, answersMap);
            resultVO = new ResultVO<>(0, "考卷提交成功", examRecord);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "考卷提交失败", null);
        }
        return resultVO;
    }

    @GetMapping("/record/list")
    @ApiOperation("获取当前用户的考试记录")
    @CrossOrigin
    ResultVO<List<ExamRecordVo>> getExamRecordList(HttpServletRequest request) {
        ResultVO<List<ExamRecordVo>> resultVO;
        try {
            // 拦截器里设置上的用户id
            String userId = (String) request.getAttribute("user_id");
            // 下面根据用户账号拿到他(她所有的考试信息)，注意要用VO封装下
            List<ExamRecordVo> examRecordVoList = examService.getExamRecordList(userId);
            resultVO = new ResultVO<>(0, "获取考试记录成功", examRecordVoList);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试记录失败", null);
        }
        return resultVO;
    }

    @GetMapping("/record/detail/{recordId}")
    @ApiOperation("根据考试记录id获取考试记录详情")
    @CrossOrigin
    ResultVO<RecordDetailVo> getExamRecordDetail(@PathVariable String recordId) {
        ResultVO<RecordDetailVo> resultVO;
        try {
            RecordDetailVo recordDetailVo = examService.getRecordDetail(recordId);
            resultVO = new ResultVO<>(0, "获取考试记录详情成功", recordDetailVo);
        } catch (Exception e) {
            e.printStackTrace();
            resultVO = new ResultVO<>(-1, "获取考试记录详情失败", null);
        }
        return resultVO;
    }

    @GetMapping("/question/sub/{id}")
    @ApiOperation("根据考试的id，获取主观题详情")
    @CrossOrigin
    ResultVO<List<SubDetailVo>> getSubDetail(@PathVariable Long id) {
        // 根据id获取考试详情
        ResultVO<List<SubDetailVo>> resultVO;
        try {
            List<SubDetailVo> subDetails = examService.getSubDetail(id);
            resultVO = new ResultVO<>(0, "获取主观题详情成功", subDetails);
        } catch (Exception e) {
            resultVO = new ResultVO<>(-1, "获取主观题详情失败", null);
        }
        return resultVO;
    }
}
