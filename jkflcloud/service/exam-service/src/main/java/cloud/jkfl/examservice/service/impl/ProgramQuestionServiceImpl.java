package cloud.jkfl.examservice.service.impl;

import cloud.jkfl.examservice.mapper.ProgramQuestionMapper;
import cloud.jkfl.examservice.pojo.ProgramQuestion;
import cloud.jkfl.examservice.service.ProgramQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProgramQuestionServiceImpl
        extends ServiceImpl<ProgramQuestionMapper, ProgramQuestion>
        implements ProgramQuestionService {

    @Autowired
    private ProgramQuestionMapper programQuestionMapper;

    @Override
    public List<Long> findBySubject(String pgSubject, String pqNumber) {
        return programQuestionMapper.findBySubject(pgSubject, pqNumber);
    }

    @Override
    public List<ProgramQuestion> findByIdAndType(Long id) {
        return programQuestionMapper.findByIdAndType(id);
    }

    @Override
    public List<ProgramQuestion> findListWithValue(String value) {
        return programQuestionMapper.getListWithValue(value);
    }
}
