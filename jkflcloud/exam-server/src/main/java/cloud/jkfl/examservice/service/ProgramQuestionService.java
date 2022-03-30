package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.ProgramQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ProgramQuestionService extends IService<ProgramQuestion> {
    List<Long> findBySubject(String pgSubject, String pqNumber);

    List<ProgramQuestion> findByIdAndType(Long id);

    List<ProgramQuestion> findListWithValue(String value);
}
