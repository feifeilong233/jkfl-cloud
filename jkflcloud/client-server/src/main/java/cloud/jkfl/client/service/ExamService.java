/***********************************************************
 * @Description : 考试接口
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.service;

import cloud.jkfl.client.entity.Exam;
import cloud.jkfl.client.entity.ExamRecord;
import cloud.jkfl.client.vo.*;

import java.util.HashMap;
import java.util.List;

public interface ExamService {
    /**
     * 获取问题详情
     *
     * @param id 问题的id
     * @return 问题详情的封装VO
     */
    QuestionDetailVo getSelectQuestionDetail(Long id, Integer type);

    /**
     * 获取全部考试的列表
     */
    List<ExamVo> getExamAll();

    /**
     * 获取考试卡片列表
     *
     * @return 考试卡片列表
     */
    List<ExamCardVo> getExamCardList();

    /**
     * 根据考试的id获取考试的详情
     *
     * @param id exam表的主键
     * @return 考试详情的封装的VO对象
     */
    ExamDetailVo getExamDetail(Long id);

    List<SubDetailVo> getSubDetail(Long id);

    /**
     * 根据用户提交的作答信息进行判分
     *
     * @param userId     考试人
     * @param examId     参与的考试
     * @param answersMap 作答情况
     * @return 本次考试记录
     */
    ExamRecord judge(String userId, Long examId, HashMap<Long, List<String>> answersMap);

    /**
     * 根据用户id获取此用户的所有考试信息
     *
     * @param userId 用户id
     * @return 该用户的所有考试记录
     */
    List<ExamRecordVo> getExamRecordList(String userId);

    /**
     * 获取指定某次考试记录的详情
     *
     * @param recordId 考试记录的id
     * @return 考试详情
     */
    RecordDetailVo getRecordDetail(String recordId);

    ExamRecord saveSubDetail(String userId, String recordId, HashMap<Long, SubDetailVo> subMap);
}
