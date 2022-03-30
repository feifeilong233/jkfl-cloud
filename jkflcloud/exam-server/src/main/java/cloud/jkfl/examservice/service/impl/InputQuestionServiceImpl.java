package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.InputQuestionMapper;
import cloud.jkfl.examservice.pojo.InputQuestion;
import cloud.jkfl.examservice.service.InputQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InputQuestionServiceImpl extends ServiceImpl<InputQuestionMapper, InputQuestion> implements InputQuestionService {


    @Autowired
    private InputQuestionMapper inputQuestionMapper;


    @Override
    public InputQuestion findOnlyQuestionId() {
        return inputQuestionMapper.findOnlyQuestionId();
    }

    @Override
    public List<InputQuestion> findByIdAndType(Long paperId) {
        return inputQuestionMapper.findByIdAndType(paperId);
    }

    @Override
    public List<Long> findBySubject(String subject, Integer inputNumber) {
        return inputQuestionMapper.findBySubject(subject,inputNumber);
    }

    @Override
    public List<InputQuestion> findListWithValue(String value) {
        return inputQuestionMapper.getListWithValue(value);
    }
}
