package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.MultipleQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface MultipleQuestionService extends IService<MultipleQuestion> {

    public abstract List<Long> findBySubject(String subject, Integer multipleNumber);

    List<MultipleQuestion> findByIdAndType(Long id);

    List<MultipleQuestion> findListWithValue(String value);
}
