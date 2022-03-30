package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.ShortAnswerQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface ShortAnswerQuestionService extends IService<ShortAnswerQuestion> {
    List<Long> findBySubject(String saqSubject, Integer saqNumber);

    List<ShortAnswerQuestion> findByIdAndType(Long id);

    List<ShortAnswerQuestion> findListWithValue(String value);
}
