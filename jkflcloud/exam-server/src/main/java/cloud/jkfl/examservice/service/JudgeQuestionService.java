package cloud.jkfl.examservice.service;


import cloud.jkfl.examservice.pojo.JudgeQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface JudgeQuestionService extends IService<JudgeQuestion> {
    public abstract JudgeQuestion findOnlyQuestion();

    public abstract List<JudgeQuestion> findByIdAndType(Long id);

    public abstract List<Long> findBySubject(String subject, Integer judgeNumber);


    List<JudgeQuestion> findListWithValue(String value);
}
