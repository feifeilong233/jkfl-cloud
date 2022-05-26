/***********************************************************
 * @Description : 考试服务接口实现
 * @author      : jkfl


 ***********************************************************/
package cloud.jkfl.client.service.impl;

import cloud.jkfl.client.entity.*;
import cloud.jkfl.client.repository.*;
import cloud.jkfl.client.service.ExamService;
import cloud.jkfl.client.vo.*;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.StrUtil;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
@Transactional
public class ExamServiceImpl implements ExamService {

    private final ExamRepository examRepository;

    private final ExamRecordRepository examRecordRepository;

    private final SelectQuestionRepository selectQuestionRepository;

    private final MultipleQuestionRepository multipleQuestionRepository;

    private final JudgeQuestionRepository judgeQuestionRepository;

    private final UserRepository userRepository;

    private final PaperManageRepository paperManageRepository;

    private final InputQuestionRepository inputQuestionRepository;

    private final ShortAnswerQuestionRepository shortAnswerQuestionRepository;

    private final ProgramQuestionRepository programQuestionRepository;

    public ExamServiceImpl(SelectQuestionRepository selectQuestionRepository, MultipleQuestionRepository multipleQuestionRepository, JudgeQuestionRepository judgeQuestionRepository, UserRepository userRepository, ExamRepository examRepository, ExamRecordRepository examRecordRepository, PaperManageRepository paperManageRepository, InputQuestionRepository inputQuestionRepository, ShortAnswerQuestionRepository shortAnswerQuestionRepository, ProgramQuestionRepository programQuestionRepository) {
        this.selectQuestionRepository = selectQuestionRepository;
        this.multipleQuestionRepository = multipleQuestionRepository;
        this.judgeQuestionRepository = judgeQuestionRepository;
        this.userRepository = userRepository;
        this.examRepository = examRepository;
        this.examRecordRepository = examRecordRepository;
        this.paperManageRepository = paperManageRepository;
        this.inputQuestionRepository = inputQuestionRepository;
        this.shortAnswerQuestionRepository = shortAnswerQuestionRepository;
        this.programQuestionRepository = programQuestionRepository;
    }

    @Override
    public QuestionDetailVo getSelectQuestionDetail(Long id, Integer type) {
        List<QuestionOption> optionList = new ArrayList<>();
        QuestionOption A;
        QuestionOption B;
        QuestionOption C;
        QuestionOption D;
        QuestionDetailVo questionDetailVo = new QuestionDetailVo();
        if(type == 1)
        {
            SelectQuestion question = selectQuestionRepository.findById(id).orElse(null);
            questionDetailVo.setId(id);
            questionDetailVo.setSqScore(question.getSqScore());
            questionDetailVo.setName(question.getSqQuestion());
            questionDetailVo.setDescription(question.getSqAnalysis());
            // 问题类型，单选题/多选题/判断题
            questionDetailVo.setType("单选题");
            // 获取选项列表
            A = new QuestionOption("A",question.getSqAnswerA());
            B = new QuestionOption("B",question.getSqAnswerB());
            C = new QuestionOption("C",question.getSqAnswerC());
            D = new QuestionOption("D",question.getSqAnswerD());
        }
        else if (type == 2)
        {
            MultipleQuestion question = multipleQuestionRepository.findById(id).orElse(null);
            questionDetailVo.setId(id);
            questionDetailVo.setMqScore(question.getMqScore());
            questionDetailVo.setName(question.getMqQuestion());
            questionDetailVo.setDescription(question.getMqAnalysis());
            // 问题类型，单选题/多选题/判断题
            questionDetailVo.setType("多选题");
            // 获取选项列表
            A = new QuestionOption("A",question.getMqAnswerA());
            B = new QuestionOption("B",question.getMqAnswerB());
            C = new QuestionOption("C",question.getMqAnswerC());
            D = new QuestionOption("D",question.getMqAnswerD());
        }
        else
        {
            JudgeQuestion question = judgeQuestionRepository.findById(id).orElse(null);
            questionDetailVo.setId(id);
            questionDetailVo.setJqScore(question.getJqScore());
            questionDetailVo.setName(question.getJqQuestion());
            questionDetailVo.setDescription(question.getJqAnalysis());
            // 问题类型，单选题/多选题/判断题
            questionDetailVo.setType("判断题");
            // 获取选项列表
            A = new QuestionOption("T","正确");
            B = new QuestionOption("F","错误");
            C = null;
            D = null;
        }
        optionList.add(A);
        optionList.add(B);
        if(type == 1 || type == 2)
        {
            optionList.add(C);
            optionList.add(D);
        }
        questionDetailVo.setOptions(optionList);
        return questionDetailVo;
    }

    @Override
    public List<ExamVo> getExamAll() {
        List<Exam> examList = examRepository.findAll();
        return getExamVos(examList);
    }

    private List<ExamVo> getExamVos(List<Exam> examList) {
        // 需要自定义的exam列表
        List<ExamVo> examVoList = new ArrayList<>();
        // 循环完成每个属性的定制
        for (Exam exam : examList) {
            ExamVo examVo = new ExamVo();
            // 先尽量复制能复制的所有属性
            BeanUtils.copyProperties(exam, examVo);
            // 把examVo加到examVoList中
            examVoList.add(examVo);
        }
        return examVoList;
    }

    @Override
    public List<ExamCardVo> getExamCardList() {
        List<Exam> examList = examRepository.findAll();
        List<ExamCardVo> examCardVoList = new ArrayList<>();
        for (Exam exam : examList) {
            ExamCardVo examCardVo = new ExamCardVo();
            BeanUtils.copyProperties(exam, examCardVo);
            examCardVoList.add(examCardVo);
        }
        return examCardVoList;
    }

    @Override
    public ExamDetailVo getExamDetail(Long id) {
        Exam exam = examRepository.findByExamId(id);
        ExamDetailVo examDetailVo = new ExamDetailVo();
        examDetailVo.setExam(exam);
        assert exam != null;
        List<PaperManage> RatioList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),1);
        List<PaperManage> CheckList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),2);
        List<PaperManage> JudgeList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),3);
        List<PaperManage> iqList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),4);
        List<PaperManage> saqList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),5);
        List<PaperManage> pqList = paperManageRepository.findByPaperIdAndPaperQuestionType(exam.getPaperId(),6);
        List<Long> iqIds = new ArrayList<>();
        List<Long> saqIds = new ArrayList<>();
        List<Long> pqIds = new ArrayList<>();
        for(PaperManage p : iqList)
            iqIds.add(p.getPaperQuestionId());
        for(PaperManage p : saqList)
            saqIds.add(p.getPaperQuestionId());
        for(PaperManage p : pqList)
            pqIds.add(p.getPaperQuestionId());
        String[] RIds = new String[RatioList.size()];
        String[] CIds = new String[CheckList.size()];
        String[] JIds = new String[JudgeList.size()];
        for (int i = 0; i < RatioList.size();i++)
            RIds[i] = String.valueOf(RatioList.get(i).getPaperQuestionId());
        for (int i = 0; i < CheckList.size();i++)
            CIds[i] = String.valueOf(CheckList.get(i).getPaperQuestionId());
        for (int i = 0; i < JudgeList.size();i++)
            JIds[i] = String.valueOf(JudgeList.get(i).getPaperQuestionId());
        examDetailVo.setRadioIds(RIds);
        examDetailVo.setCheckIds(CIds);
        examDetailVo.setJudgeIds(JIds);
        examDetailVo.setIqIds(iqIds);
        examDetailVo.setSaqIds(saqIds);
        examDetailVo.setPqIds(pqIds);
        return examDetailVo;
    }

    public List<QuestionAnswerVo> getQuestionAnswer(List<Long> ids)
    {
        List<SelectQuestion> sqList = selectQuestionRepository.findAllById(ids);
        List<MultipleQuestion> mqList = multipleQuestionRepository.findAllById(ids);
        List<JudgeQuestion> jqList = judgeQuestionRepository.findAllById(ids);
        List<QuestionAnswerVo> questionAnswerVos = new ArrayList<>();
        for (SelectQuestion sq : sqList) {
            QuestionAnswerVo qA = new QuestionAnswerVo();
            qA.setQId(sq.getSqId());
            qA.setQAnswer(sq.getSqAnswer());
            questionAnswerVos.add(qA);
        }
        for (MultipleQuestion mq : mqList) {
            QuestionAnswerVo qA = new QuestionAnswerVo();
            qA.setQId(mq.getMqId());
            qA.setQAnswer(mq.getMqAnswer());
            questionAnswerVos.add(qA);
        }
        for (JudgeQuestion jq : jqList) {
            QuestionAnswerVo qA = new QuestionAnswerVo();
            qA.setQId(jq.getJqId());
            qA.setQAnswer(jq.getJqAnswer());
            questionAnswerVos.add(qA);
        }
        return questionAnswerVos;
    }

    @Override
    public ExamRecord judge(String userId, Long examId, HashMap<Long, List<String>> answersMap) {
        // 开始考试判分啦~~~
        // 1.首先获取考试对象和选项数组
        ExamDetailVo examDetailVo = getExamDetail(examId);
        // 2.然后获取该考试下所有的题目信息
        List<Long> questionIds = new ArrayList<>();
        // 2.1 题目id的数组
        List<Long> radioIdList = new ArrayList<>();
        List<Long> checkIdList = new ArrayList<>();
        List<Long> judgeIdList = new ArrayList<>();
        String[] RIds = examDetailVo.getRadioIds();
        String[] CIds = examDetailVo.getCheckIds();
        String[] JIds = examDetailVo.getJudgeIds();
        for (int i = 0; i < RIds.length; i++)
            radioIdList.add(Long.valueOf(RIds[i]));
        for (int i = 0; i < CIds.length; i++)
            checkIdList.add(Long.valueOf(CIds[i]));
        for (int i = 0; i < JIds.length; i++)
            judgeIdList.add(Long.valueOf(JIds[i]));
        questionIds.addAll(radioIdList);
        questionIds.addAll(checkIdList);
        questionIds.addAll(judgeIdList);

        // 2.2 每种题目的分数
        int radioScore = 2;
        int checkScore = 4;
        int judgeScore = 2;
        // 2.3 根据问题id的数组拿到所有的问题对象，供下面步骤用
        List<QuestionAnswerVo> questionAnswerVos = getQuestionAnswer(questionIds);
        Map<Long, QuestionAnswerVo> qMap = new HashMap<>();
        for (QuestionAnswerVo question : questionAnswerVos) {
            qMap.put(question.getQId(), question);
        }
        // 3.根据正确答案和用户作答信息进行判分
        Set<Long> questionIdsAnswer = answersMap.keySet();
        // 存储当前考试每个题目的得分情况
        Map<Long, Integer> judgeMap = new HashMap<>();
        // 考生作答地每个题目的选项(题目和题目之间用$分隔，题目有多个选项地话用-分隔,题目和选项之间用_分隔),用于查看考试详情
        // 例子：题目1的id_作答选项1-作答选项2$题目2的id_作答选项1$题目3_作答选项1-作答选项2-作答选项3
        StringBuilder answerOptionIdsSb = new StringBuilder();
        // 用户此次考试的总分
        int totalScore = 0;
        for (Long questionId : questionIdsAnswer) {
            // 获取用户作答地这个题的答案信息
            QuestionAnswerVo question = qMap.get(questionId);
            // 获取答案选项
            String sqAnswerOptionIds = question.getQAnswer();
            List<String> sqAnswerOptionIdList = Arrays.asList(sqAnswerOptionIds.split(","));
            String answerStr = listConcat(sqAnswerOptionIdList);
            // 获取用户作答
            List<String> questionUserOptionIdList = answersMap.get(questionId);
            Collections.sort(questionUserOptionIdList);
            String userStr = listConcat(questionUserOptionIdList);

            // 判断questionAnswerOptionIds和answersMap里面的答案是否相等
            if (answerStr.equals(userStr)) {
                // 说明题目作答正确,下面根据题型给分
                int score = 0;
                if (radioIdList.contains(questionId)) {
                    score = radioScore;
                }
                if (checkIdList.contains(questionId)) {
                    score = checkScore;
                }
                if (judgeIdList.contains(questionId)) {
                    score = judgeScore;
                }
                // 累计本次考试得分
                totalScore += score;
                // True代表题目答对
                answerOptionIdsSb.append(questionId + "@True_" + userStr + "$");
                judgeMap.put(questionId, score);
            } else {
                // 说明题目作答错误,直接判零分,False代表题目答错
                answerOptionIdsSb.append(questionId + "@False_" + userStr + "$");
                judgeMap.put(questionId, 0);
            }
        }
        // 4.计算得分，记录本次考试结果，存到ExamRecord中
        ExamRecord examRecord = new ExamRecord();
        examRecord.setExamRecordId(IdUtil.simpleUUID());
        examRecord.setExamId(examId);
        // 注意去掉最后可能有的&_-
        examRecord.setAnswerOptionIds(replaceLastSeparator(answerOptionIdsSb.toString()));
        examRecord.setExamJoinerId(userId);
        examRecord.setExamJoinDate(new Date());
        examRecord.setExamJoinScore(totalScore);
        examRecord.setExamSubScore(-1);
        examRecordRepository.save(examRecord);
        return examRecord;
    }

    /**
     * 把字符串最后一个字符-替换掉
     *
     * @param str 原始字符串
     * @return 替换掉最后一个-的字符串
     */
    private String replaceLastSeparator(String str) {
        if(str.length() != 0)
        {
            String lastChar = str.substring(str.length() - 1);
            // 题目和题目之间用$分隔，题目有多个选项地话用-分隔,题目和选项之间用_分隔
            if ("-".equals(lastChar) || "_".equals(lastChar) || "$".equals(lastChar)) {
                str = StrUtil.sub(str, 0, str.length() - 1);
            }
        }
        return str;
    }

    /**
     * 把字符串用-连接起来
     *
     * @param strList 字符串列表
     * @return 拼接好的字符串，记住要去掉最后面的-
     */
    private String listConcat(List<String> strList) {
        StringBuilder sb = new StringBuilder();
        for (String str : strList) {
            sb.append(str);
            sb.append("-");
        }
        return replaceLastSeparator(sb.toString());
    }

    @Override
    public List<ExamRecordVo> getExamRecordList(String userId) {
        // 获取指定用户下的考试记录列表
        List<ExamRecord> examRecordList = examRecordRepository.findByExamJoinerIdOrderByExamJoinDateDesc(userId);
        List<ExamRecordVo> examRecordVoList = new ArrayList<>();
        for (ExamRecord examRecord : examRecordList) {
            ExamRecordVo examRecordVo = new ExamRecordVo();
            Exam exam = examRepository.findByExamId(examRecord.getExamId());
            examRecordVo.setExam(exam);
            User user = userRepository.findById(userId).orElse(null);
            examRecordVo.setUser(user);
            examRecordVo.setExamRecord(examRecord);
            examRecordVo.setExamId(exam.getExamId());
            examRecordVoList.add(examRecordVo);
        }
        return examRecordVoList;
    }

    @Override
    public RecordDetailVo getRecordDetail(String recordId) {
        // 获取考试详情的封装对象
        ExamRecord record = examRecordRepository.findById(recordId).orElse(null);
        RecordDetailVo recordDetailVo = new RecordDetailVo();
        recordDetailVo.setExamRecord(record);
        // 用户的答案，需要解析
        HashMap<String, List<String>> answersMap = new HashMap<>();
        HashMap<String, String> resultsMap = new HashMap<>();
        assert record != null;
        String answersStr = record.getAnswerOptionIds();
        // $分隔题目,因为$在正则中有特殊用途(行尾)，所以需要括起来
        String[] questionArr = answersStr.split("[$]");
        for (String questionStr : questionArr) {
            System.out.println(questionStr);
            // 区分开题目标题和选项
            String[] questionTitleResultAndOption = questionStr.split("_");
            String[] questionTitleAndResult = questionTitleResultAndOption[0].split("@");
            String[] questionOptions = questionTitleResultAndOption[1].split("-");
            // 题目：答案选项
            answersMap.put(questionTitleAndResult[0], Arrays.asList(questionOptions));
            // 题目：True / False
            resultsMap.put(questionTitleAndResult[0], questionTitleAndResult[1]);
        }
        recordDetailVo.setAnswersMap(answersMap);
        recordDetailVo.setResultsMap(resultsMap);
        // 下面再计算正确答案的map
        ExamDetailVo examDetailVo = getExamDetail(record.getExamId());
        List<Long> questionIdList = new ArrayList<>();
        List<Long> radioIdList = new ArrayList<>();
        List<Long> checkIdList = new ArrayList<>();
        List<Long> judgeIdList = new ArrayList<>();
        String[] RIds = examDetailVo.getRadioIds();
        String[] CIds = examDetailVo.getCheckIds();
        String[] JIds = examDetailVo.getJudgeIds();
        for (int i = 0; i < RIds.length; i++)
            radioIdList.add(Long.valueOf(RIds[i]));
        for (int i = 0; i < CIds.length; i++)
            checkIdList.add(Long.valueOf(CIds[i]));
        for (int i = 0; i < JIds.length; i++)
            judgeIdList.add(Long.valueOf(JIds[i]));
        questionIdList.addAll(radioIdList);
        questionIdList.addAll(checkIdList);
        questionIdList.addAll(judgeIdList);
        // 获取所有的问题对象
        List<QuestionAnswerVo> questionList = getQuestionAnswer(questionIdList);
        HashMap<Long, List<String>> answersRightMap = new HashMap<>();
        for (QuestionAnswerVo question : questionList) {
            // 记得去掉最后可能出现的特殊字符
            String sqAnswerOptionIds = question.getQAnswer();
            String[] questionAnswerOptionIds = sqAnswerOptionIds.split(",");
            answersRightMap.put(question.getQId(), Arrays.asList(questionAnswerOptionIds));
        }
        recordDetailVo.setAnswersRightMap(answersRightMap);
        return recordDetailVo;
    }

    @Override
    public List<SubDetailVo> getSubDetail(Long id)
    {
        ExamDetailVo examDetailVo = getExamDetail(id);
        List<Long> iqIds = examDetailVo.getIqIds();
        List<Long> saqIds = examDetailVo.getSaqIds();
        List<Long> pqIds = examDetailVo.getPqIds();
        List<InputQuestion> iqList = inputQuestionRepository.findAllById(iqIds);
        List<ShortAnswerQuestion> saqList = shortAnswerQuestionRepository.findAllById(saqIds);
        List<ProgramQuestion> pqList = programQuestionRepository.findAllById(pqIds);
        List<SubDetailVo> subDetailVos = new ArrayList<>();
        for (InputQuestion q : iqList)
        {
            SubDetailVo subDetailVo = new SubDetailVo();
            subDetailVo.setType("填空题");
            subDetailVo.setIqScore(q.getIqScore());
            subDetailVo.setId(q.getIqId());
            subDetailVo.setName(q.getIqQuestion());
            subDetailVo.setDescription(q.getIqAnalysis());
            subDetailVos.add(subDetailVo);
        }
        for (ShortAnswerQuestion q : saqList)
        {
            SubDetailVo subDetailVo = new SubDetailVo();
            subDetailVo.setType("简答题");
            subDetailVo.setSaqScore(q.getSaqScore());
            subDetailVo.setId(q.getSaqId());
            subDetailVo.setName(q.getSaqQuestion());
            subDetailVo.setDescription(q.getSaqAnalysis());
            subDetailVos.add(subDetailVo);
        }
        for (ProgramQuestion q : pqList)
        {
            SubDetailVo subDetailVo = new SubDetailVo();
            subDetailVo.setType("程序题");
            subDetailVo.setPqScore(q.getPqScore());
            subDetailVo.setId(q.getPqId());
            subDetailVo.setName(q.getPqQuestion());
            subDetailVo.setDescription(q.getPqAnalysis());
            subDetailVos.add(subDetailVo);
        }
        return subDetailVos;
    }

    @Override
    public ExamRecord saveSubDetail(String userId, String recordId, HashMap<Long, SubDetailVo> subMap)
    {
        // 根据正确答案和用户作答信息进行判分
        Set<Long> subMapAnswer = subMap.keySet();
        // 考生作答地每个题目的选项(题目和题目之间用$$分隔，题目和答案之间用__分隔),用于查看考试详情
        StringBuilder inputAnswerSb = new StringBuilder();
        StringBuilder shortAnswerSb = new StringBuilder();
        StringBuilder programAnswerSb = new StringBuilder();
        // 用户此次考试的总分
        for (Long subMapId : subMapAnswer) {
            // 获取用户作答地这个题的答案信息
            SubDetailVo subDetail = subMap.get(subMapId);
            String userAnswerStr = subDetail.getAnswer();
            if(subDetail.getType().equals("填空题")) {
                inputAnswerSb.append(subMapId + "__" + userAnswerStr + "$$");
            }
            else if (subDetail.getType().equals("程序题")) {
                programAnswerSb.append(subMapId + "__" + userAnswerStr + "$$");
            }else {
                shortAnswerSb.append(subMapId + "__" + userAnswerStr + "$$");
            }
        }
        // 记录本次考试结果，存到ExamRecord中
        ExamRecord examRecord = examRecordRepository.findById(recordId).orElse(null);
        // 注意去掉最后可能有的$_
        User user = userRepository.findById(userId).orElse(null);
        examRecord.setExamJoinerClass(user.getClassId());
        examRecord.setExamInputAnswer(replaceLastSeparator(replaceLastSeparator(inputAnswerSb.toString())));
        examRecord.setExamShortAnswer(replaceLastSeparator(replaceLastSeparator(shortAnswerSb.toString())));
        examRecord.setExamProgramAnswer(replaceLastSeparator(replaceLastSeparator(programAnswerSb.toString())));
        System.out.println(examRecord.getExamProgramAnswer());
        examRecordRepository.save(examRecord);
        return examRecord;
    }
}
