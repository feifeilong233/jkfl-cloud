package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.SelectQuestionMapper;
import cloud.jkfl.examservice.pojo.SelectQuestion;
import cloud.jkfl.examservice.service.SelectQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SelectQuestionServiceImpl extends ServiceImpl<SelectQuestionMapper, SelectQuestion> implements SelectQuestionService {

    @Autowired
    private SelectQuestionMapper selectQuestionMapper;

    @Override
    public SelectQuestion findOnlyQuestionId() {
        return selectQuestionMapper.findOnlyQuestionId();
    }

    @Override
    public List<SelectQuestion> findByIdAndType(Long paperId) {
        return selectQuestionMapper.findByIdAndType(paperId);
    }

    @Override
    public List<Long> findBySubject(String subject, Integer selectNumber) {
        return selectQuestionMapper.findBySubject(subject, selectNumber);
    }

    @Override
    public List<SelectQuestion> findListWithValue(String value) {
        return selectQuestionMapper.getListWithValue(value);
    }


}
