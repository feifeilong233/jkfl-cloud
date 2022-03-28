package cloud.jkfl.examservice.service;

import cloud.jkfl.examservice.pojo.SelectQuestion;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

public interface SelectQuestionService extends IService<SelectQuestion> {
    public abstract SelectQuestion findOnlyQuestionId();

    public abstract List<SelectQuestion> findByIdAndType(Long paperId);

    public abstract List<Long> findBySubject(String subject, Integer selectNumber);

    List<SelectQuestion> findListWithValue(String value);
}
