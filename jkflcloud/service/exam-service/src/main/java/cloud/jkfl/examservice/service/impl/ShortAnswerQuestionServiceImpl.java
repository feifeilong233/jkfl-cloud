package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.ShortAnswerQuestionMapper;
import cloud.jkfl.examservice.pojo.ShortAnswerQuestion;
import cloud.jkfl.examservice.service.ShortAnswerQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShortAnswerQuestionServiceImpl
        extends ServiceImpl<ShortAnswerQuestionMapper, ShortAnswerQuestion>
        implements ShortAnswerQuestionService {

    @Autowired
    private ShortAnswerQuestionMapper shortAnswerQuestionMapper;

    @Override
    public List<Long> findBySubject(String saqSubject, Integer saqNumber) {
        return shortAnswerQuestionMapper.findBySubject(saqSubject, saqNumber);
    }

    @Override
    public List<ShortAnswerQuestion> findByIdAndType(Long id) {
        return shortAnswerQuestionMapper.findByIdAndType(id);
    }

    @Override
    public List<ShortAnswerQuestion> findListWithValue(String value) {
        return shortAnswerQuestionMapper.getListWithValue(value);
    }
}
