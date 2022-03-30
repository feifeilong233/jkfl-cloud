package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.MultipleQuestionMapper;
import cloud.jkfl.examservice.pojo.MultipleQuestion;
import cloud.jkfl.examservice.service.MultipleQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MultipleQuestionServiceImpl
        extends ServiceImpl<MultipleQuestionMapper, MultipleQuestion>
        implements MultipleQuestionService {

    @Autowired
    private MultipleQuestionMapper multipleQuestionMapper;


    @Override
    public List<Long> findBySubject(String subject, Integer multipleNumber) {
        return multipleQuestionMapper.findBySubject(subject, multipleNumber);
    }

    @Override
    public List<MultipleQuestion> findByIdAndType(Long id) {
        return multipleQuestionMapper.findByIdAndType(id);
    }

    @Override
    public List<MultipleQuestion> findListWithValue(String value) {
        return multipleQuestionMapper.getListWithValue(value);
    }
}
