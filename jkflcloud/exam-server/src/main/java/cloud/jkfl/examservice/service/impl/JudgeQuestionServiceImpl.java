package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.JudgeQuestionMapper;
import cloud.jkfl.examservice.pojo.JudgeQuestion;
import cloud.jkfl.examservice.service.JudgeQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JudgeQuestionServiceImpl extends ServiceImpl<JudgeQuestionMapper, JudgeQuestion> implements JudgeQuestionService {

    @Autowired
    private JudgeQuestionMapper judgeQuestionMapper;

    @Override
    public JudgeQuestion findOnlyQuestion() {
        return judgeQuestionMapper.findOnlyQuestion();
    }

    @Override
    public List<JudgeQuestion> findByIdAndType(Long id) {
        return judgeQuestionMapper.findByIdAndType(id);
    }

    @Override
    public List<Long> findBySubject(String subject, Integer judgeNumber) {
        return judgeQuestionMapper.findBySubject(subject, judgeNumber);
    }

    @Override
    public List<JudgeQuestion> findListWithValue(String value) {
        return judgeQuestionMapper.getListWithValue(value);
    }


}
