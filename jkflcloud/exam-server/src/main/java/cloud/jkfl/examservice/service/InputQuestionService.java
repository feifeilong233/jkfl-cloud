package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.InputQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface InputQuestionService extends IService<InputQuestion> {

    public abstract InputQuestion findOnlyQuestionId();

    public abstract List<InputQuestion> findByIdAndType(Long paperId);

    public abstract List<Long> findBySubject(String subject, Integer inputNumber);


    List<InputQuestion> findListWithValue(String value);
}
